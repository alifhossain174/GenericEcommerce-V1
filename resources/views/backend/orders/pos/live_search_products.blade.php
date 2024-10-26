@foreach($products as $product)
    @php
        $variants = DB::table('product_variants')
                        ->leftJoin('products', 'product_variants.product_id', 'products.id')
                        ->leftJoin('colors', 'product_variants.color_id', 'colors.id')
                        ->leftJoin('product_sizes', 'product_variants.size_id', 'product_sizes.id')
                        ->select('product_variants.*', 'products.name as product_name', 'products.image as product_image', 'colors.name as color_name', 'product_sizes.name as size_name')
                        ->where('product_variants.product_id', $product->id)
                        ->get();
    @endphp

    @if(count($variants) == 0)
    <li class="live_search_item">
        <img loading="lazy" src="{{ url($product->image) }}" alt="">
        <h6 class="live_search_product_title">
            <span class="d-block live_search_product_name">{{$product->name}}</span>
            <span class="d-block" style="font-weight: 400">--No Variant--</span>
            <span class="d-block" style="font-weight: 400">
                @if($product->discount_price > 0)
                <del>৳{{$product->price}}</del>
                ৳{{$product->discount_price}}
                @else
                ৳{{$product->price}}
                @endif

                @if($product->stock)
                (Stock: {{$product->stock}})
                @endif
            </span>
        </h6>
        @if($product->stock)
        <a href="javascript:void(0)" onclick="addToCart({{$product->id}},0,0)" class="add_to_cart_btn"><i class="fas fa-cart-arrow-down fa-fw"></i></a>
        @else
        <a href="javascript:void(0)" class="add_to_cart_btn stock_out">Stock Out</a>
        @endif
    </li>
    @else
        @foreach($variants as $variant)
        <li class="live_search_item">
            <img loading="lazy" src="{{ url($variant->product_image) }}" alt="">
            <h6 class="live_search_product_title">
                <span class="d-block live_search_product_name">{{$variant->product_name}}</span>
                <span class="d-block" style="font-weight: 400">Color: {{$variant->color_name}}; Size: {{$variant->size_name}}</span>
                <span class="d-block" style="font-weight: 400">
                    @if($variant->discounted_price > 0)
                    <del>৳{{$variant->price}}</del>
                    ৳{{$variant->discounted_price}}
                    @else
                    ৳{{$variant->price}}
                    @endif

                    @if($variant->stock)
                    (Stock: {{$variant->stock}})
                    @endif
                </span>
            </h6>

            @if($variant->stock)
            <a href="javascript:void(0)" onclick="addToCart({{$variant->product_id}},{{$variant->color_id}},{{$variant->size_id}})" class="add_to_cart_btn"><i class="fas fa-cart-arrow-down fa-fw"></i></a>
            @else
            <a href="javascript:void(0)" class="add_to_cart_btn stock_out">Stock Out</a>
            @endif

        </li>
        @endforeach
    @endif
@endforeach
