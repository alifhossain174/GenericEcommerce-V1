<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use App\Models\Category;
use App\Models\ChildCategory;
use App\Models\Color;
use App\Models\Store;
use App\Models\Flag;
use App\Models\Product;
use App\Models\ProductImage;
use App\Models\ProductReview;
use App\Models\ProductSize;
use App\Models\ProductVariant;
use App\Models\ProductWarrenty;
use App\Models\Subcategory;
use App\Models\ProductModel;
use App\Models\OrderDetails;
use App\Models\ProductQuestionAnswer;
use App\Models\Unit;
use Illuminate\Support\Facades\DB;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Sohibd\Laravelslug\Generate;
use Illuminate\Support\Str;
use Intervention\Image\Facades\Image;
use Yajra\DataTables\DataTables;
use App\Imports\ProductImport;
use App\Imports\BulkProductUpdate;
use DateTime;
use Maatwebsite\Excel\Facades\Excel;

use Faker\Generator;
use Illuminate\Container\Container;

class ProductController extends Controller
{
    public function addNewProduct()
    {
        return view('backend.product.create');
    }

    public function childcategorySubcategoryWise(Request $request)
    {
        $data = ChildCategory::where("subcategory_id", $request->subcategory_id)->where('status', 1)->select('name', 'id')->get();
        return response()->json($data);
    }

    public function saveNewProduct(Request $request)
    {

        if ($request->status != 2) { //when save as draft
            $request->validate([
                'name' => ['required', 'string', 'max:255'],
                'category_id' => 'required|array',
                'image' => 'required',
            ]);
        }

        $image = null;
        if ($request->hasFile('image')) {
            $get_image = $request->file('image');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('productImages/');

            if ($get_image->getClientOriginalExtension() == 'svg') {
                $get_image->move($location, $image_name);
            } else {
                Image::make($get_image)->save($location . $image_name, 60);
            }

            $image = "productImages/" . $image_name;
        }

        $clean = preg_replace('/[^a-zA-Z0-9\s]/', '', strtolower($request->name)); //remove all non alpha numeric
        $slug = preg_replace('!\s+!', '-', $clean);

        $product = new Product();
        $product->name = $request->name;
        $product->short_description = $request->short_description;
        $product->description = $request->description;
        $product->tags = $request->tags;
        $product->video_url = $request->video_url;
        $product->store_id = isset($request->store_id) ? $request->store_id : null;
        $product->category_id = json_encode($request->category_id);
        $product->subcategory_id = $request->subcategory_id;
        $product->childcategory_id = $request->childcategory_id;
        $product->image = $image;
        $product->flag_id = $request->flag_id;
        $product->slug = $slug . "-" . time() . str::random(5);
        $product->status = $request->status;
        $product->unit_id = isset($request->unit_id) ? $request->unit_id : null;
        $product->specification = $request->specification;
        $product->warrenty_policy = $request->warrenty_policy;
        $product->brand_id = $request->brand_id;
        $product->model_id = $request->model_id;
        $product->warrenty_id = $request->warrenty_id;
        $product->code = $request->code;
        $product->reward_points = $request->reward_points;

        $product->special_offer = $request->special_offer == 1 ? 1 : 0;
        $product->offer_end_time = date("Y-m-d H:i", strtotime($request->offer_end_time)) . ":00";

        $product->meta_title = $request->meta_title;
        $product->meta_keywords = $request->meta_keywords;
        $product->meta_description = $request->meta_description;
        $product->created_at = Carbon::now();


        if ($request->has_variant == 1) {

            //variant specific
            $product->price = 0;
            $product->discount_price = 0;
            $product->cost_price = 0;
            $product->stock = 0;
            $product->has_variant = 1;
            //variant specific

            $i = 0;
            foreach ($request->product_variant_price as $price_id) {

                $name = NULL;
                if (isset($request->file('product_variant_image')[$i]) && $request->file('product_variant_image')[$i]) {
                    $name = time() . str::random(5) . '.' . $request->file('product_variant_image')[$i]->extension();
                    $location = public_path('productImages/');
                    $get_image = $request->file('product_variant_image')[$i];

                    if ($request->file('product_variant_image')[$i]->extension() == 'svg') {
                        $get_image->move($location, $name);
                    } else {
                        Image::make($get_image)->save($location . $name, 60);
                    }
                }

                if ($i == 0) { // saving the base variant price & warrenty As product main price & warrenty for filtering
                    $product->price = $request->product_variant_price[$i];
                    $product->discount_price = $request->product_variant_discounted_price[$i];
                    $product->cost_price = $request->product_variant_cost_price[$i];
                    $product->warrenty_id = isset($request->product_variant_warrenty[$i]) ? $request->product_variant_warrenty[$i] : $request->warrenty_id;
                    $product->save();
                }

                ProductVariant::insert([
                    'product_id' => $product->id,
                    'image' => $name,
                    'color_id' => isset($request->product_variant_color_id[$i]) ? $request->product_variant_color_id[$i] : null,
                    'unit_id' => isset($request->product_variant_unit_id[$i]) ? $request->product_variant_unit_id[$i] : null,
                    'size_id' => isset($request->product_variant_size_id[$i]) ? $request->product_variant_size_id[$i] : null,
                    'region_id' => isset($request->product_variant_region_id[$i]) ? $request->product_variant_region_id[$i] : null,
                    'sim_id' => isset($request->product_variant_sim_id[$i]) ? $request->product_variant_sim_id[$i] : null,
                    'storage_type_id' => isset($request->product_variant_storage_type_id[$i]) ? $request->product_variant_storage_type_id[$i] : null,
                    'stock' => $request->product_variant_stock[$i],
                    'price' => $price_id,
                    'discounted_price' => $request->product_variant_discounted_price[$i],
                    'cost_price' => $request->product_variant_cost_price[$i],
                    'warrenty_id' => isset($request->product_variant_warrenty[$i]) ? $request->product_variant_warrenty[$i] : null,
                    'device_condition_id' => isset($request->product_variant_device_condition_id[$i]) ? $request->product_variant_device_condition_id[$i] : null,
                    'created_at' => Carbon::now()
                ]);
                $i++;
            }
        } else {

            //variant specific
            $product->price = $request->price > 0 ? $request->price : 0;
            $product->discount_price = $request->discount_price > 0 ? $request->discount_price : 0;
            $product->cost_price = $request->cost_price > 0 ? $request->cost_price : 0;
            $product->stock = $request->stock > 0 ? $request->stock : 0;
            $product->has_variant = 0;
            //variant specific

            $product->save();
        }

        // multiple image code start
        $files = [];
        if ($request->hasfile('photos')) {
            foreach ($request->file('photos') as $file) {
                $name = time() . str::random(5) . '.' . $file->extension();
                $location = public_path('productImages/');
                if ($file->extension() == 'svg') {
                    $file->move($location, $name);
                } else {
                    Image::make($file)->save($location . $name, 60);
                }
                $files[] = $name;
            }

            DB::table('products')->where('id', $product->id)->update([
                'multiple_images' => json_encode($files)
            ]);
        } else {
            DB::table('products')->where('id', $product->id)->update([
                'multiple_images' => NULL
            ]);
        }

        if (count($files) > 0) {
            foreach ($files as $file) {
                ProductImage::insert([
                    'product_id' => $product->id,
                    'image' => $file,
                    'created_at' => Carbon::now(),
                ]);
            }
        }
        // multiple image code end

        Toastr::success('Product is Inserted', 'Success');
        return back();
    }

