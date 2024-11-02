<div class="card mb-1">
    <div class="card-header bg-white border-bottom-0 collapsed" style="cursor: pointer;" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" id="headingTwo">
        <a href="javascript:void(0)" style="position: relative" class="text-dark d-block font-size-15">
            <i class="feather-filter"></i> Advanced Filters for Customers
            <span style="position: absolute; top: 50%; transform:translateY(-50%); right: 20px">&#8595;</span>
        </a>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
        <div class="card-body text-muted pt-1">
            <form>
                <div class="row">
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="order_place_date">Placed Order On</label>
                            <input class="form-control" type="date" id="order_place_date" onchange="filterData()">
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="order_from">Order Source</label>
                            <select class="form-control" id="order_from" onchange="filterData()">
                                <option value="">Select One</option>
                                <option value="1">Website</option>
                                <option value="2">Mobile App</option>
                                <option value="3">POS</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label class="d-block" for="product_id">Ordered Product</label>
                            <select class="form-control" id="product_id" data-toggle="select2" onchange="filterData()">
                                <option value="">Select One</option>
                                @foreach ($products as $product)
                                <option value="{{$product->id}}">{{$product->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label class="d-block" for="category_id">Ordered Category</label>
                            <select class="form-control" id="category_id" data-toggle="select2" onchange="filterData()">
                                <option value="">Select One</option>
                                @foreach ($categories as $category)
                                <option value="{{$category->id}}">{{$category->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label class="d-block" for="district">District</label>
                            <select class="form-control" id="district" data-toggle="select2" onchange="filterData()">
                                <option value="">Select One</option>
                                @foreach ($districts as $district)
                                <option value="{{$district->name}}">{{$district->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label class="d-block" for="city">City</label>
                            <select class="form-control" id="city" data-toggle="select2" onchange="filterData()">
                                <option value="">Select One</option>
                                @foreach ($cities as $city)
                                <option value="{{$city->name}}">{{$city->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="order_status">Order Status</label>
                            <select class="form-control" onchange="filterData()" id="order_status">
                                <option value="">Select One</option>
                                <option value="0">Pending</option>
                                <option value="1">Approved</option>
                                <option value="2">In Transit</option>
                                <option value="3">Delivered</option>
                                <option value="4">Cancelled</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="coupon_code">Coupon Code Used</label>
                            <input class="form-control" type="text" onkeyup="filterData()" id="coupon_code" placeholder="ex. OFF10">
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label>Total Order (Range)</label>
                            <input class="form-control d-inline" style="width: 48%" type="text" onkeyup="filterData()" id="min_order_qty" placeholder="Min">
                            <input class="form-control d-inline" style="width: 49%" type="text" onkeyup="filterData()" id="max_order_qty" placeholder="Max">
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label>Order Amount (Range)</label>
                            <input class="form-control d-inline" style="width: 48%" type="text" onkeyup="filterData()" id="min_order_amount" placeholder="Min">
                            <input class="form-control d-inline" style="width: 49%" type="text" onkeyup="filterData()" id="max_order_amount" placeholder="Max">
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label>Account Creation Date</label>
                            <div id="reportrange" class="form-control" data-toggle="date-picker-range" data-target-display="#selectedValue" data-cancel-class="btn-light" style="white-space: nowrap; overflow: hidden;">
                                <i class="mdi mdi-calendar"></i>&nbsp;
                                <span id="selectedValue"></span> <i class="mdi mdi-menu-down"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-1">
                        <div class="form-group">
                            <label class="d-block" style="color: transparent">Filter</label>
                            <button type="button" class="btn btn-danger rounded" onclick="clearFilters()"><i class="feather-trash-2"></i> Clear</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
