<?php

namespace App\Imports;

use App\Models\Product;
use App\Models\ProductVariant;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\ToCollection;

class BulkProductUpdate implements ToCollection
{
    /**
    * @param Collection $collection
    */
    public function collection(Collection $collection)
    {
        foreach($collection as $index => $data){
            if($index > 0){
                $productCode = $data[1];
                $productInfo = Product::where('code', $productCode)->first();
                if($productCode && $productInfo){
                    $variantStatus = $data[2];
                    if(strtolower($variantStatus) == 'yes'){

                        $query = ProductVariant::where('product_id', $productInfo->id);

                        if($data[3]){
                            $colorInfo = DB::table('colors')->where('name', $data[3])->first();
                            if($colorInfo){
                                $query->where('color_id', $colorInfo->id);
                            }
                        }
                        if($data[4]){
                            $sizeInfo = DB::table('product_sizes')->where('name', $data[4])->first();
                            if($sizeInfo){
                                $query->where('size_id', $sizeInfo->id);
                            }
                        }
                        if($data[5]){
                            $partOfData = explode("/",$data[5]);
                            $storageInfo = DB::table('storage_types')->where('ram', $partOfData[0])->where('rom', $partOfData[1])->first();
                            if($storageInfo){
                                $query->where('storage_type_id', $storageInfo->id);
                            }
                        }
                        if($data[6]){
                            $countryInfo = DB::table('country')->where('name', $data[6])->first();
                            if($countryInfo){
                                $query->where('region_id', $countryInfo->id);
                            }
                        }

                        $variantInfo = $query->first();
                        $variantInfo->price = $data[7];
                        $variantInfo->discounted_price = $data[8];
                        $variantInfo->stock = $data[9];
                        $variantInfo->save();

                        // $productInfo->price = $data[7];
                        // $productInfo->discount_price = $data[8];
                        // $productInfo->stock = $data[9];
                        $productInfo->status = strtolower($data[10]) == 'active' ? 1 : 0;
                        $productInfo->save();

                    } else {
                        $productInfo->price = $data[7];
                        $productInfo->discount_price = $data[8];
                        $productInfo->stock = $data[9];
                        $productInfo->status = strtolower($data[10]) == 'active' ? 1 : 0;
                        $productInfo->save();
                    }
                }

            }
        }
    }
}