    public function viewAllProducts(Request $request)
    {

        if ($request->ajax()) {

            ini_set('memory_limit', '8192M'); // 8GB RAM

            $query = DB::table('products')
                ->leftJoin('categories', 'products.category_id', '=', 'categories.id')
                ->leftJoin('flags', 'products.flag_id', '=', 'flags.id')
                ->leftJoin('stores', 'products.store_id', '=', 'stores.id')
                ->select('products.id', 'products.name', 'products.category_id', 'products.code', 'products.cost_price', 'products.price', 'products.discount_price', 'products.image', 'products.slug', 'products.status', 'products.has_variant', 'products.stock', 'stores.store_name', 'categories.name as category_name', 'flags.name as flag_name')
                ->orderBy('products.id', 'desc');

            // filter start from here
            if ($request->product_code != "") {
                $query->where('products.code', 'LIKE', '%' . $request->product_code . '%');
            }
            if ($request->product_name != "") {
                $query->where('products.name', 'LIKE', '%' . $request->product_name . '%');
            }
            if ($request->store_id != "") {
                $query->where('products.store_id', $request->store_id);
            }
            if ($request->brand_id != "") {
                $query->where('products.brand_id', $request->brand_id);
            }
            if ($request->flag_id != "") {
                $query->where('products.flag_id', $request->flag_id);
            }
            if ($request->category_id != "") {
                $query->whereRaw("FIND_IN_SET(?, category_id)", [$request->category_id]);
            }
            if ($request->has_variant != "") {
                $query->where('products.has_variant', $request->has_variant);
            }
            if ($request->create_date_range != '') {
                $dateRange = $request->create_date_range;
                list($startDateStr, $endDateStr) = explode(" - ", $dateRange);
                $startDate = DateTime::createFromFormat("M j, Y", trim($startDateStr));
                $endDate = DateTime::createFromFormat("M j, Y", trim($endDateStr));
                $formattedStartDate = $startDate ? $startDate->format("Y-m-d") . " 00:00:00" : null;
                $formattedEndDate = $endDate ? $endDate->format("Y-m-d") . " 23:59:59" : null;
                $query->whereBetween('products.created_at', [$formattedStartDate, $formattedEndDate]);
            }
            if ($request->status != "") {
                $query->where('products.status', $request->status);
            }
            // filter end here

            $data = $query->get();

            return Datatables::of($data)
                ->editColumn('image', function ($data) {
                    if (!$data->image || !file_exists(public_path('' . $data->image)))
                        return '';
                    else
                        return $data->image;
                })
                ->editColumn('name', function ($data) {
                    return substr($data->name, 0, 50);
                })
                ->editColumn('status', function ($data) {
                    if ($data->status == 1) {
                        return '<span class="btn btn-sm btn-success d-inline-block">Active</span>';
                    } elseif ($data->status == 2) {
                        return '<span class="btn btn-sm btn-warning d-inline-block">Draft</span>';
                    } else {
                        return '<span class="btn btn-sm btn-danger d-inline-block">Inactive</span>';
                    }
                })
                ->editColumn('category_id', function ($data) {

                    if ($data->category_id) {

                        $category = is_array(json_decode($data->category_id, true))
                            ? json_decode($data->category_id, true)
                            : [$data->category_id]; // Treat as an array if it's a single integer

                        $categoryStr = '';
                        foreach ($category as $cat) {
                            $categoryInfo = Category::where('id', $cat)->first();
                            if ($categoryInfo) {
                                $categoryStr .= $categoryInfo->name . ", ";
                            }
                        }

                        return rtrim($categoryStr, ", ");
                    }
                })
                ->editColumn('stock', function ($data) {
                    if ($data->has_variant == 1) {
                        $stockStr = '';
                        $variantInfo = ProductVariant::where('product_id', $data->id)->orderBy('id', 'asc')->get();
                        foreach ($variantInfo as $variant) {
                            $stockStr .= $variant->stock . ", ";
                        }

                        return rtrim($stockStr, ", ");
                    } else {
                        return $data->stock;
                    }
                })
                ->addIndexColumn()
                ->addColumn('action', function ($data) {
                    $link = env('APP_FRONTEND_URL') . "/product/details/" . $data->slug;
                    $btn = ' <a target="_blank" href="' . $link . '" class="mb-1 btn-sm btn-success rounded d-inline-block" title="For Frontend Product View"><i class="fa fa-eye"></i></a>';
                    $btn .= ' <a href="' . url('edit/product') . '/' . $data->slug . '" class="mb-1 btn-sm btn-warning rounded d-inline-block"><i class="fas fa-edit"></i></a>';
                    $btn .= ' <a href="' . url('duplicate/product') . '/' . $data->slug . '" class="mb-1 btn-sm btn-info rounded d-inline-block" title="Duplicate Product"><i class="fas fa-copy"></i></a>';
                    $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="' . $data->slug . '" data-original-title="Delete" class="btn-sm btn-danger rounded d-inline-block deleteBtn"><i class="fas fa-trash-alt"></i></a>';
                    return $btn;
                })
                ->rawColumns(['action', 'price', 'status'])
                ->make(true);
        }

        $stores = DB::table('stores')->orderBy('store_name', 'asc')->get();
        $categories = DB::table('categories')->orderBy('name', 'asc')->get();
        $brands = DB::table('brands')->orderBy('name', 'asc')->get();
        $flags = DB::table('flags')->orderBy('name', 'asc')->get();
        return view('backend.product.view', compact('stores', 'categories', 'brands', 'flags'));
    }

