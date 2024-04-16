<?php

namespace App\Imports;

use App\Models\Product;
use App\Models\ProductVariant;
use Carbon\Carbon;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\ToCollection;

class ProductImport implements ToCollection
{
    /**
    * @param Collection $collection
    */
    public function collection(Collection $collection)
    {
        foreach($collection as $index => $data){
            if($index > 0){

                $categoryId = null;
                if($data[1]){
                    $categoryInfo = DB::table('categories')->where('name', $data[1])->first();
                    if($categoryInfo){
                        $categoryId = $categoryInfo->id;
                    }
                }

                $subCategoryId = null;
                if ($data[2]) {
                    $subCategoryInfo = DB::table('subcategories')->where('name', $data[2])->first();
                    if ($subCategoryInfo) {
                        $subCategoryId = $subCategoryInfo->id;
                    }
                }

                $childCategoryId = null;
                if ($data[3]) {
                    $childCategoryInfo = DB::table('child_categories')->where('name', $data[3])->first();
                    if ($childCategoryInfo) {
                        $childCategoryId = $childCategoryInfo->id;
                    }
                }

                $brandId = null;
                if ($data[4]) {
                    $brandInfo = DB::table('brands')->where('name', $data[4])->first();
                    if ($brandInfo) {
                        $brandId = $brandInfo->id;
                    }
                }

                $modelId = null;
                if ($data[5]) {
                    $modelInfo = DB::table('product_models')->where('name', $data[5])->first();
                    if ($modelInfo) {
                        $modelId = $modelInfo->id;
                    }
                }

                $productName = $data[6];
                $productCode = $data[7];

                $imageData = $data[8];
                $productImageName = null;
                if (strpos($imageData, 'base64') !== false) {

                    $base64_str = substr($imageData, strpos($imageData, ",") + 1);
                    $image = base64_decode($base64_str);
                    $imageName = time() . '_' . uniqid() . '.jpg';

                    $uploadPath = public_path('productImages/');
                    // $moved = move_uploaded_file($image, $uploadPath . '/' . $imageName);
                    $moved = file_put_contents($uploadPath . '/' . $imageName, $image);

                    if ($moved) {
                        $productImageName = "productImages/" .$imageName;
                    }
                }

                $productShortDescription = $data[10];
                $productDescription = $data[11];
                $productSpecification = $data[12];
                $productWarrentyPolicy = $data[13];
                $productPrice = $data[14];
                $productDiscountPrice = $data[15];
                $productStock = $data[16];


                $unitId = null;
                if ($data[17]) {
                    $unitInfo = DB::table('units')->where('name', $data[17])->first();
                    if ($unitInfo) {
                        $unitId = $unitInfo->id;
                    }
                }

                $productTag = $data[18];
                $productVideoUrl = $data[19];

                $warrentyId = null;
                if ($data[20]) {
                    $warrentyInfo = DB::table('product_warrenties')->where('name', $data[20])->first();
                    if ($warrentyInfo) {
                        $warrentyId = $warrentyInfo->id;
                    }
                }

                $flagId = null;
                if ($data[21]) {
                    $flagInfo = DB::table('flags')->where('name', $data[21])->first();
                    if ($flagInfo) {
                        $flagId = $flagInfo->id;
                    }
                }

                $productSeoMetaTitle = $data[22];
                $productSeoMetaKeywords = $data[23];
                $productSeoMetaDescription = $data[24];
                $productStatus = $data[25];
                $productHasVariant = $data[26];

                $colorId = null;
                if ($data[27]) {
                    $colorInfo = DB::table('colors')->where('name', $data[27])->first();
                    if ($colorInfo) {
                        $colorId = $colorInfo->id;
                    }
                }

                $sizeId = null;
                if ($data[28]) {
                    $sizeInfo = DB::table('product_sizes')->where('name', $data[28])->first();
                    if ($sizeInfo) {
                        $sizeId = $sizeInfo->id;
                    }
                }

                $regionId = null;
                if ($data[29]) {
                    $regionInfo = DB::table('country')->where('name', $data[29])->first();
                    if ($regionInfo) {
                        $regionId = $regionInfo->id;
                    }
                }

                $deviceConditionId = null;
                if ($data[30]) {
                    $deviceConditionIdInfo = DB::table('device_conditions')->where('name', $data[30])->first();
                    if ($deviceConditionIdInfo) {
                        $deviceConditionId = $deviceConditionIdInfo->id;
                    }
                }

                if($data[0] == 'product'){

                    $clean = preg_replace('/[^a-zA-Z0-9\s]/', '', strtolower($productName)); //remove all non alpha numeric
                    $slug = preg_replace('!\s+!', '-', $clean);

                    $productId = Product::insertGetId([
                        'category_id' => $categoryId,
                        'subcategory_id' => $subCategoryId,
                        'childcategory_id' => $childCategoryId,
                        'brand_id' => $brandId,
                        'model_id' => $modelId,
                        'name' => $productName,
                        'code' => $productCode,
                        'image' => $productImageName,
                        'multiple_images' => null,
                        'short_description' => $productShortDescription,
                        'description' => $productDescription,
                        'specification' => $productSpecification,
                        'warrenty_policy' => $productWarrentyPolicy,
                        'price' => $productPrice,
                        'discount_price' => $productDiscountPrice,
                        'stock' => $productStock ? $productStock : 0,
                        'unit_id' => $unitId,
                        'tags' => $productTag,
                        'video_url' => $productVideoUrl,
                        'warrenty_id' => $warrentyId,
                        'slug' => $slug,
                        'flag_id' => $flagId,
                        'meta_title' => $productSeoMetaTitle,
                        'meta_keywords' => $productSeoMetaKeywords,
                        'meta_description' => $productSeoMetaDescription,
                        'status' => $productStatus,
                        'has_variant' => $productHasVariant,
                        'created_at' => Carbon::now(),
                    ]);

                    session(['product_id' => $productId]);

                } else {

                    ProductVariant::insert([
                        'product_id' => session('product_id'),
                        'color_id' => $colorId,
                        'size_id' => $sizeId,
                        'region_id' => $regionId,
                        'stock' => $productStock ? $productStock : 0,
                        'price' => $productPrice,
                        'discounted_price' => $productDiscountPrice,
                        'warrenty_id' => $warrentyId,
                        'device_condition_id' => $deviceConditionId,
                        'created_at' => Carbon::now(),
                    ]);

                }


            }
        }

        session()->forget(['product_id']);
    }
}
