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
                $productShortDescription = $data[8];
                $productDescription = $data[9];
                $productSpecification = $data[10];
                $productWarrentyPolicy = $data[11];
                $productPrice = $data[12];
                $productDiscountPrice = $data[13];
                $productStock = $data[14];


                $unitId = null;
                if ($data[15]) {
                    $unitInfo = DB::table('units')->where('name', $data[15])->first();
                    if ($unitInfo) {
                        $unitId = $unitInfo->id;
                    }
                }

                $productTag = $data[16];
                $productVideoUrl = $data[17];

                $warrentyId = null;
                if ($data[18]) {
                    $warrentyInfo = DB::table('product_warrenties')->where('name', $data[18])->first();
                    if ($warrentyInfo) {
                        $warrentyId = $warrentyInfo->id;
                    }
                }

                $flagId = null;
                if ($data[19]) {
                    $flagInfo = DB::table('flags')->where('name', $data[19])->first();
                    if ($flagInfo) {
                        $flagId = $flagInfo->id;
                    }
                }

                $productSeoMetaTitle = $data[17];
                $productSeoMetaKeywords = $data[18];
                $productSeoMetaDescription = $data[19];
                $productStatus = $data[20];
                $productHasVariant = $data[21];

                $colorId = null;
                if ($data[22]) {
                    $colorInfo = DB::table('colors')->where('name', $data[22])->first();
                    if ($colorInfo) {
                        $colorId = $colorInfo->id;
                    }
                }

                $sizeId = null;
                if ($data[23]) {
                    $sizeInfo = DB::table('product_sizes')->where('name', $data[23])->first();
                    if ($sizeInfo) {
                        $sizeId = $sizeInfo->id;
                    }
                }

                $regionId = null;
                if ($data[24]) {
                    $regionInfo = DB::table('country')->where('name', $data[24])->first();
                    if ($regionInfo) {
                        $regionId = $regionInfo->id;
                    }
                }

                $deviceConditionId = null;
                if ($data[25]) {
                    $deviceConditionIdInfo = DB::table('device_conditions')->where('name', $data[25])->first();
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
                        'image' => null,
                        'multiple_images' => null,
                        'short_description' => $productShortDescription,
                        'description' => $productDescription,
                        'specification' => $productSpecification,
                        'warrenty_policy' => $productWarrentyPolicy,
                        'price' => $productPrice,
                        'discount_price' => $productDiscountPrice,
                        'stock' => $productStock,
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
                        'stock' => $productStock,
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
