@extends('backend.master')

@section('header_css')
    <link href="{{url('assets')}}/plugins/select2/select2.min.css" rel="stylesheet" type="text/css" />
    <style>
        .select2-selection{
            min-height: 34px !important;
            border: 1px solid #ced4da !important;
        }
        .select2 {
            width: 100% !important;
        }
        .bootstrap-tagsinput .badge {
            margin: 2px 2px !important;
        }

        .select2-container--default .select2-selection--multiple .select2-selection__choice{
            background: #1B69D1;
            border-color: #1B69D1;
            color: white;
        }
        .select2-container--default .select2-selection--multiple .select2-selection__choice__remove{
            color: white;
        }
    </style>
@endsection

@section('page_title')
    Vendor
@endsection
@section('page_heading')
    Update Vendor
@endsection

@section('content')
    <div class="row justify-content-center">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">

                    <form class="needs-validation" method="POST" action="{{url('update/vendor')}}" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="vendor_id" value="{{$data->id}}">


                        <div class="row">
                            <div class="col-lg-4">
                                <h4 class="card-title mb-3">Business Information:</h4>
                                <div class="form-group">
                                    <label for="business_name" class="col-form-label">Business Name<span class="text-danger">*</span></label>
                                    <input type="text" id="business_name" value="{{$data->business_name}}" name="business_name" class="form-control" placeholder="Business Name" required/>
                                </div>
                                <div class="form-group">
                                    <label for="business_category" class="col-form-label">Business Category</label>
                                    <select id="business_category" name="business_category[]" class="form-control" data-toggle="select2" multiple>
                                        <option value="">Select One</option>
                                        <option value="Apparel & Accessories" @if(str_contains($data->business_category, "Apparel & Accessories")) selected @endif>Apparel & Accessories</option>
                                        <option value="Automotive" @if(str_contains($data->business_category, "Automotive")) selected @endif>Automotive</option>
                                        <option value="Baby & Toddler" @if(str_contains($data->business_category, "Baby & Toddler")) selected @endif>Baby & Toddler</option>
                                        <option value="Beauty & Personal Care" @if(str_contains($data->business_category, "Beauty & Personal Care")) selected @endif>Beauty & Personal Care</option>
                                        <option value="Books & Media" @if(str_contains($data->business_category, "Books & Media")) selected @endif>Books & Media</option>
                                        <option value="Food & Beverage" @if(str_contains($data->business_category, "Food & Beverage")) selected @endif>Food & Beverage</option>
                                        <option value="Furniture" @if(str_contains($data->business_category, "Furniture")) selected @endif>Furniture</option>
                                        <option value="Home Appliances" @if(str_contains($data->business_category, "Home Appliances")) selected @endif>Home Appliances</option>
                                        <option value="Jewelry & Watches" @if(str_contains($data->business_category, "Jewelry & Watches")) selected @endif>Jewelry & Watches</option>
                                        <option value="Kitchen & Dining" @if(str_contains($data->business_category, "Kitchen & Dining")) selected @endif>Kitchen & Dining</option>
                                        <option value="Office Supplies" @if(str_contains($data->business_category, "Office Supplies")) selected @endif>Office Supplies</option>
                                        <option value="Pet Supplies" @if(str_contains($data->business_category, "Pet Supplies")) selected @endif>Pet Supplies</option>
                                        <option value="Sporting Goods & Outdoor" @if(str_contains($data->business_category, "Sporting Goods & Outdoor")) selected @endif>Sporting Goods & Outdoor</option>
                                        <option value="Toys & Games" @if(str_contains($data->business_category, "Toys & Games")) selected @endif>Toys & Games</option>
                                        <option value="Travel & Luggage" @if(str_contains($data->business_category, "Travel & Luggage")) selected @endif>Travel & Luggage</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="trade_license_no" class="col-form-label">Trade License Number</label>
                                    <input type="text" id="trade_license_no" value="{{$data->trade_license_no}}" name="trade_license_no" class="form-control" placeholder="Business Trade License Number"/>
                                </div>
                                <div class="form-group">
                                    <label for="business_address" class="col-form-label">Business Address</label>
                                    <input type="text" id="business_address" value="{{$data->business_address}}" name="business_address" class="form-control" placeholder="Business Address"/>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <h4 class="card-title mb-3">Owner Information:</h4>
                                <div class="form-group">
                                    <label for="name" class="col-form-label">Full Name<span class="text-danger">*</span></label>
                                    <input type="text" id="name" name="name" value="{{$data->name}}" class="form-control" placeholder="Full Name" required/>
                                </div>
                                <div class="form-group">
                                    <label for="phone" class="col-form-label">Phone<span class="text-danger">*</span></label>
                                    <input type="text" id="phone" name="phone" value="{{$data->phone}}" class="form-control" placeholder="+8801" required/>
                                </div>
                                <div class="form-group">
                                    <label for="email" class="col-form-label">Login Email<span class="text-danger">*</span></label>
                                    <input type="email" id="email" name="email" value="{{$data->email}}" class="form-control" placeholder="demo@email.com" readonly required/>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-form-label">Login Password<span class="text-danger">*</span></label>
                                    <input type="password" id="password" name="password" class="form-control" placeholder="*******"/>
                                    <small class="text-danger">If you want to change the password then write the new Password Here; otherwise keep it blank</small>
                                </div>

                            </div>

                            <div class="col-lg-4">
                                <h4 class="card-title mb-3">Attachments:</h4>
                                <div class="form-group">
                                    <label for="nid_card" class="col-form-label">Upload Owner NID card<span class="text-danger">*</span></label>
                                    <input type="file" id="nid_card" name="nid_card" class="form-control"/>
                                    @if($data->nid_card && file_exists(public_path($data->nid_card)))
                                    <span class="d-block mt-1">Uploaded: <a href="{{url($data->nid_card)}}" download>NID Card</a></span>
                                    @endif
                                </div>
                                <div class="form-group">
                                    <label for="trade_license" class="col-form-label">Upload Business Trade License<span class="text-danger">*</span></label>
                                    <input type="file" id="trade_license" name="trade_license" class="form-control"/>
                                    @if($data->trade_license && file_exists(public_path($data->trade_license)))
                                    <span class="d-block mt-1">Uploaded: <a href="{{url($data->trade_license)}}" download>Trade License</a></span>
                                    @endif
                                </div>

                                <div class="form-group">
                                    <label for="status" class="col-form-label">Account Status<span class="text-danger">*</span></label>
                                    <select id="status" name="status" class="form-control" required>
                                        <option value="">Select One</option>
                                        <option value="1" @if($data->status == 1) selected @endif>Active</option>
                                        <option value="2" @if($data->status != 1) selected @endif>Inactive</option>
                                    </select>
                                </div>

                                <div class="form-group row pt-3">
                                    <div class="col-sm-12 text-center">
                                        <button class="btn btn-primary" type="submit"><i class="fas fa-save"></i> Update Vendor Info</button>
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
    <script src="{{url('assets')}}/plugins/select2/select2.min.js"></script>
    <script type="text/javascript">
        $('[data-toggle="select2"]').select2();
    </script>
@endsection