    public function deleteProduct($slug)
    {
        $data = Product::where('slug', $slug)->first();

        $orderExists = OrderDetails::where('product_id', $data->id)->first();
        if ($orderExists) {
            return response()->json(['success' => 'Product cannot be deleted', 'data' => 0]);
        }

        if ($data->image) {
            if (file_exists(public_path($data->image)) && $data->is_demo == 0) {
                unlink(public_path($data->image));
            }
        }

        $gallery = ProductImage::where('product_id', $data->id)->get();
        if (count($gallery) > 0 && $data->is_demo == 0) {
            foreach ($gallery as $img) {
                if ($img->image && file_exists(public_path('productImages/' . $img->image))) {
                    unlink(public_path('productImages/' . $img->image));
                }
                $img->delete();
            }
        }

        $variants = ProductVariant::where('product_id', $data->id)->orderBy('id', 'asc')->get();
        if (count($variants) > 0 && $data->is_demo == 0) {
            foreach ($variants as $img) {
                if ($img->image && file_exists(public_path('productImages/' . $img->image))) {
                    unlink(public_path('productImages/' . $img->image));
                }
                $img->delete();
            }
        }

        ProductQuestionAnswer::where('product_id', $data->id)->delete();
        ProductReview::where('product_id', $data->id)->delete();
        $data->delete();
        return response()->json(['success' => 'Product deleted successfully.', 'data' => 1]);
    }

    public function editProduct($slug)
    {
        $product = Product::where('slug', $slug)->first();
        $subcategories = Subcategory::where('category_id', $product->category_id)->select('name', 'id')->orderBy('name', 'asc')->get();
        $childcategories = ChildCategory::where('category_id', $product->category_id)->where('subcategory_id', $product->subcategory_id)->select('name', 'id')->orderBy('name', 'asc')->get();
        $productModels = ProductModel::where('brand_id', $product->brand_id)->select('name', 'id')->orderBy('name', 'asc')->get();
        $gallery = ProductImage::where('product_id', $product->id)->get();
        $productVariants = ProductVariant::where('product_id', $product->id)->orderBy('id', 'asc')->get();
        return view('backend.product.update', compact('product', 'gallery', 'subcategories', 'childcategories', 'productModels', 'productVariants'));
    }

