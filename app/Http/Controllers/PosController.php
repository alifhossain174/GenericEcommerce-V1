<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use App\Models\User;
use Carbon\Carbon;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class PosController extends Controller
{
    public function createNewOrder(){
        $categories = Category::where('status', 1)->orderBy('name', 'asc')->get();
        $brands = Brand::where('status', 1)->orderBy('name', 'asc')->get();
        $products = Product::where('status', 1)->orderBy('name', 'asc')->get();
        $customers = User::where('user_type', 3)->orderBy('name', 'asc')->get();
        return view('backend.orders.pos.create', compact('categories', 'brands', 'products', 'customers'));
    }

    public function productLiveSearch(Request $request){

        $query = Product::where('status', 1);
        if($request->product_name){
            $query->where('name', 'LIKE', '%'.$request->product_name.'%');
        }
        if($request->category_id){
            // $query->where('category_id', $request->category_id);
            $query->whereRaw("FIND_IN_SET(?, category_id)", [$request->category_id]);
        }
        if($request->brand_id){
            $query->where('brand_id', $request->brand_id);
        }
        $products = $query->orderBy('name', 'asc')->get();

        $searchResults = view('backend.orders.pos.live_search_products', compact('products'))->render();
        return response()->json(['searchResults' => $searchResults]);
    }

    public function addToCart(Request $request){

        if($request->color_id > 0 || $request->size_id > 0){

            $query = DB::table('product_variants')
                            ->leftJoin('products', 'product_variants.product_id', 'products.id')
                            ->leftJoin('colors', 'product_variants.color_id', 'colors.id')
                            ->leftJoin('product_sizes', 'product_variants.size_id', 'product_sizes.id')
                            ->select('product_variants.*', 'products.image as product_image', 'products.name as product_name', 'colors.name as color_name', 'product_sizes.name as size_name');

            if($request->color_id > 0){
                $query->where('product_variants.color_id', $request->color_id);
            }
            if($request->size_id > 0){
                $query->where('product_variants.size_id', $request->size_id);
            }
            $productInfo = $query->where('product_variants.product_id', $request->product_id)->first();

            $cart = session()->get('cart', []);
            $productKey = $request->product_id."_".$request->color_id."_".$request->size_id;

            if(isset($cart[$productKey])) {
                $cart[$productKey]['quantity']++;
            } else {
                $cart[$productKey] = [
                    "product_id" => $productInfo->product_id,
                    "name" => $productInfo->product_name,
                    "quantity" => 1,
                    "price" => $productInfo->discounted_price > 0 ? $productInfo->discounted_price : $productInfo->price,
                    "image" => $productInfo->product_image,
                    "color_id" => $request->color_id,
                    "color_name" => $productInfo->color_name,
                    "size_id" => $request->size_id,
                    "size_name" => $productInfo->size_name
                ];
            }

        } else {
            $productInfo = Product::where('id', $request->product_id)->first();

            $cart = session()->get('cart', []);
            $productKey = $request->product_id."_".$request->color_id."_".$request->size_id;
            if(isset($cart[$productKey])) {
                $cart[$productKey]['quantity']++;
            } else {
                $cart[$productKey] = [
                    "product_id" => $productInfo->id,
                    "name" => $productInfo->name,
                    "quantity" => 1,
                    "price" => $productInfo->discount_price > 0 ? $productInfo->discount_price : $productInfo->price,
                    "image" => $productInfo->image,
                    "color_id" => null,
                    "color_name" => null,
                    "size_id" => null,
                    "size_name" => null
                ];
            }
        }

        session()->put('cart', $cart);
        $returnHTML = view('backend.orders.pos.cart_items')->render();
        $cartCalculationHTML = view('backend.orders.pos.cart_calculation')->render();
        return response()->json([
            'rendered_cart' => $returnHTML,
            'cart_calculation' => $cartCalculationHTML,
        ]);

    }

    public function removeCartItem($cartIndex){
        $cart = session()->get('cart');
        if(isset($cart[$cartIndex])) {
            unset($cart[$cartIndex]);
            session()->put('cart', $cart);
        }

        $returnHTML = view('backend.orders.pos.cart_items')->render();
        $cartCalculationHTML = view('backend.orders.pos.cart_calculation')->render();
        return response()->json([
            'rendered_cart' => $returnHTML,
            'cart_calculation' => $cartCalculationHTML,
        ]);
    }

    public function updateCartItem($cartIndex, $qty){
        $cart = session()->get('cart');
        if(isset($cart[$cartIndex])) {
            $cart[$cartIndex]['quantity'] = $qty;
            session()->put('cart', $cart);
        }

        $returnHTML = view('backend.orders.pos.cart_items')->render();
        $cartCalculationHTML = view('backend.orders.pos.cart_calculation')->render();
        return response()->json([
            'rendered_cart' => $returnHTML,
            'cart_calculation' => $cartCalculationHTML,
        ]);
    }

    public function saveNewCustomer(Request $request){
        User::insert([
            'name' => $request->customer_name,
            'phone' => $request->customer_phone,
            'email' => $request->customer_email,
            'email_verified_at' => Carbon::now(),
            'verification_code' => 000000,
            'password' => Hash::make($request->password),
            'user_type' => 3,
            'balance' => 0,
            'status' => 1,
            'created_at' => Carbon::now()
        ]);

        Toastr::success('New Customer Created', 'Success');
        return back();
    }

    public function updateOrderTotal($shipping_charge, $discount){

        $shipping_charge = is_numeric($shipping_charge) ? $shipping_charge : 0;
        $discount = is_numeric($discount) ? $discount : 0;

        session(['shipping_charge' => $shipping_charge]);
        session(['pos_discount' => $discount]);
        $cartCalculationHTML = view('backend.orders.pos.cart_calculation')->render();
        return response()->json([
            'cart_calculation' => $cartCalculationHTML
        ]);
    }

}
