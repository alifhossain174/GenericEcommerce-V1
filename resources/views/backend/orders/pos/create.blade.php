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

        <div class="col-lg-12 col-xl-6 col-md-6 col-12">
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

        <div class="col-lg-12 col-xl-6 col-md-6 col-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-8 col-12">
                            <select class="form-control w-100" data-toggle="select2">
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

                                <!-- Modal -->
                                @include('backend.orders.pos.customer_create_modal')

                                <!-- Modal -->
                                @include('backend.orders.pos.customer_address_modal')

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
                </div>
                <!-- end card body-->
            </div>

            <div class="card">
                <div class="card-body">
                    <form>
                        <div class="shipping-address-table">
                            <div class="card-body">
                                <ul class="nav nav-tabs nav-justified mb-3">
                                    <li class="nav-item">
                                        <a href="#home1" data-toggle="tab" aria-expanded=" true"
                                            class="nav-link active">
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
                                        <div class="table-responsive">
                                            <table class="table mb-0">
                                                <tbody>
                                                    <tr>
                                                        <th>Name</th>
                                                        <td>Meheraj Hossain</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Phone</th>
                                                        <td>+1 (505) 536-5292</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Email</th>
                                                        <td>mhossainsagar@gmail.com</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Address</th>
                                                        <td>Matlabsouth</td>
                                                    </tr>
                                                    <tr>
                                                        <th>City</th>
                                                        <td>Bangladesh</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Sub-District/State</th>
                                                        <td>Matlabsouth</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="profile1">
                                        <div class="table-responsive">
                                            <table class="table mb-0">
                                                <tbody>
                                                    <tr>
                                                        <th>Name</th>
                                                        <td>Meheraj Hossain</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Phone</th>
                                                        <td>+1 (505) 536-5292</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Email</th>
                                                        <td>mhossainsagar@gmail.com</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Address</th>
                                                        <td>Matlabsouth</td>
                                                    </tr>
                                                    <tr>
                                                        <th>City</th>
                                                        <td>Bangladesh</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Sub-District/State</th>
                                                        <td>Matlabsouth</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="shipping-address-method mt-4">
                            <h4 class="mb-3">Delivery Method</h4>

                            <div class="mt-3">
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="customRadio1" name="customRadio"
                                        class="custom-control-input" />
                                    <label class="custom-control-label" for="customRadio1">Outside Dhaka (REDX)
                                    </label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="customRadio2" name="customRadio"
                                        class="custom-control-input" />
                                    <label class="custom-control-label" for="customRadio2">
                                        Outside Dhaka (SA Paribahon)
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="shipping-address-note mt-4">
                            <h4 class="mb-3">Note</h4>
                            <div class="form-group">
                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Enter Note"></textarea>
                            </div>
                        </div>

                        <div class="shipping-form-bottom mt-5">
                            <button type="button" class="btn btn-success mr-1 text-right" data-toggle="modal"
                                data-target="#exampleModal3">
                                Pay With Cash
                            </button>
                        </div>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog"
                            aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">
                                            Order Confirmation
                                        </h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body text-left">
                                        <h4>Are you sure to confirm this order?</h4>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                            Close
                                        </button>
                                        <button type="button" class="btn btn-primary">
                                            Confirm Order
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
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

        function updateOrderTotalAmount(){

            var shippingCharge = parseFloat($("#shipping_charge").val());
            if (isNaN(shippingCharge)) {
                shippingCharge = 0;
            }

            var discount = parseFloat($("#discount").val());
            if (isNaN(discount)) {
                discount = 0;
            }

            $.get("{{ url('update/order/total') }}" + '/' + shippingCharge + '/' + discount, function(data) {
                var priceInputField = document.getElementById("subtotal");
                var currentPrice = parseFloat(priceInputField.value);
                if (isNaN(currentPrice)) {
                    currentPrice = 0;
                }

                var newPrice = (currentPrice + shippingCharge) - discount;
                var totalPriceDiv = document.getElementById("total_cart_calculation");
                totalPriceDiv.innerText = '৳ ' + newPrice.toLocaleString("en-BD", { minimumFractionDigits: 2, maximumFractionDigits: 2 });
            });

        }
    </script>
@endsection
