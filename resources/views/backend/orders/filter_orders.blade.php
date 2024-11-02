<div class="card mb-1">
    <div class="card-header bg-white border-bottom-0 collapsed" style="cursor: pointer;" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" id="headingTwo">
        <a href="javascript:void(0)" style="position: relative" class="text-dark d-block font-size-15">
            <i class="feather-filter"></i> Advanced Filters for Orders
            <span style="position: absolute; top: 50%; transform:translateY(-50%); right: 20px">&#8595;</span>
        </a>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
        <div class="card-body text-muted pt-1">
            <form>
                <div class="row">
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="order_no">Order No</label>
                            <input class="form-control" type="text" id="order_no" onkeyup="filterOrderData()" placeholder="12354698">
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="order_from">Source</label>
                            <select class="form-control" id="order_from" onchange="filterOrderData()">
                                <option value="">Select One</option>
                                <option value="1">Website</option>
                                <option value="2">Mobile App</option>
                                <option value="3">POS</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="payment_status">Payment Status</label>
                            <select class="form-control" id="payment_status" onchange="filterOrderData()">
                                <option value="">Select One</option>
                                <option value="0">Unpaid</option>
                                <option value="1">Paid</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="customer_name">Customer Name</label>
                            <input class="form-control" type="text" onkeyup="filterOrderData()" id="customer_name" placeholder="Mr./Mrs.">
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="customer_phone">Customer Phone</label>
                            <input class="form-control" type="text" onkeyup="filterOrderData()" id="customer_phone" placeholder="+8801">
                        </div>
                    </div>

                    @if($parameter == "")
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="order_status">Order Status</label>
                            <select class="form-control" onchange="filterOrderData()" id="order_status">
                                <option value="">Select One</option>
                                <option value="0">Pending</option>
                                <option value="1">Approved</option>
                                <option value="2">In Transit</option>
                                <option value="3">Delivered</option>
                                <option value="4">Cancelled</option>
                            </select>
                        </div>
                    </div>
                    @endif

                    <div class="col-lg-2">
                        <div class="form-group">
                            <label class="d-block" for="product_id">Ordered Product</label>
                            <select class="form-control" id="product_id" data-toggle="select2" onchange="filterOrderData()">
                                <option value="">Select One</option>
                                @foreach ($products as $product)
                                <option value="{{$product->id}}">{{$product->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="delivery_method">Delivery Method</label>
                            <select class="form-control" onchange="filterOrderData()" id="delivery_method">
                                <option value="">Select One</option>
                                <option value="1">Home Delivery</option>
                                <option value="2">Store Pickup</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="coupon_code">Coupon Code</label>
                            <input class="form-control" type="text" onkeyup="filterOrderData()" id="coupon_code" placeholder="ex. OFF10">
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label>Purchase Date Range</label>
                            <div id="reportrange" class="form-control" data-toggle="date-picker-range" data-target-display="#selectedValue" data-cancel-class="btn-light" style="white-space: nowrap; overflow: hidden;">
                                <i class="mdi mdi-calendar"></i>&nbsp;
                                <span id="selectedValue"></span> <i class="mdi mdi-menu-down"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label class="d-block" style="color: transparent">Filter</label>
                            <button type="button" class="btn btn-danger rounded" onclick="clearFilters()"><i class="feather-trash-2"></i> Clear Filters</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