    public function updateProduct(Request $request)
    {

        if ($request->status != 2) { //when save as draft
            $request->validate([
                'name' => 'required|max:255',
                'category_id' => 'required|array',
                'status' => 'required',
            ]);
        }

        $product = Product::where('id', $request->id)->first();

        $image = $product->image;
        if ($request->hasFile('image')) {

            if ($product->image != '' && file_exists(public_path($product->image))) {
                unlink(public_path($product->image));
            }

            $get_image = $request->file('image');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('productImages/');

            if ($get_image->getClientOriginalExtension() == 'svg') {
                $get_image->move($location, $image_name);
            } else {
                Image::make($get_image)->save($location . $image_name, 60);
            }

            $image = "productImages/" . $image_name;
        }

        $clean = preg_replace('/[^a-zA-Z0-9\s]/', '', strtolower($request->name)); //remove all non alpha numeric
        $slug = preg_replace('!\s+!', '-', $clean);

        $product->name = $request->name;
        $product->short_description = $request->short_description;
        $product->description = $request->description;
        $product->tags = $request->tags;
        $product->video_url = $request->video_url;
        $product->store_id = isset($request->store_id) ? $request->store_id : null;
        $product->category_id = json_encode($request->category_id);
        $product->subcategory_id = $request->subcategory_id;
        $product->childcategory_id = $request->childcategory_id;
        $product->image = $image;
        $product->specification = $request->specification;
        $product->warrenty_policy = $request->warrenty_policy;
        $product->brand_id = $request->brand_id;
        $product->model_id = $request->model_id;
        $product->code = $request->code;
        $product->reward_points = $request->reward_points;
        $product->unit_id = isset($request->unit_id) ? $request->unit_id : null;
        $product->warrenty_id = $request->warrenty_id;
        $product->status = $request->status;

        $product->special_offer = $request->special_offer == 1 ? 1 : 0;
        $product->offer_end_time = date("Y-m-d H:i", strtotime($request->offer_end_time)) . ":00";

        // $product->slug = $slug."-".time().str::random(5);
        $product->flag_id = $request->flag_id;
        $product->meta_title = $request->meta_title;
        $product->meta_keywords = $request->meta_keywords;
        $product->meta_description = $request->meta_description;
        $product->updated_at = Carbon::now();



        if ($request->has_variant == 1) {

            // $gallery = ProductImage::where('product_id', $request->id)->get();
            // if(count($gallery) > 0){
            //     foreach($gallery as $img){
            //         if(file_exists(public_path('productImages/'.$img->image))){
            //             unlink(public_path('productImages/'.$img->image));
            //         }
            //         $img->delete();
            //     }
            // }

            //variant specific
            $product->price = 0;
            $product->discount_price = 0;
            $product->cost_price = 0;
            $product->stock = 0;
            $product->multiple_images = NULL;
            $product->has_variant = 1;
            //variant specific

            $i = 0;
            foreach ($request->product_variant_price as $price_id) {


                if ($i == 0) { // saving the base variant price & warrenty As product main price & warrenty for filtering
                    $product->price = $request->product_variant_price[$i];
                    $product->discount_price = $request->product_variant_discounted_price[$i];
                    $product->cost_price = $request->product_variant_cost_price[$i];
                    $product->warrenty_id = isset($request->product_variant_warrenty[$i]) ? $request->product_variant_warrenty[$i] : $request->warrenty_id;
                    $product->save();
                }

                $product_variant_id = isset($request->product_variant_id[$i]) ? $request->product_variant_id[$i] : null;

                if ($product_variant_id) {

                    $variantInfo = ProductVariant::where('id', $product_variant_id)->first();

                    $name = $variantInfo->image;
                    if (isset($request->file('product_variant_image')[$i])) {
                        $name = time() . str::random(5) . '.' . $request->file('product_variant_image')[$i]->extension();
                        $location = public_path('productImages/');
                        $get_image = $request->file('product_variant_image')[$i];

                        if ($get_image->extension() == 'svg') {
                            $get_image->move($location, $name);
                        } else {
                            Image::make($get_image)->save($location . $name, 60);
                        }
                    }

                    $variantInfo->image = $name;
                    $variantInfo->color_id = isset($request->product_variant_color_id[$i]) ? $request->product_variant_color_id[$i] : null;
                    $variantInfo->unit_id = isset($request->product_variant_unit_id[$i]) ? $request->product_variant_unit_id[$i] : null;
                    $variantInfo->size_id = isset($request->product_variant_size_id[$i]) ? $request->product_variant_size_id[$i] : null;
                    $variantInfo->region_id = isset($request->product_variant_region_id[$i]) ? $request->product_variant_region_id[$i] : null;
                    $variantInfo->sim_id = isset($request->product_variant_sim_id[$i]) ? $request->product_variant_sim_id[$i] : null;
                    $variantInfo->storage_type_id = isset($request->product_variant_storage_type_id[$i]) ? $request->product_variant_storage_type_id[$i] : null;
                    $variantInfo->stock = $request->product_variant_stock[$i];
                    $variantInfo->price = $price_id;
                    $variantInfo->discounted_price = $request->product_variant_discounted_price[$i];
                    $variantInfo->cost_price = $request->product_variant_cost_price[$i];
                    $variantInfo->warrenty_id = isset($request->product_variant_warrenty[$i]) ? $request->product_variant_warrenty[$i] : null;
                    $variantInfo->device_condition_id = isset($request->product_variant_device_condition_id[$i]) ? $request->product_variant_device_condition_id[$i] : null;
                    $variantInfo->updated_at = Carbon::now();
                    $variantInfo->save();
                } else {

                    $name = NULL;
                    if (isset($request->file('product_variant_image')[$i]) && $request->file('product_variant_image')[$i]) {
                        $name = time() . str::random(5) . '.' . $request->file('product_variant_image')[$i]->extension();

                        $location = public_path('productImages/');
                        $get_image = $request->file('product_variant_image')[$i];

                        if ($get_image->extension() == 'svg') {
                            $get_image->move($location, $name);
                        } else {
                            Image::make($get_image)->save($location . $name, 60);
                        }
                    }

                    ProductVariant::insert([
                        'product_id' => $product->id,
                        'image' => $name,
                        'color_id' => isset($request->product_variant_color_id[$i]) ? $request->product_variant_color_id[$i] : null,
                        'unit_id' => isset($request->product_variant_unit_id[$i]) ? $request->product_variant_unit_id[$i] : null,
                        'size_id' => isset($request->product_variant_size_id[$i]) ? $request->product_variant_size_id[$i] : null,
                        'region_id' => isset($request->product_variant_region_id[$i]) ? $request->product_variant_region_id[$i] : null,
                        'sim_id' => isset($request->product_variant_sim_id[$i]) ? $request->product_variant_sim_id[$i] : null,
                        'storage_type_id' => isset($request->product_variant_storage_type_id[$i]) ? $request->product_variant_storage_type_id[$i] : null,
                        'stock' => $request->product_variant_stock[$i],
                        'price' => $price_id,
                        'discounted_price' => $request->product_variant_discounted_price[$i],
                        'cost_price' => $request->product_variant_cost_price[$i],
                        'warrenty_id' => isset($request->product_variant_warrenty[$i]) ? $request->product_variant_warrenty[$i] : null,
                        'device_condition_id' => isset($request->product_variant_device_condition_id[$i]) ? $request->product_variant_device_condition_id[$i] : null,
                        'created_at' => Carbon::now()
                    ]);
                }
                $i++;
            }
        } else {

            //variant specific
            $product->price = $request->price > 0 ? $request->price : 0;
            $product->discount_price = $request->discount_price > 0 ? $request->discount_price : 0;
            $product->cost_price = $request->cost_price > 0 ? $request->cost_price : 0;
            $product->stock = $request->stock > 0 ? $request->stock : 0;
            $product->has_variant = 0;
            //variant specific

            // delete all the variants
            $variants = ProductVariant::where('product_id', $request->id)->orderBy('id', 'asc')->get();
            if (count($variants) > 0) {
                foreach ($variants as $img) {
                    if (file_exists(public_path('productImages/' . $img->image))) {
                        unlink(public_path('productImages/' . $img->image));
                    }
                    $img->delete();
                }
            }
        }


        // multiple image code start
        $files = [];
        if (isset($request->old) && is_array($request->old) && count($request->old) > 0) {
            $oldImageIdArray = array();
            foreach ($request->old as $oldImage) {
                $oldImageIdArray[] = $oldImage;
            }

            $gallery = ProductImage::where('product_id', $product->id)->get();
            foreach ($gallery as $multipleImage) {
                if (!in_array($multipleImage->id, $oldImageIdArray)) {
                    if (file_exists(public_path('productImages/' . $multipleImage->image))) {
                        unlink(public_path('productImages/' . $multipleImage->image));
                    }
                    ProductImage::where('id', $multipleImage->id)->delete();
                } else {
                    $files[] = $multipleImage->image;
                }
            }
        } else {
            ProductImage::where('product_id', $product->id)->delete();
        }


        if ($request->hasfile('photos')) {
            foreach ($request->file('photos') as $file) {
                $name = time() . str::random(5) . '.' . $file->extension();
                $location = public_path('productImages/');

                if ($file->extension() == 'svg') {
                    $file->move($location, $name);
                } else {
                    Image::make($file)->save($location . $name, 60);
                }

                $files[] = $name;

                ProductImage::insert([
                    'product_id' => $product->id,
                    'image' => $name,
                    'created_at' => Carbon::now(),
                ]);
            }
        }

        $product->multiple_images = json_encode($files);
        $product->save();
        // multiple image code end

        Toastr::success('Product Updated', 'Success');
        return redirect('/view/all/product');
    }

