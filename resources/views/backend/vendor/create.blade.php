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
    Create New Vendor
@endsection

@section('content')
    <div class="row justify-content-center">
        <div class="col-lg-6 col-xl-6">
            <div class="card">
                <div class="card-body">

                    <form class="needs-validation" method="POST" action="{{url('save/vendor')}}" enctype="multipart/form-data">
                        @csrf

                        <h4 class="card-title mb-3">Business Information:</h4>
                        <div class="row border-top">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="business_name" class="col-form-label">Business Name<span class="text-danger">*</span></label>
                                    <input type="text" id="business_name" value="{{ old('business_name') }}" name="business_name" class="form-control" placeholder="Business Name" required/>
                                </div>
                                <div class="form-group">
                                    <label for="business_category" class="col-form-label">Business Category</label>
                                    <select id="business_category" name="business_category[]" class="form-control" data-toggle="select2" multiple>
                                        <option value="">Select One</option>
                                        <option value="Apparel & Accessories">Apparel & Accessories</option>
                                        <option value="Automotive">Automotive</option>
                                        <option value="Baby & Toddler">Baby & Toddler</option>
                                        <option value="Beauty & Personal Care">Beauty & Personal Care</option>
                                        <option value="Books & Media">Books & Media</option>
                                        <option value="Food & Beverage">Food & Beverage</option>
                                        <option value="Furniture">Furniture</option>
                                        <option value="Home Appliances">Home Appliances</option>
                                        <option value="Jewelry & Watches">Jewelry & Watches</option>
                                        <option value="Kitchen & Dining">Kitchen & Dining</option>
                                        <option value="Office Supplies">Office Supplies</option>
                                        <option value="Pet Supplies">Pet Supplies</option>
                                        <option value="Sporting Goods & Outdoor">Sporting Goods & Outdoor</option>
                                        <option value="Toys & Games">Toys & Games</option>
                                        <option value="Travel & Luggage">Travel & Luggage</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="trade_license_no" class="col-form-label">Trade License Number</label>
                                    <input type="text" id="trade_license_no" value="{{ old('trade_license_no') }}" name="trade_license_no" class="form-control" placeholder="Business Trade License Number"/>
                                </div>
                                <div class="form-group">
                                    <label for="business_address" class="col-form-label">Business Address</label>
                                    <input type="text" id="business_address" value="{{ old('business_address') }}" name="business_address" class="form-control" placeholder="Business Address"/>
                                </div>
                            </div>
                        </div>

                        <h4 class="card-title mb-3 mt-4">Owner Information:</h4>
                        <div class="row border-top">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="name" class="col-form-label">Full Name<span class="text-danger">*</span></label>
                                    <input type="text" id="name" name="name" value="{{ old('name') }}" class="form-control" placeholder="Full Name" required/>
                                </div>
                                <div class="form-group">
                                    <label for="phone" class="col-form-label">Phone<span class="text-danger">*</span></label>
                                    <input type="text" id="phone" name="phone" value="{{ old('phone') }}" class="form-control" placeholder="+8801" required/>
                                </div>
                                <div class="form-group">
                                    <label for="email" class="col-form-label">Login Email<span class="text-danger">*</span></label>
                                    <input type="email" id="email" name="email" value="{{ old('email') }}" class="form-control" placeholder="demo@email.com" required/>
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('email')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-form-label">Login Password<span class="text-danger">*</span></label>
                                    <input type="password" id="password" name="password" class="form-control" placeholder="*******" required/>
                                </div>
                            </div>
                        </div>

                        <h4 class="card-title mb-3 mt-4">Attachments:</h4>
                        <div class="row border-top">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="nid_card" class="col-form-label">Upload Owner NID card</label>
                                    <input type="file" id="nid_card" name="nid_card" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label for="trade_license" class="col-form-label">Upload Business Trade License</label>
                                    <input type="file" id="trade_license" name="trade_license" class="form-control"/>
                                </div>

                                <div class="form-group row pt-3">
                                    <div class="col-sm-12 text-center">
                                        <button class="btn btn-primary" type="submit"><i class="fas fa-save"></i> Create Vendor</button>
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
