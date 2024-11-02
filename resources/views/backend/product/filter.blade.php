<div class="card mb-1">
    <div class="card-header bg-white border-bottom-0 collapsed" style="cursor: pointer;" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" id="headingTwo">
        <a href="javascript:void(0)" style="position: relative" class="text-dark d-block font-size-15">
            <i class="feather-filter"></i> Advanced Filters for Products
            <span style="position: absolute; top: 50%; transform:translateY(-50%); right: 20px">&#8595;</span>
        </a>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
        <div class="card-body text-muted pt-1">
            <form>
                <div class="row">
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="product_code">Product Code</label>
                            <input class="form-control" type="text" id="product_code" onkeyup="filterProductData()" placeholder="12354698">
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="product_name">Product Name</label>
                            <input class="form-control" type="text" id="product_name" onkeyup="filterProductData()" placeholder="Product Name">
                        </div>
                    </div>
                    @if(env('DEMO_MODE') == true)
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label class="d-block" for="store_id">Vendors</label>
                            <select class="form-control" id="store_id" data-toggle="select2" onchange="filterProductData()">
                                <option value="">Select One</option>
                                @foreach ($stores as $store)
                                <option value="{{$store->id}}">{{$store->store_name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    @endif
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label class="d-block" for="category_id">Categories</label>
                            <select class="form-control" id="category_id" data-toggle="select2" onchange="filterProductData()">
                                <option value="">Select One</option>
                                @foreach ($categories as $category)
                                <option value="{{$category->id}}">{{$category->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label class="d-block" for="brand_id">Brands</label>
                            <select class="form-control" id="brand_id" data-toggle="select2" onchange="filterProductData()">
                                <option value="">Select One</option>
                                @foreach ($brands as $brand)
                                <option value="{{$brand->id}}">{{$brand->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label class="d-block" for="flag_id">Product Flags</label>
                            <select class="form-control" id="flag_id" data-toggle="select2" onchange="filterProductData()">
                                <option value="">Select One</option>
                                @foreach ($flags as $flag)
                                <option value="{{$flag->id}}">{{$flag->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="status">Status</label>
                            <select class="form-control" onchange="filterProductData()" id="status">
                                <option value="">Select One</option>
                                <option value="1">Active</option>
                                <option value="0">Inactive</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="has_variant">Variant</label>
                            <select class="form-control" onchange="filterProductData()" id="has_variant">
                                <option value="">Select One</option>
                                <option value="1">Variant Product</option>
                                <option value="0">No Variant</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="form-group">
                            <label>Entry Date Range</label>
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
