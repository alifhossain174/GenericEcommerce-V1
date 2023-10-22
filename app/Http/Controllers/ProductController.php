<?php

namespace App\Http\Controllers;

use App\Models\ChildCategory;
use App\Models\Product;
use App\Models\ProductImage;
use App\Models\ProductReview;
use App\Models\ProductVariant;
use App\Models\Subcategory;
use App\Models\ProductModel;
use App\Models\OrderDetails;
use App\Models\ProductQuestionAnswer;
use Illuminate\Support\Facades\DB;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Image;
use DataTables;

class ProductController extends Controller
{
    public function addNewProduct(){
        return view('backend.product.create');
    }

    public function childcategorySubcategoryWise(Request $request){
        $data = ChildCategory::where("subcategory_id", $request->subcategory_id)->where('status', 1)->select('name', 'id')->get();
        return response()->json($data);
    }

    public function saveNewProduct(Request $request){

        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'category_id' => 'required',
            'image' => 'required',
        ]);


        $image = null;
        if ($request->hasFile('image')){
            $get_image = $request->file('image');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('productImages/');
            // Image::make($get_image)->save($location . $image_name, 80);
            $get_image->move($location, $image_name);
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
        $product->category_id = $request->category_id;
        $product->subcategory_id = $request->subcategory_id;
        $product->childcategory_id = $request->childcategory_id;
        $product->image = $image;
        $product->flag_id = $request->flag_id;
        $product->slug = $slug."-".time().str::random(5);
        $product->status = 1;
        $product->unit_id = $request->unit_id;
        $product->specification = $request->specification;
        $product->warrenty_policy = $request->warrenty_policy;
        $product->brand_id = $request->brand_id;
        $product->model_id = $request->model_id;
        $product->code = $request->code;
        $product->meta_title = $request->meta_title;
        $product->meta_keywords = $request->meta_keywords;
        $product->meta_description = $request->meta_description;
        $product->created_at = Carbon::now();

        if($request->has_variant == 1){

            //variant specific
            $product->price = 0;
            $product->discount_price = 0;
            $product->stock = 0;
            $product->multiple_images = NULL;
            $product->warrenty_id = NULL;
            $product->has_variant = 1;
            //variant specific

            $i = 0;
            foreach($request->product_variant_color_id as $color_id){

                $name = NULL;
                if(isset($request->file('product_variant_image')[$i]) && $request->file('product_variant_image')[$i]){
                    $name = time().str::random(5).'.'.$request->file('product_variant_image')[$i]->extension();
                    $request->file('product_variant_image')[$i]->move(public_path('productImages'), $name);
                }

                if($i == 0){ // saving the base variant price & warrenty As product main price & warrenty for filtering
                    $product->price = $request->product_variant_price[$i];
                    $product->discount_price = $request->product_variant_discounted_price[$i];
                    $product->warrenty_id = isset($request->product_variant_warrenty[$i]) ? $request->product_variant_warrenty[$i] : null;
                    $product->save();
                }

                ProductVariant::insert([
                    'product_id' => $product->id,
                    'image' => $name,
                    'color_id' => $color_id,
                    'size_id' => isset($request->product_variant_size_id[$i]) ? $request->product_variant_size_id[$i] : null,
                    'region_id' => isset($request->product_variant_region_id[$i]) ? $request->product_variant_region_id[$i] : null,
                    'sim_id' => isset($request->product_variant_sim_id[$i]) ? $request->product_variant_sim_id[$i] : null,
                    'storage_type_id' => isset($request->product_variant_storage_type_id[$i]) ? $request->product_variant_storage_type_id[$i] : null,
                    'stock' => $request->product_variant_stock[$i],
                    'price' => $request->product_variant_price[$i],
                    'discounted_price' => $request->product_variant_discounted_price[$i],
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
            $product->stock = $request->stock > 0 ? $request->stock : 0;
            $product->warrenty_id = $request->warrenty_id;
            $product->has_variant = 0;
            //variant specific

            $files = [];
            if($request->hasfile('photos'))
            {
                foreach($request->file('photos') as $file)
                {
                    $name = time().str::random(5).'.'.$file->extension();
                    $file->move(public_path('productImages'), $name);
                    $files[] = $name;
                }
                $product->multiple_images = json_encode($files);
            }

            $product->save();

            if(count($files) > 0){
                foreach($files as $file)
                {
                    ProductImage::insert([
                        'product_id' => $product->id,
                        'image' => $file,
                        'created_at' => Carbon::now(),
                    ]);
                }
            }
        }


        Toastr::success('Product is Inserted', 'Success');
        return back();

    }

    public function viewAllProducts(Request $request){
        if ($request->ajax()) {

            $data = DB::table('products')
                ->join('categories', 'products.category_id', '=', 'categories.id')
                ->leftJoin('subcategories', 'products.subcategory_id', '=', 'subcategories.id')
                ->leftJoin('child_categories', 'products.childcategory_id', '=', 'child_categories.id')
                ->leftJoin('flags', 'products.flag_id', '=', 'flags.id')
                ->leftJoin('units', 'products.unit_id', '=', 'units.id')
                ->select('products.*', 'units.name as unit_name', 'categories.name as category_name', 'subcategories.name as subcategory_name', 'child_categories.name as childcategory_name',  'flags.name as flag_name')
                ->orderBy('products.id', 'desc')
                ->get();

            return Datatables::of($data)
                    ->editColumn('status', function($data) {
                        if($data->status == 1){
                            return '<span class="btn btn-sm btn-success d-inline-block">Active</span>';
                        } else {
                            return '<span class="btn btn-sm btn-danger d-inline-block">Inactive</span>';
                        }
                    })
                    ->editColumn('price', function($data) {
                        if($data->has_variant == 1){
                            $priceStr = '';
                            $variantInfo = ProductVariant::where('product_id', $data->id)->orderBy('id', 'asc')->get();
                            foreach($variantInfo as $variant){
                                $priceStr .= $variant->price.", ";
                            }

                            return rtrim($priceStr,", ");
                        } else {
                            return $data->price;
                        }
                    })
                    ->editColumn('discount_price', function($data) {
                        if($data->has_variant == 1){
                            $priceStr = '';
                            $variantInfo = ProductVariant::where('product_id', $data->id)->orderBy('id', 'asc')->get();
                            foreach($variantInfo as $variant){
                                $priceStr .= $variant->discounted_price.", ";
                            }

                            return rtrim($priceStr,", ");
                        } else {
                            return $data->discount_price;
                        }
                    })
                    ->editColumn('stock', function($data) {
                        if($data->has_variant == 1){
                            $stockStr = '';
                            $variantInfo = ProductVariant::where('product_id', $data->id)->orderBy('id', 'asc')->get();
                            foreach($variantInfo as $variant){
                                $stockStr .= $variant->stock.", ";
                            }

                            return rtrim($stockStr,", ");
                        } else {
                            return $data->stock;
                        }
                    })
                    ->addIndexColumn()
                    ->addColumn('action', function($data){
                        $link = "https://GenericCommerceV1-beta.vercel.app/product/".$data->slug;
                        $btn = ' <a target="_blank" href="'.$link.'" class="mb-1 btn-sm btn-success rounded d-inline-block" title="For Frontend Product View"><i class="fa fa-eye"></i></a>';
                        $btn .= ' <a href="'.url('edit/product').'/'.$data->slug.'" class="mb-1 btn-sm btn-warning rounded d-inline-block"><i class="fas fa-edit"></i></a>';
                        $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->slug.'" data-original-title="Delete" class="btn-sm btn-danger rounded d-inline-block deleteBtn"><i class="fas fa-trash-alt"></i></a>';
                        return $btn;
                    })
                    ->rawColumns(['action', 'price', 'status'])
                    ->make(true);
        }
        return view('backend.product.view');
    }

    public function deleteProduct($slug){
        $data = Product::where('slug', $slug)->first();

        $orderExists = OrderDetails::where('product_id', $data->id)->first();
        if($orderExists){
            return response()->json(['success' => 'Product cannot be deleted', 'data' => 0]);
        }

        if($data->image){
            if(file_exists(public_path($data->image))){
                unlink(public_path($data->image));
            }
        }

        $gallery = ProductImage::where('product_id', $data->id)->get();
        if(count($gallery) > 0){
            foreach($gallery as $img){
                if($img->image && file_exists(public_path('productImages/'.$img->image))){
                    unlink(public_path('productImages/'.$img->image));
                }
                $img->delete();
            }
        }

        $variants = ProductVariant::where('product_id', $data->id)->orderBy('id', 'asc')->get();
        if(count($variants) > 0){
            foreach($variants as $img){
                if($img->image && file_exists(public_path('productImages/'.$img->image))){
                    unlink(public_path('productImages/'.$img->image));
                }
                $img->delete();
            }
        }

        ProductQuestionAnswer::where('product_id', $data->id)->delete();
        ProductReview::where('product_id', $data->id)->delete();
        $data->delete();
        return response()->json(['success' => 'Product deleted successfully.', 'data' => 1]);
    }

    public function editProduct($slug){
        $product = Product::where('slug', $slug)->first();
        $subcategories = Subcategory::where('category_id', $product->category_id)->select('name', 'id')->orderBy('name', 'asc')->get();
        $childcategories = ChildCategory::where('category_id', $product->category_id)->where('subcategory_id', $product->subcategory_id)->select('name', 'id')->orderBy('name', 'asc')->get();
        $productModels = ProductModel::where('brand_id', $product->brand_id)->select('name', 'id')->orderBy('name', 'asc')->get();
        $gallery = ProductImage::where('product_id', $product->id)->get();
        $productVariants = ProductVariant::where('product_id', $product->id)->orderBy('id', 'asc')->get();
        return view('backend.product.update', compact('product', 'gallery', 'subcategories', 'childcategories', 'productModels', 'productVariants'));
    }

    public function updateProduct(Request $request){

        $request->validate([
            'name' => 'required|max:255',
            'category_id' => 'required',
            'status' => 'required',
        ]);

        $product = Product::where('id', $request->id)->first();

        $image = $product->image;
        if ($request->hasFile('image')){

            if($product->image != '' && file_exists(public_path($product->image))){
                unlink(public_path($product->image));
            }

            $get_image = $request->file('image');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('productImages/');
            // Image::make($get_image)->save($location . $image_name, 80);
            $get_image->move($location, $image_name);
            $image = "productImages/" . $image_name;
        }

        $clean = preg_replace('/[^a-zA-Z0-9\s]/', '', strtolower($request->name)); //remove all non alpha numeric
        $slug = preg_replace('!\s+!', '-', $clean);

        $product->name = $request->name;
        $product->short_description = $request->short_description;
        $product->description = $request->description;
        $product->tags = $request->tags;
        $product->video_url = $request->video_url;
        $product->category_id = $request->category_id;
        $product->subcategory_id = $request->subcategory_id;
        $product->childcategory_id = $request->childcategory_id;
        $product->image = $image;
        $product->specification = $request->specification;
        $product->warrenty_policy = $request->warrenty_policy;
        $product->brand_id = $request->brand_id;
        $product->model_id = $request->model_id;
        $product->code = $request->code;
        $product->unit_id = $request->unit_id;
        $product->status = $request->status;
        $product->slug = $slug."-".time().str::random(5);
        $product->flag_id = $request->flag_id;
        $product->meta_title = $request->meta_title;
        $product->meta_keywords = $request->meta_keywords;
        $product->meta_description = $request->meta_description;
        $product->updated_at = Carbon::now();



        if($request->has_variant == 1){

            $gallery = ProductImage::where('product_id', $request->id)->get();
            if(count($gallery) > 0){
                foreach($gallery as $img){
                    if(file_exists(public_path('productImages/'.$img->image))){
                        unlink(public_path('productImages/'.$img->image));
                    }
                    $img->delete();
                }
            }

            //variant specific
            $product->price = 0;
            $product->discount_price = 0;
            $product->stock = 0;
            $product->multiple_images = NULL;
            $product->warrenty_id = NULL;
            $product->has_variant = 1;
            //variant specific

            $i = 0;
            foreach($request->product_variant_color_id as $color_id){


                if($i == 0){ // saving the base variant price & warrenty As product main price & warrenty for filtering
                    $product->price = $request->product_variant_price[$i];
                    $product->discount_price = $request->product_variant_discounted_price[$i];
                    $product->warrenty_id = isset($request->product_variant_warrenty[$i]) ? $request->product_variant_warrenty[$i] : null;
                    $product->save();
                }

                $product_variant_id = isset($request->product_variant_id[$i]) ? $request->product_variant_id[$i] : null;

                if($product_variant_id){

                    $variantInfo = ProductVariant::where('id', $product_variant_id)->first();

                    $name = $variantInfo->image;
                    if(isset($request->file('product_variant_image')[$i])){
                        $name = time().str::random(5).'.'.$request->file('product_variant_image')[$i]->extension();
                        $request->file('product_variant_image')[$i]->move(public_path('productImages'), $name);
                    }

                    $variantInfo->image = $name;
                    $variantInfo->color_id = $color_id;
                    $variantInfo->size_id = isset($request->product_variant_size_id[$i]) ? $request->product_variant_size_id[$i] : null;
                    $variantInfo->region_id = isset($request->product_variant_region_id[$i]) ? $request->product_variant_region_id[$i] : null;
                    $variantInfo->sim_id = isset($request->product_variant_sim_id[$i]) ? $request->product_variant_sim_id[$i] : null;
                    $variantInfo->storage_type_id = isset($request->product_variant_storage_type_id[$i]) ? $request->product_variant_storage_type_id[$i] : null;
                    $variantInfo->stock = $request->product_variant_stock[$i];
                    $variantInfo->price = $request->product_variant_price[$i];
                    $variantInfo->discounted_price = $request->product_variant_discounted_price[$i];
                    $variantInfo->warrenty_id = isset($request->product_variant_warrenty[$i]) ? $request->product_variant_warrenty[$i] : null;
                    $variantInfo->device_condition_id = isset($request->product_variant_device_condition_id[$i]) ? $request->product_variant_device_condition_id[$i] : null;
                    $variantInfo->updated_at = Carbon::now();
                    $variantInfo->save();


                } else {

                    $name = NULL;
                    if(isset($request->file('product_variant_image')[$i]) && $request->file('product_variant_image')[$i]){
                        $name = time().str::random(5).'.'.$request->file('product_variant_image')[$i]->extension();
                        $request->file('product_variant_image')[$i]->move(public_path('productImages'), $name);
                    }

                    ProductVariant::insert([
                        'product_id' => $product->id,
                        'image' => $name,
                        'color_id' => $color_id,
                        'size_id' => isset($request->product_variant_size_id[$i]) ? $request->product_variant_size_id[$i] : null,
                        'region_id' => isset($request->product_variant_region_id[$i]) ? $request->product_variant_region_id[$i] : null,
                        'sim_id' => isset($request->product_variant_sim_id[$i]) ? $request->product_variant_sim_id[$i] : null,
                        'storage_type_id' => isset($request->product_variant_storage_type_id[$i]) ? $request->product_variant_storage_type_id[$i] : null,
                        'stock' => $request->product_variant_stock[$i],
                        'price' => $request->product_variant_price[$i],
                        'discounted_price' => $request->product_variant_discounted_price[$i],
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
            $product->stock = $request->stock > 0 ? $request->stock : 0;
            $product->warrenty_id = $request->warrenty_id;
            $product->has_variant = 0;
            //variant specific

            // delete all the variants
            $variants = ProductVariant::where('product_id', $request->id)->orderBy('id', 'asc')->get();
            if(count($variants) > 0){
                foreach($variants as $img){
                    if(file_exists(public_path('productImages/'.$img->image))){
                        unlink(public_path('productImages/'.$img->image));
                    }
                    $img->delete();
                }
            }

            $files = [];
            if(isset($request->old) && is_array($request->old) && count($request->old) > 0){
                $oldImageIdArray = array();
                foreach($request->old as $oldImage){
                    $oldImageIdArray[] = $oldImage;
                }

                $gallery = ProductImage::where('product_id', $product->id)->get();
                foreach($gallery as $multipleImage){
                    if(!in_array($multipleImage->id, $oldImageIdArray)){
                        if(file_exists(public_path('productImages/'.$multipleImage->image))){
                            unlink(public_path('productImages/'.$multipleImage->image));
                        }
                        ProductImage::where('id', $multipleImage->id)->delete();
                    } else {
                        $files[] = $multipleImage->image;
                    }
                }
            } else {
                ProductImage::where('product_id', $product->id)->delete();
            }


            if($request->hasfile('photos'))
            {
                foreach($request->file('photos') as $file)
                {
                    $name = time().str::random(5).'.'.$file->extension();
                    $file->move(public_path('productImages'), $name);
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
        }

        Toastr::success('Product Updated', 'Success');
        return redirect('/view/all/product');

    }

    public function viewAllProductReviews(Request $request){
        if ($request->ajax()) {

            $data = DB::table('product_reviews')
                        ->join('products', 'product_reviews.product_id', '=', 'products.id')
                        ->join('users', 'product_reviews.user_id', '=', 'users.id')
                        ->select('product_reviews.*', 'products.image as product_image', 'products.name as product_name', 'users.name as user_name',  'users.image as user_image')
                        ->orderBy('product_reviews.id', 'desc')
                        ->get();

            return Datatables::of($data)
                    ->editColumn('status', function($data) {
                        if($data->status == 1){
                            return 'Approved';
                        } else {
                            return 'Pending';
                        }
                    })
                    ->editColumn('rating', function($data) {
                        $rating = "";
                        for($i=1;$i<=$data->rating;$i++){
                            $rating .= '<i class="feather-star" style="color: goldenrod;"></i>';
                        }
                        return $rating;
                    })
                    ->addIndexColumn()
                    ->addColumn('action', function($data){
                        $btn = ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Delete" class="btn-sm btn-info rounded replyBtn d-inline-block mb-1"><i class="fas fa-reply"></i></a>';
                        if($data->status == 0){
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->slug.'" data-original-title="Approve" class="btn-sm btn-success rounded approveBtn d-inline-block mb-1"><i class="fas fa-check"></i></a>';
                        }
                        $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->slug.'" data-original-title="Delete" class="btn-sm btn-danger rounded deleteBtn d-inline-block mb-1"><i class="fas fa-trash-alt"></i></a>';
                        return $btn;
                    })
                    ->rawColumns(['action', 'rating'])
                    ->make(true);
        }
        return view('backend.product.reviews');
    }

    public function approveProductReview($slug){
        ProductReview::where('slug', $slug)->update([
            'status' => 1,
            'updated_at' => Carbon::now()
        ]);

        return response()->json(['success' => 'Product Review Approved Successfully.']);
    }

    public function deleteProductReview($slug){
        ProductReview::where('slug', $slug)->delete();
        return response()->json(['success' => 'Product Review Deleted Successfully.']);
    }

    public function addAnotherVariant(){
        $returnHTML = view('backend.product.variant')->render();
        return response()->json(['variant' => $returnHTML]);
    }

    public function deleteProductVariant($id){
        $variant = ProductVariant::where('id', $id)->first();
        if($variant->image && file_exists(public_path('productImages/'.$variant->image))){
            unlink(public_path('productImages/'.$variant->image));
        }
        $variant->delete();
        return response()->json(['success' => 'Deleted Successfully']);
    }

    public function getProductReviewInfo($id){
        $data = ProductReview::where('id', $id)->first();
        return response()->json($data);
    }

    public function submitReplyOfProductReview(Request $request){
        ProductReview::where('id', $request->review_id)->update([
            'reply' => $request->reply,
            'updated_at' => Carbon::now()
        ]);
        return response()->json(['success' => 'Replied Successfully.']);
    }


    public function viewAllQuestionAnswer(Request $request){
        if ($request->ajax()) {

            $data = DB::table('product_question_answers')
                        ->leftJoin('products', 'product_question_answers.product_id', '=', 'products.id')
                        ->select('product_question_answers.*', 'products.image as product_image', 'products.name as product_name')
                        ->orderBy('product_question_answers.id', 'desc')
                        ->get();

            return Datatables::of($data)
                    ->addIndexColumn()
                    ->addColumn('action', function($data){
                        $btn = ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Delete" class="btn-sm btn-info rounded replyBtn d-inline-block mb-1"><i class="fas fa-reply"></i></a>';
                        $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Delete" class="btn-sm btn-danger rounded deleteBtn d-inline-block mb-1"><i class="fas fa-trash-alt"></i></a>';
                        return $btn;
                    })
                    ->rawColumns(['action'])
                    ->make(true);
        }
        return view('backend.product.questions');
    }

    public function deleteQuestionAnswer($id){
        ProductQuestionAnswer::where('id', $id)->delete();
        return response()->json(['success' => 'Deleted Successfully']);
    }

    public function getQuestionAnswerInfo($id){
        $data = ProductQuestionAnswer::where('id', $id)->first();
        return response()->json($data);
    }

    public function submitAnswerOfQuestion(Request $request){
        ProductQuestionAnswer::where('id', $request->question_answer_id)->update([
            'answer' => $request->answer,
            'updated_at' => Carbon::now()
        ]);
        return response()->json(['success' => 'Replied Successfully.']);
    }

}
