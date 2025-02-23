<div class="card" id="printableArea">
    <div class="card-body">

        <div class="row pb-3">
            <div class="col-lg-6">
                <h4 class="card-title">Stock Report</h4>
            </div>
            <div class="col-lg-6 text-right">
                <a href="javascript:void(0);" onclick="printPageArea('printableArea')" class="hidden-print btn btn-sm btn-success rounded"><i class="fas fa-print"></i> Print Report</a>
            </div>
        </div>

        <table class="table table-striped table-bordered w-100 table-sm">
            <thead>
                <tr>
                    <th class="text-center">SL</th>
                    <th class="text-center">Category</th>
                    <th class="text-center">Code</th>
                    <th class="text-center">Product Name</th>
                    <th class="text-center" style="min-width: 75px;">Price</th>
                    <th class="text-center" style="width: 350px;">Variant</th>
                    <th class="text-center" style="min-width: 75px;">Stock</th>
                </tr>
            </thead>
            <tbody>


                @php

                    $products = array();
                    $indexSerial = 0;
                    foreach($data as $item){

                        $categoryInfo = App\Models\Category::where('id', $item->category_id)->first();

                        $productVariants = App\Models\ProductVariant::where('product_id', $item->id)->get();
                        if($productVariants && count($productVariants) > 0){


                            foreach($productVariants as $variant){
                                $variantString = '';

                                if($variant->color_id){
                                    $colorInfo = App\Models\Color::where('id', $variant->color_id)->first();
                                    $variantString .= $colorInfo->name.', ';
                                }
                                if($variant->size_id){
                                    $sizeInfo = App\Models\ProductSize::where('id', $variant->size_id)->first();
                                    $variantString .= $sizeInfo->name.', ';
                                }
                                if($variant->storage_type_id){
                                    $storageTypeInfo = App\Models\StorageType::where('id', $variant->storage_type_id)->first();
                                    $variantString .= $storageTypeInfo->ram."/".$storageTypeInfo->rom.', ';
                                }
                                if($variant->region_id){
                                    $regionInfo = DB::table('country')->where('id', $variant->region_id)->first();
                                    $variantString .= $regionInfo->nicename.', ';
                                }

                                $products[$indexSerial]['category'] = $categoryInfo ? $categoryInfo->name : null;
                                $products[$indexSerial]['code'] = $item->code;
                                $products[$indexSerial]['name'] = $item->name;
                                $products[$indexSerial]['price'] = $variant->discounted_price > 0 ? $variant->discounted_price : $variant->price;
                                $products[$indexSerial]['variant'] = rtrim($variantString, ', ');
                                $products[$indexSerial]['stock'] = $variant->stock;
                                $indexSerial++;
                            }

                        } else {
                            $products[$indexSerial]['category'] = $categoryInfo ? $categoryInfo->name : null;
                            $products[$indexSerial]['code'] = $item->code;
                            $products[$indexSerial]['name'] = $item->name;
                            $products[$indexSerial]['price'] = $item->discount_price > 0 ? $item->discount_price : $item->price;
                            $products[$indexSerial]['variant'] = null;
                            $products[$indexSerial]['stock'] = $item->stock;
                            $indexSerial++;
                        }
                    }

                @endphp

                @php
                    $sl = 1;
                    usort($products, function ($a, $b) {
                        return $a['stock'] <=> $b['stock'];
                    });
                @endphp

                @foreach ($products as $product)

                    @php
                        if($min_stock && $min_stock >= 0 && $product['stock'] <= $min_stock){
                            continue;
                        }
                        if($max_stock && $max_stock >= 0 && $product['stock'] >=  $max_stock){
                            continue;
                        }
                    @endphp

                    <tr>
                        <td class="text-center">{{ $sl++ }}</td>
                        <td class="text-center">{{ $product['category'] }}</td>
                        <td class="text-center">{{ $product['code'] }}</td>
                        <td class="text-center">{{ $product['name'] }}</td>
                        <td class="text-center">{{ number_format($product['price']) }}/=</td>
                        <td class="text-center">{{ $product['variant'] }}</td>
                        <td class="text-center">{{ $product['stock'] }}</td>
                    </tr>

                @endforeach

            </tbody>
        </table>

    </div>
</div>