    public function viewAllProductReviews(Request $request)
    {
        if ($request->ajax()) {

            $data = DB::table('product_reviews')
                ->join('products', 'product_reviews.product_id', '=', 'products.id')
                ->join('users', 'product_reviews.user_id', '=', 'users.id')
                ->select('product_reviews.*', 'products.image as product_image', 'products.name as product_name', 'users.name as user_name',  'users.image as user_image')
                ->orderBy('product_reviews.id', 'desc')
                ->get();

            return Datatables::of($data)
                ->editColumn('status', function ($data) {
                    if ($data->status == 1) {
                        return 'Approved';
                    } else {
                        return 'Pending';
                    }
                })
                ->editColumn('rating', function ($data) {
                    $rating = "";
                    for ($i = 1; $i <= $data->rating; $i++) {
                        $rating .= '<i class="feather-star" style="color: goldenrod;"></i>';
                    }
                    return $rating;
                })
                ->addIndexColumn()
                ->addColumn('action', function ($data) {
                    $btn = ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="' . $data->id . '" data-original-title="Delete" class="btn-sm btn-info rounded replyBtn d-inline-block mb-1"><i class="fas fa-reply"></i></a>';
                    if ($data->status == 0) {
                        $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="' . $data->slug . '" data-original-title="Approve" class="btn-sm btn-success rounded approveBtn d-inline-block mb-1"><i class="fas fa-check"></i></a>';
                    }
                    $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="' . $data->slug . '" data-original-title="Delete" class="btn-sm btn-danger rounded deleteBtn d-inline-block mb-1"><i class="fas fa-trash-alt"></i></a>';
                    return $btn;
                })
                ->rawColumns(['action', 'rating'])
                ->make(true);
        }
        return view('backend.product.reviews');
    }

    public function approveProductReview($slug)
    {
        ProductReview::where('slug', $slug)->update([
            'status' => 1,
            'updated_at' => Carbon::now()
        ]);

        return response()->json(['success' => 'Product Review Approved Successfully.']);
    }

    public function deleteProductReview($slug)
    {
        ProductReview::where('slug', $slug)->delete();
        return response()->json(['success' => 'Product Review Deleted Successfully.']);
    }

    public function addAnotherVariant()
    {
        $returnHTML = view('backend.product.variant')->render();
        return response()->json(['variant' => $returnHTML]);
    }

    public function deleteProductVariant($id)
    {
        $variant = ProductVariant::where('id', $id)->first();
        if ($variant->image && file_exists(public_path('productImages/' . $variant->image))) {
            unlink(public_path('productImages/' . $variant->image));
        }
        $variant->delete();
        return response()->json(['success' => 'Deleted Successfully']);
    }

    public function getProductReviewInfo($id)
    {
        $data = ProductReview::where('id', $id)->first();
        return response()->json($data);
    }

