@extends('backend.master')

@section('page_title')
    Orders
@endsection
@section('page_heading')
    Create New Order
@endsection

@section('header_css')
    <link href="{{ url('assets') }}/plugins/select2/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="{{ url('assets') }}/css/pos.css" rel="stylesheet" type="text/css" />
@endsection

@section('content')
    <div class="row">

        <div class="col-lg-12 col-xl-5 col-md-5 col-12">
            <div class="card">
                <div class="card-body">
                    <div class="mb-4">
                        @include('backend.orders.pos.product_search_form')
                    </div>
                    <div class="pos-item-card-group" style="max-height: 820px; overflow-y: scroll; padding-right: 12px;">
                        <ul class="live_search">
                            @include('backend.orders.pos.live_search_products')
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-12 col-xl-7 col-md-7 col-12">
            <form action="{{url('place/order')}}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-8 col-12">
                                <select class="form-control w-100" name="customer_id" onchange="getSavedAddress(this.value)" data-toggle="select2">
                                    <option value="">Walk in Customer</option>
                                    @foreach($customers as $customer)
                                    <option value="{{$customer->id}}">{{$customer->name}} (@if($customer->email){{$customer->email}}@else{{$customer->phone}}@endif)</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-lg-4 col-12">
                                <div class="card-body-inner text-right">
                                    <!-- Button trigger modal -->
                                    <button type="button" class="btn btn-primary mr-1 text-right" data-toggle="modal" data-target="#exampleModal">
                                        <i class="fa fa-user"></i>
                                    </button>

                                    <!-- Button trigger modal -->
                                    <button type="button" class="btn btn-primary text-right" data-toggle="modal" data-target="#exampleModal2">
                                        <i class="fa fa-truck"></i>
                                    </button>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end card body-->
                </div>

                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive pos-data-table">
                            <table class="table table-bordered table-sm mb-0">
                                <thead>
                                    <tr>
                                        <th class="text-center">SL</th>
                                        <th class="text-center">Image</th>
                                        <th class="text-center">Product</th>
                                        <th class="text-center">Price</th>
                                        <th class="text-center">QTY</th>
                                        <th class="text-center">Subtotal</th>
                                        <th class="text-center">Remove</th>
                                    </tr>
                                </thead>
                                <tbody class="cart_items">
                                    @include('backend.orders.pos.cart_items')
                                </tbody>
                            </table>
                        </div>

                        <div class="table-responsive pt-4">
                            <table class="table mb-0">
                                <thead>
                                    <tr>
                                        <th class="text-center">Sub Total</th>
                                        <th class="text-center">Total Tax</th>
                                        <th class="text-center">Shipping Charge</th>
                                        <th class="text-center">Discount</th>
                                        <th class="text-center">Total</th>
                                    </tr>
                                </thead>
                                <tbody class="cart_calculation">
                                    @include('backend.orders.pos.cart_calculation')
                                </tbody>
                            </table>
                        </div>

                        <div class="row mt-4">
                            <div class="col-lg-12">
                                <input type="text" id="coupon_code" placeholder="Coupon Code" class="form-control d-inline-block w-25">
                                <button type="button" class="btn btn-success rounded" onclick="applyCoupon()" style="margin-top: -3px; line-height: 22px;">Apply Coupon</button>
                            </div>
                        </div>
                    </div>
                    <!-- end card body-->
                </div>

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col-lg-12 saved_address">
                                {{-- render saved address here based on customer selction --}}
                            </div>
                        </div>

                        <div class="shipping-address-table">
                            <div class="card-body">
                                <ul class="nav nav-tabs nav-justified mb-3">
                                    <li class="nav-item">
                                        <a href="#home1" data-toggle="tab" aria-expanded="true" class="nav-link active">
                                            <i class="fa fa-truck d-lg-none d-block"></i>
                                            <span class="d-none d-lg-block">Shipping Address</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#profile1" data-toggle="tab" aria-expanded="false" class="nav-link">
                                            <i class="fa fa-truck d-lg-none d-block"></i>
                                            <span class="d-none d-lg-block">Billing Address</span>
                                        </a>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <div class="tab-pane show active" id="home1">
                                        @include('backend.orders.pos.shipping_form')
                                    </div>
                                    <div class="tab-pane" id="profile1">
                                        @include('backend.orders.pos.billing_form')
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mt-4">
                            <h4 class="mb-3">Delivery Method</h4>

                            <div class="mt-3">
                                <div class="custom-control custom-radio mb-2">
                                    <input type="radio" id="store_pickup" name="delivery_method" onchange="changeOfDeliveryMetod(1)" value="1" class="custom-control-input" required style="cursor: pointer"/>
                                    <label class="custom-control-label" for="store_pickup" style="cursor: pointer">
                                        Store Pickup
                                    </label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="home_delivery" name="delivery_method" onchange="changeOfDeliveryMetod(2)" value="2" class="custom-control-input" required style="cursor: pointer"/>
                                    <label class="custom-control-label" for="home_delivery" style="cursor: pointer">
                                        Home Delivery
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="mt-4">
                            <h4 class="mb-3">Order Note</h4>
                            <div class="form-group">
                                <textarea class="form-control" name="special_note" rows="3" placeholder="Enter Note"></textarea>
                            </div>
                        </div>

                        <div class="mt-4">
                            <button type="submit" class="btn btn-success mr-1 text-right">
                                Confirm Order
                            </button>
                        </div>

                    </div>
                </div>
            <form>
        </div>
    </div>

    <!-- Modal -->
    @include('backend.orders.pos.customer_create_modal')

    <!-- Modal -->
    @include('backend.orders.pos.customer_address_modal')

    <div class="modal fade" id="variantModal" tabindex="-1" role="dialog" aria-labelledby="variantModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form id="productVariantForm" name="productVariantForm" class="form-horizontal">
                    <div class="modal-header">
                        <h5 class="modal-title" id="variantModalLabel">Select Product Varinat</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="flag_slug" id="flag_slug">
                        <div class="form-group">
                            <label>Product Name</label>
                            <input type="text" class="form-control" id="variant_product_name" readonly>
                            <input type="hidden" class="form-control" id="variant_product_id">
                        </div>

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Select Color</label>
                                    <select class="form-control" onchange="checkVariant()" id="variant_color_id">
                                        <option value="">Select One</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Select Size</label>
                                    <select class="form-control" onchange="checkVariant()" id="variant_size_id">
                                        <option value="">Select One</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Product Price</label>
                                    <input type="text" class="form-control" id="variant_price" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Stock</label>
                                    <input type="text" class="form-control" id="variant_stock" readonly>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" onclick="variantAddToCart()" class="btn btn-primary variant_modal_footer_btn">Add to Cart</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@section('footer_js')
    <script src="{{ url('assets') }}/plugins/select2/select2.min.js"></script>
    <script>
        $('[data-toggle="select2"]').select2();

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        function changeOfDeliveryMetod(value){

            var formData = new FormData();
            formData.append("delivery_method", value);
            formData.append("shipping_district_id", $("#shipping_district_id").val());

            $.ajax({
                data: formData,
                url: "{{ url('change/delivery/method') }}",
                type: "POST",
                cache: false,
                contentType: false,
                processData: false,
                success: function(data) {
                    $('.cart_calculation').html(data.cart_calculation);
                },
                error: function(data) {
                    toastr.options.positionClass = 'toast-bottom-right';
                    toastr.options.timeOut = 1000;
                    toastr.error("Something Went Wrong");
                }
            });

        }

        function applySavedAddress(slug) {
            // fetching the values
            var name = $("#saved_address_name_" + slug).val();
            var phone = $("#saved_address_phone_" + slug).val();
            var address = $("#saved_address_line_" + slug).val();
            var district = $("#saved_address_district_" + slug).val();
            var upazila = $("#saved_address_upazila_" + slug).val();
            var post_code = $("#saved_address_post_code_" + slug).val();

            // setting the values
            $("#shipping_name").val(name);
            $("#shipping_phone").val(phone);
            $("#shipping_address").val(address);
            $("#shipping_district_id option:contains('" + district + "')").prop("selected", true).change();
            setTimeout(function() {
                $("#shipping_thana_id option:contains('" + upazila + "')").prop("selected", true).change();
            }, 1000);
            $("#shipping_postal_code").val(post_code);
        }

        function sameShippingBilling(){

            if($("#flexCheckChecked").prop('checked') == true){
                var shppingName = $("#shipping_name").val();
                var shppingPhone = $("#shipping_phone").val();
                var shppingAdress = $("#shipping_address").val();
                var shppingDistrict = $("#shipping_district_id").val();
                var shippingThana = $("#shipping_thana_id").val();
                var shppingPostalCode = $("#shipping_postal_code").val();

                if(shppingName == '' || shppingName == null){
                    toastr.options.positionClass = 'toast-bottom-right';
                    toastr.options.timeOut = 1000;
                    toastr.error("Please Write Shipping Customer Name");
                    $("#flexCheckChecked").prop("checked", false);
                    return false;
                }
                if(shppingPhone == '' || shppingPhone == null){
                    toastr.options.positionClass = 'toast-bottom-right';
                    toastr.options.timeOut = 1000;
                    toastr.error("Please Write Shipping Customer Phone");
                    $("#flexCheckChecked").prop("checked", false);
                    return false;
                }
                if(shppingAdress == '' || shppingAdress == null){
                    toastr.options.positionClass = 'toast-bottom-right';
                    toastr.options.timeOut = 1000;
                    toastr.error("Please Write Shipping Address");
                    $("#flexCheckChecked").prop("checked", false);
                    return false;
                }
                if(!shppingDistrict || shppingDistrict == "" || shppingDistrict == null){
                    toastr.options.positionClass = 'toast-bottom-right';
                    toastr.options.timeOut = 1000;
                    toastr.error("Please Select Shipping District");
                    $("#flexCheckChecked").prop("checked", false);
                    return false;
                }
                if(shippingThana == '' || shippingThana == null){
                    toastr.options.positionClass = 'toast-bottom-right';
                    toastr.options.timeOut = 1000;
                    toastr.error("Please Select Shipping Thana");
                    $("#flexCheckChecked").prop("checked", false);
                    return false;
                }

                $("#billing_address").val(shppingAdress);
                $("#billing_district_id").val(shppingDistrict).change();
                $("#billing_postal_code").val(shppingPostalCode);

                var district_id = shppingDistrict;
                $("#billing_thana_id").html('');

                $.ajax({
                    url: "{{url('/district/wise/thana')}}",
                    type: "POST",
                    data: {
                        district_id: district_id,
                        _token: '{{csrf_token()}}'
                    },
                    dataType: 'json',
                    success: function (result) {
                        $('#billing_thana_id').html('<option data-display="Select One" value="">Select Thana</option>');
                        $.each(result.data, function (key, value) {
                            $("#billing_thana_id").append('<option value="' + value.id + '">' + value.name + '</option>');
                        });
                        $("#billing_thana_id").val(shippingThana).change();
                        $(".order-review-summary").html(result.checkoutTotalAmount);
                    }
                });

            } else {
                $("#billing_name").val('');
                $("#billing_phone").val('');
                $("#billing_address").val('');
                $("#billing_district_id").val('').change();
                $("#billing_thana_id").html('');
                $('#billing_thana_id').html('<option data-display="Select One" value="">Select Thana</option>');
                $("#billing_postal_code").val('');
            }

        }

        function getSavedAddress(user_id){
            $.get("{{ url('get/saved/address') }}" + '/' + user_id, function(data) {
                $('.saved_address').html(data.saved_address);
                $('#shipping_name').val(data.user_info.name);
                $('#shipping_phone').val(data.user_info.phone);
                $('#shipping_email').val(data.user_info.email);

                $('#billing_name').val(data.user_info.name);
                $('#billing_phone').val(data.user_info.phone);
            })
        }

        function liveSearchProduct(){

            var productName = $("#search_keyword").val();
            var productCategoryId = $("#product_category_id").val();
            var productBrandId = $("#product_brand_id").val();

            var formData = new FormData();
            formData.append("product_name", productName);
            formData.append("category_id", productCategoryId);
            formData.append("brand_id", productBrandId);

            $.ajax({
                data: formData,
                url: "{{ url('product/live/search') }}",
                type: "POST",
                cache: false,
                contentType: false,
                processData: false,
                success: function(data) {
                    $('.live_search').html(data.searchResults);
                },
                error: function(data) {
                    toastr.options.positionClass = 'toast-bottom-right';
                    toastr.options.timeOut = 1000;
                    toastr.error("Something Went Wrong");
                }
            });
        }

        function showVariant(product_id){

            var formData = new FormData();
            formData.append("product_id", product_id);

            $.ajax({
                data: formData,
                url: "{{ url('get/pos/product/variants') }}",
                type: "POST",
                cache: false,
                contentType: false,
                processData: false,
                success: function(data) {
                    $('#productVariantForm').trigger("reset");
                    $('#variantModal').modal('show');
                    $("#variant_product_name").val(data.product.name+' ('+data.product.code+')');
                    $("#variant_product_id").val(data.product.id);

                    // colors
                    $('#variant_color_id').html('<option value="">--Select Color--</option>');
                    $.each(data.colors, function (key, value) {
                        $("#variant_color_id").append('<option value="' + value.id + '">' + value.name + '</option>');
                    });

                    // size
                    $('#variant_size_id').html('<option value="">--Select Size--</option>');
                    $.each(data.sizes, function (key, value) {
                        $("#variant_size_id").append('<option value="' + value.id + '">' + value.name + '</option>');
                    });
                },
                error: function(data) {
                    toastr.options.positionClass = 'toast-bottom-right';
                    toastr.options.timeOut = 1000;
                    toastr.error("Something Went Wrong");
                }
            });

        }

        function checkVariant(){

            var formData = new FormData();
            formData.append("product_id", $("#variant_product_id").val());
            formData.append("color_id", $("#variant_color_id").val());
            formData.append("size_id", $("#variant_size_id").val());

            $.ajax({
                data: formData,
                url: "{{ url('check/pos/product/variant') }}",
                type: "POST",
                cache: false,
                contentType: false,
                processData: false,
                success: function(data) {

                    if (Number(data.price) > 0 && Number(data.stock) > 0) {
                        $("#variant_price").val(Number(data.price));
                        $("#variant_stock").val(Number(data.stock));
                        $(".variant_modal_footer_btn").css('display', 'inline-block')
                    } else {
                        $("#variant_price").val(Number(0));
                        $("#variant_stock").val(Number(0));
                        $(".variant_modal_footer_btn").css('display', 'none')
                    }

                },
                error: function(data) {
                    toastr.options.positionClass = 'toast-bottom-right';
                    toastr.options.timeOut = 1000;
                    toastr.error("Something Went Wrong");
                }
            });

        }

        function variantAddToCart(){

            var variant_product_id = $("#variant_product_id").val();
            var variant_color_id = $("#variant_color_id").val();
            var variant_size_id = $("#variant_size_id").val();

            if(variant_color_id == ''){
                variant_color_id = 0;
            }
            if(variant_size_id == ''){
                variant_size_id = 0;
            }

            addToCart(variant_product_id, variant_color_id, variant_size_id);
            $('#variantModal').modal('hide');
        }

        function addToCart(product_id, color_id, size_id){

            var formData = new FormData();
            formData.append("product_id", product_id);
            formData.append("color_id", color_id);
            formData.append("size_id", size_id);

            $.ajax({
                data: formData,
                url: "{{ url('add/to/cart') }}",
                type: "POST",
                cache: false,
                contentType: false,
                processData: false,
                success: function(data) {
                    // toastr.success("Item added in Cart");
                    $('.cart_items').html(data.rendered_cart);
                    $('.cart_calculation').html(data.cart_calculation);
                },
                error: function(data) {
                    toastr.options.positionClass = 'toast-bottom-right';
                    toastr.options.timeOut = 1000;
                    toastr.error("Something Went Wrong");
                }
            });

        }

        function removeCartItem(cartIndex){
            $.get("{{ url('remove/cart/item') }}" + '/' + cartIndex, function(data) {
                // toastr.error("Item Removed");
                $('.cart_items').html(data.rendered_cart);
                $('.cart_calculation').html(data.cart_calculation);
            })
        }

        function updateCartQty(value, cartIndex){
            $.get("{{ url('update/cart/item') }}" + '/' + cartIndex + '/' + value, function(data) {
                $('.cart_items').html(data.rendered_cart);
                $('.cart_calculation').html(data.cart_calculation);
            })
        }

        function applyCoupon(){
            var couponCode = $("#coupon_code").val();
            toastr.options.positionClass = 'toast-bottom-right';
            toastr.options.timeOut = 1000;

            if (couponCode == '') {
                toastr.error("Please Enter a Coupon Code");
                return false;
            }

            var formData = new FormData();
            formData.append("coupon_code", couponCode);
            $.ajax({
                data: formData,
                url: "{{ url('apply/coupon') }}",
                type: "POST",
                cache: false,
                contentType: false,
                processData: false,
                success: function(data) {
                    if (data.status == 0) {
                        toastr.error(data.message);
                    } else {
                        toastr.success(data.message);
                        $('.cart_calculation').html(data.cart_calculation);
                        $("input[name='delivery_method']").prop("checked", false);
                    }
                },
                error: function(data) {
                    console.log('Error:', data);
                }
            });
        }

        function updateOrderTotalAmount(){

            var shippingCharge = parseFloat($("#shipping_charge").val());
            if (isNaN(shippingCharge)) {
                shippingCharge = 0;
            }

            var discount = parseFloat($("#discount").val());
            if (isNaN(discount)) {
                discount = 0;
            }

            var priceInputField = document.getElementById("subtotal");
            var currentPrice = parseFloat(priceInputField.value);
            if (isNaN(currentPrice)) {
                currentPrice = 0;
            }

            if(discount > currentPrice){
                toastr.error("Discount cannot be greater than Order Amount");
                return false;
            }

            $.get("{{ url('update/order/total') }}" + '/' + shippingCharge + '/' + discount, function(data) {
                var newPrice = (currentPrice + shippingCharge) - discount;
                var totalPriceDiv = document.getElementById("total_cart_calculation");
                totalPriceDiv.innerText = '৳ ' + newPrice.toLocaleString("en-BD", { minimumFractionDigits: 2, maximumFractionDigits: 2 });
                $("input[name='delivery_method']").prop("checked", false);
            });

        }

        $(document).ready(function() {

            $('#shipping_district_id').on('change', function() {
                var district_id = this.value;
                $("#shipping_thana_id").html('');
                $.ajax({
                    url: "{{ url('/district/wise/thana') }}",
                    type: "POST",
                    data: {
                        district_id: district_id,
                        _token: '{{ csrf_token() }}'
                    },
                    dataType: 'json',
                    success: function(result) {
                        $('#shipping_thana_id').html(
                            '<option data-display="Select One" value="">Select One</option>'
                        );
                        $.each(result.data, function(key, value) {
                            $("#shipping_thana_id").append('<option value="' + value
                                .id + '">' + value.name + '</option>');
                        });
                        $('.cart_calculation').html(result.cart_calculation);
                        $("input[name='delivery_method']").prop("checked", false);
                    }
                });
            });

            $('#billing_district_id').on('change', function() {
                var district_id = this.value;
                $("#billing_thana_id").html('');
                $.ajax({
                    url: "{{ url('/district/wise/thana') }}",
                    type: "POST",
                    data: {
                        district_id: district_id,
                        _token: '{{ csrf_token() }}'
                    },
                    dataType: 'json',
                    success: function(result) {
                        $('#billing_thana_id').html(
                            '<option data-display="Select One" value="">Select One</option>'
                        );
                        $.each(result.data, function(key, value) {
                            $("#billing_thana_id").append('<option value="' + value.id +
                                '">' + value.name + '</option>');
                        });
                    }
                });
            });

            $('#customer_address_district_id').on('change', function() {
                var district_id = this.value;
                $("#customer_address_thana_id").html('');
                $.ajax({
                    url: "{{ url('/district/wise/thana/by/name') }}",
                    type: "POST",
                    data: {
                        district_id: district_id,
                        _token: '{{ csrf_token() }}'
                    },
                    dataType: 'json',
                    success: function(result) {
                        $('#customer_address_thana_id').html(
                            '<option data-display="Select One" value="">Select One</option>'
                        );
                        $.each(result.data, function(key, value) {
                            $("#customer_address_thana_id").append('<option value="' + value.name +
                                '">' + value.name + '</option>');
                        });
                    }
                });
            });

        });
    </script>
@endsection