    public function submitReplyOfProductReview(Request $request)
    {
        ProductReview::where('id', $request->review_id)->update([
            'reply' => $request->reply,
            'updated_at' => Carbon::now()
        ]);
        return response()->json(['success' => 'Replied Successfully.']);
    }


    public function viewAllQuestionAnswer(Request $request)
    {
        if ($request->ajax()) {

            $data = DB::table('product_question_answers')
                ->leftJoin('products', 'product_question_answers.product_id', '=', 'products.id')
                ->select('product_question_answers.*', 'products.image as product_image', 'products.name as product_name')
                ->orderBy('product_question_answers.id', 'desc')
                ->get();

            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function ($data) {
                    $btn = ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="' . $data->id . '" data-original-title="Delete" class="btn-sm btn-info rounded replyBtn d-inline-block mb-1"><i class="fas fa-reply"></i></a>';
                    $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="' . $data->id . '" data-original-title="Delete" class="btn-sm btn-danger rounded deleteBtn d-inline-block mb-1"><i class="fas fa-trash-alt"></i></a>';
                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('backend.product.questions');
    }

    public function deleteQuestionAnswer($id)
    {
        ProductQuestionAnswer::where('id', $id)->delete();
        return response()->json(['success' => 'Deleted Successfully']);
    }

    public function getQuestionAnswerInfo($id)
    {
        $data = ProductQuestionAnswer::where('id', $id)->first();
        return response()->json($data);
    }

    public function submitAnswerOfQuestion(Request $request)
    {
        ProductQuestionAnswer::where('id', $request->question_answer_id)->update([
            'answer' => $request->answer,
            'updated_at' => Carbon::now()
        ]);
        return response()->json(['success' => 'Replied Successfully.']);
    }

    // demo products function
    public function generateDemoProducts()
    {
        return view('backend.product.generate_demo');
    }

    public function saveGeneratedDemoProducts(Request $request)
    {

        ini_set('max_execution_time', 3600);

        $faker = Container::getInstance()->make(Generator::class);

        for ($i = 1; $i <= $request->products; $i++) {

            $title = $faker->catchPhrase() . "-" . $i;
            $categoryId = Category::where('status', 1)->select('id')->inRandomOrder()->limit(1)->get();
            $storeId = Store::where('status', 1)->select('id')->inRandomOrder()->first();
            $subcategoryId = Subcategory::where('status', 1)->where('category_id', isset($categoryId[0]) ? $categoryId[0]->id : null)->select('id')->inRandomOrder()->limit(1)->get();
            $childCategoryId = ChildCategory::where('subcategory_id', isset($subcategoryId[0]) ? $subcategoryId[0]->id : null)->select('id')->inRandomOrder()->limit(1)->get();
            $brandId = Brand::where('status', 1)->select('id')->inRandomOrder()->limit(1)->get();
            $modelId = ProductModel::where('brand_id', isset($brandId[0]) ? $brandId[0]->id : null)->select('id')->inRandomOrder()->limit(1)->get();
            $unitId = Unit::select('id')->inRandomOrder()->limit(1)->get();
            $warrentyId = ProductWarrenty::select('id')->inRandomOrder()->limit(1)->get();
            $flagId = Flag::select('id')->where('status', 1)->inRandomOrder()->limit(1)->get();
            $regionId = DB::table('country')->select('id')->inRandomOrder()->limit(1)->get();
            $simId = DB::table('sims')->select('id')->inRandomOrder()->limit(1)->get();
            $storageTypeId = DB::table('storage_types')->select('id')->inRandomOrder()->limit(1)->get();
            $conditionID = DB::table('device_conditions')->select('id')->inRandomOrder()->limit(1)->get();
            $warrentyID = DB::table('product_warrenties')->select('id')->inRandomOrder()->limit(1)->get();

            $multipleProductArray = array();
            for ($j = 1; $j <= 4; $j++) {
                $multipleProductArray[] = $request->product_type == 1 ? rand(1, 20) . '.png' : ($request->product_type == 2 ? rand(21, 40) . '.png' : rand(41, 80) . '.png');
            }

            $price = rand(100, 999);

            $clean = preg_replace('/[^a-zA-Z0-9\s]/', '', strtolower($title)); //remove all non alpha numeric
            $slug = preg_replace('!\s+!', '-', $clean);

            $id = Product::insertGetId([
                'category_id' => isset($categoryId[0]) ? $categoryId[0]->id : null,
                'store_id' => $storeId ? $storeId->id : null,
                'subcategory_id' => isset($subcategoryId[0]) ? $subcategoryId[0]->id : null,
                'childcategory_id' => isset($childCategoryId[0]) ? $childCategoryId[0]->id : null,
                'brand_id' => isset($brandId[0]) ? $brandId[0]->id : null,
                'model_id' => isset($modelId[0]) ? $modelId[0]->id : null,
                'name' => $title,
                'code' => rand(100, 999),
                'reward_points' => rand(0, 5),
                'image' => $request->product_type == 1 ? 'productImages/' . rand(1, 20) . '.png' : ($request->product_type == 2 ? 'productImages/' . rand(21, 40) . '.png' : 'productImages/' . rand(41, 80) . '.png'),
                'multiple_images' => $i % 2 != 0 ? json_encode($multipleProductArray) : null,
                'short_description' => $faker->text($maxNbChars = 200),
                'description' => $faker->text($maxNbChars = 400),
                'specification' => $faker->text($maxNbChars = 200),
                'warrenty_policy' => $faker->text($maxNbChars = 200),
                'price' => $price,
                'discount_price' => $price - 10,
                'stock' => 1000,
                'unit_id' => isset($unitId[0]) ? $unitId[0]->id : null,
                'tags' => 'product,demo',
                'video_url' => 'https://www.youtube.com/watch?v=2tirsYI5D2M',
                'warrenty_id' => isset($warrentyId[0]) ? $warrentyId[0]->id : null,
                'slug' => $slug . '-' . time() . str::random(5),
                'flag_id' => isset($flagId[0]) ? $flagId[0]->id : null,
                'meta_title' => $title,
                'meta_keywords' => 'product,demo',
                'meta_description' => null,
                'status' => 1,
                'special_offer' => $i % 2 == 0 ? 1 : 0,
                'offer_end_time' => $i % 2 == 0 ? date('Y-m-d H:i', strtotime('+30 day')) . ":00" : null,
                'has_variant' => $i % 2 == 0 ? 1 : 0,
                'is_demo' => 1,
                'created_at' => Carbon::now()
            ]);

            if ($i % 2 != 0) {
                foreach ($multipleProductArray as $image) {
                    ProductImage::insert([
                        'product_id' => $id,
                        'image' => $image,
                        'created_at' => Carbon::now(),
                    ]);
                }
            }

            if ($i % 2 == 0) {
                foreach ($multipleProductArray as $image) {

                    $colorId = Color::select('id')->inRandomOrder()->limit(1)->first();
                    $sizeId = ProductSize::select('id')->inRandomOrder()->limit(1)->first();

                    $variantInfo = new ProductVariant();
                    $variantInfo->product_id = $id;
                    $variantInfo->image = $image;
                    $variantInfo->color_id = $colorId ? $colorId->id : null;
                    $variantInfo->size_id = $sizeId ? $sizeId->id : null;
                    $variantInfo->region_id = isset($regionId[0]) ? $regionId[0]->id : null;
                    $variantInfo->sim_id = isset($simId[0]) ? $simId[0]->id : null;
                    $variantInfo->storage_type_id = isset($storageTypeId[0]) ? $storageTypeId[0]->id : null;
                    $variantInfo->stock = 1000;
                    $variantInfo->price = $price;
                    $variantInfo->discounted_price = $price - 10;
                    $variantInfo->warrenty_id = isset($warrentyID[0]) ? $warrentyID[0]->id : null;
                    $variantInfo->device_condition_id = isset($conditionID[0]) ? $conditionID[0]->id : null;
                    $variantInfo->created_at = Carbon::now();
                    $variantInfo->save();

                    ProductReview::insert([
                        'product_id' => $id,
                        'user_id' => 1,
                        'rating' => rand(1, 5),
                        'review' => $faker->catchPhrase(),
                        'reply' => 'thanks',
                        'slug' => time() . str::random(5),
                        'status' => 1,
                        'created_at' => Carbon::now(),
                    ]);
                }
            }
        }

        Toastr::success('Demo Products Inserted', 'Success');
        return back();
    }

    public function removeDemoProductsPage()
    {
        return view('backend.product.remove_demo');
    }

    public function removeDemoProducts()
    {

        ini_set('max_execution_time', 3600);

        $products = Product::where('is_demo', 1)->get();
        foreach ($products as $product) {
            ProductImage::where('product_id', $product->id)->delete();
            ProductVariant::where('product_id', $product->id)->delete();
            ProductReview::where('product_id', $product->id)->delete();
            $product->delete();
        }
        Toastr::success('Successfully Removed Demo Products', 'Success');
        return back();
    }

    public function productsFromExcel()
    {
        return view('backend.product.excel_upload');
    }

    public function uploadProductsFromExcel(Request $request)
    {

        ini_set('max_execution_time', 3600); //30 min
        ini_set('memory_limit', '8192M');

        $extension = request()->file('excel_file')->getClientOriginalExtension();

        if ($extension == 'xlsx' || $extension == 'csv') {

            $import = new ProductImport();
            Excel::import($import, request()->file('excel_file'));

            Toastr::success('Data Uploaded Successfully', 'Success');
            return back();
        } else {
            Toastr::error('Wrong File Format', 'Wrong Format');
            return back();
        }
    }

    public function bulkProductUpdate()
    {
        return view('backend.product.bulk_update');
    }

    public function updateProductFromExcel(Request $request)
    {

        ini_set('max_execution_time', 3600); //30 min
        ini_set('memory_limit', '8192M');

        $extension = request()->file('excel_file')->getClientOriginalExtension();
        if ($extension == 'xlsx' || $extension == 'csv') {
            $import = new BulkProductUpdate();
            Excel::import($import, request()->file('excel_file'));

            Toastr::success('Data Updated Successfully', 'Success');
            return back();
        } else {
            Toastr::error('Wrong File Format', 'Wrong Format');
            return back();
        }
    }

    public function duplicateProduct($slug)
    {
        // Find the original product by slug
        $originalProduct = Product::where('slug', $slug)->first();

        if (!$originalProduct) {
            Toastr::error('Product not found', 'Error');
            return back();
        }

        // Create a new product instance
        $newProduct = new Product();

        // Copy attributes from original product
        $newProduct->name = $originalProduct->name . ' (Copy)';
        $newProduct->short_description = $originalProduct->short_description;
        $newProduct->description = $originalProduct->description;
        $newProduct->tags = $originalProduct->tags;
        $newProduct->video_url = $originalProduct->video_url;
        $newProduct->store_id = $originalProduct->store_id;
        $newProduct->category_id = $originalProduct->category_id;
        $newProduct->subcategory_id = $originalProduct->subcategory_id;
        $newProduct->childcategory_id = $originalProduct->childcategory_id;

        // Handle image duplication
        $newImage = null;
        if ($originalProduct->image) {
            $originalImagePath = public_path($originalProduct->image);
            if (file_exists($originalImagePath)) {
                $pathInfo = pathinfo($originalImagePath);
                $newImageName = str::random(5) . time() . '.' . $pathInfo['extension'];
                $newImagePath = 'productImages/' . $newImageName;

                // Copy the image file
                copy($originalImagePath, public_path($newImagePath));
                $newImage = $newImagePath;
            }
        }
        $newProduct->image = $newImage;

        // Continue copying other attributes
        $newProduct->flag_id = $originalProduct->flag_id;

        // Create a new unique slug
        $clean = preg_replace('/[^a-zA-Z0-9\s]/', '', strtolower($originalProduct->name . ' copy'));
        $slug = preg_replace('!\s+!', '-', $clean);
        $newProduct->slug = $slug . "-" . time() . str::random(5);

        $newProduct->status = $originalProduct->status;
        $newProduct->unit_id = $originalProduct->unit_id;
        $newProduct->specification = $originalProduct->specification;
        $newProduct->warrenty_policy = $originalProduct->warrenty_policy;
        $newProduct->brand_id = $originalProduct->brand_id;
        $newProduct->model_id = $originalProduct->model_id;
        $newProduct->warrenty_id = $originalProduct->warrenty_id;
        $newProduct->code = $originalProduct->code . '-COPY';
        $newProduct->reward_points = $originalProduct->reward_points;
        $newProduct->special_offer = $originalProduct->special_offer;
        $newProduct->offer_end_time = $originalProduct->offer_end_time;
        $newProduct->meta_title = $originalProduct->meta_title;
        $newProduct->meta_keywords = $originalProduct->meta_keywords;
        $newProduct->meta_description = $originalProduct->meta_description;
        $newProduct->created_at = Carbon::now();

        // Handle variants
        $newProduct->has_variant = $originalProduct->has_variant;

        if ($originalProduct->has_variant == 0) {
            // For products without variants
            $newProduct->price = $originalProduct->price;
            $newProduct->discount_price = $originalProduct->discount_price;
            $newProduct->stock = $originalProduct->stock;
        } else {
            // For products with variants, set default values that will be updated after saving variants
            $newProduct->price = 0;
            $newProduct->discount_price = 0;
            $newProduct->stock = 0;
        }

        // Save the new product
        $newProduct->save();

        // Duplicate variants if they exist
        if ($originalProduct->has_variant == 1) {
            $originalVariants = ProductVariant::where('product_id', $originalProduct->id)->get();

            foreach ($originalVariants as $key => $variant) {
                // Handle variant image duplication
                $variantImage = null;
                if ($variant->image) {
                    $originalVariantImagePath = public_path('productImages/' . $variant->image);
                    if (file_exists($originalVariantImagePath)) {
                        $pathInfo = pathinfo($originalVariantImagePath);
                        $newVariantImageName = time() . str::random(5) . '.' . $pathInfo['extension'];

                        // Copy the variant image file
                        copy($originalVariantImagePath, public_path('productImages/' . $newVariantImageName));
                        $variantImage = $newVariantImageName;
                    }
                }

                // Create new variant for the duplicated product
                $newVariant = new ProductVariant();
                $newVariant->product_id = $newProduct->id;
                $newVariant->image = $variantImage;
                $newVariant->color_id = $variant->color_id;
                $newVariant->unit_id = $variant->unit_id;
                $newVariant->size_id = $variant->size_id;
                $newVariant->region_id = $variant->region_id;
                $newVariant->sim_id = $variant->sim_id;
                $newVariant->storage_type_id = $variant->storage_type_id;
                $newVariant->stock = $variant->stock;
                $newVariant->price = $variant->price;
                $newVariant->discounted_price = $variant->discounted_price;
                $newVariant->warrenty_id = $variant->warrenty_id;
                $newVariant->device_condition_id = $variant->device_condition_id;
                $newVariant->created_at = Carbon::now();
                $newVariant->save();

                // Update the main product price with the first variant's price
                if ($key == 0) {
                    $newProduct->price = $variant->price;
                    $newProduct->discount_price = $variant->discounted_price;
                    $newProduct->warrenty_id = $variant->warrenty_id;
                    $newProduct->save();
                }
            }
        }

        // Duplicate multiple images
        $originalMultipleImages = ProductImage::where('product_id', $originalProduct->id)->get();
        $newMultipleImages = [];

        foreach ($originalMultipleImages as $image) {
            $originalImagePath = public_path('productImages/' . $image->image);
            if (file_exists($originalImagePath)) {
                $pathInfo = pathinfo($originalImagePath);
                $newImageName = time() . str::random(5) . '.' . $pathInfo['extension'];

                // Copy the image file
                copy($originalImagePath, public_path('productImages/' . $newImageName));

                // Create a new product image record
                $newProductImage = new ProductImage();
                $newProductImage->product_id = $newProduct->id;
                $newProductImage->image = $newImageName;
                $newProductImage->created_at = Carbon::now();
                $newProductImage->save();

                $newMultipleImages[] = $newImageName;
            }
        }

        // Update the multiple_images field if there are any
        if (count($newMultipleImages) > 0) {
            DB::table('products')->where('id', $newProduct->id)->update([
                'multiple_images' => json_encode($newMultipleImages)
            ]);
        }

        Toastr::success('Product duplicated successfully', 'Success');
        return redirect('/view/all/product');
    }
}
