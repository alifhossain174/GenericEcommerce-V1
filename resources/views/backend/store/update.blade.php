@extends('backend.master')

@section('header_css')
    <link href="{{url('assets')}}/plugins/dropify/dropify.min.css" rel="stylesheet" type="text/css" />
    <link href="{{url('assets')}}/plugins/select2/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="{{url('assets')}}/css/tagsinput.css" rel="stylesheet" type="text/css" />
    <link href="{{url('assets')}}/plugins/bootstrap-touchspin/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css" />
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
    </style>
@endsection

@section('page_title')
    Store
@endsection
@section('page_heading')
    Update Store
@endsection

@section('content')
    <div class="row justify-content-center">
        <div class="col-lg-6 col-xl-6">
            <div class="card">
                <div class="card-body">

                    <form class="needs-validation" method="POST" action="{{url('update/store')}}" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="store_id" value="{{$store->id}}">

                        <div class="row">
                            <div class="col-lg-12">

                                <h4 class="card-title mb-3">Store Information:</h4>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="store_logo" class="col-form-label">Store Logo<span class="text-danger">*</span></label>
                                            <input type="file" id="store_logo" name="store_logo" class="dropify" data-height="150" data-max-file-size="1M" accept="image/*"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="store_banner" class="col-form-label">Store Banner<span class="text-danger">*</span></label>
                                            <input type="file" id="store_banner" name="store_banner" class="dropify" data-height="150" data-max-file-size="1M" accept="image/*"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="store_name" class="col-form-label">Store Name<span class="text-danger">*</span></label>
                                            <input type="text" id="store_name" value="{{$store->store_name}}" name="store_name" class="form-control" placeholder="Store Name" required/>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="vendor_id" class="col-form-label">Select Vendor<span class="text-danger">*</span></label>
                                            <select id="vendor_id" name="vendor_id" class="form-control" data-toggle="select2" required readonly>
                                                <option value="">Select One</option>
                                                @foreach ($vendors as $vendor)
                                                <option value="{{$vendor->id}}" @if($store->vendor_id == $vendor->id) selected @endif>{{$vendor->name}} ({{$vendor->business_name}})</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="store_address" class="col-form-label">Store Address</label>
                                    <input type="text" id="store_address" value="{{$store->store_address}}" name="store_address" class="form-control" placeholder="Store Address"/>
                                </div>

                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="store_phone" class="col-form-label">Store Phone</label>
                                            <input type="text" id="store_phone" data-role="tagsinput" value="{{$store->store_phone}}" name="store_phone[]" class="form-control" placeholder="Store Phone"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="store_email" class="col-form-label">Store Email</label>
                                            <input type="text" id="store_email" data-role="tagsinput" value="{{$store->store_email}}" name="store_email[]" class="form-control" placeholder="Store Email"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="store_description" class="col-form-label">Store Description</label>
                                    <textarea class="form-control" name="store_description" id="store_description" placeholder="Store Description">{{$store->store_description}}</textarea>
                                </div>

                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="store_percentage" class="col-form-label">Store Comission (Percentage)</label>
                                            <input type="text" data-toggle="touchspin" id="store_percentage" value="{{$store->store_percentage}}" name="store_percentage" class="form-control" placeholder="%"/>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <h4 class="card-title mb-3 mt-4">Store Social Links:</h4>

                                <div class="row">
                                    <div class="col-lg-6">
                                        <input type="text" name="facebook" value="{{$store->facebook}}" class="form-control mb-3" placeholder="Facebook"/>
                                    </div>
                                    <div class="col-lg-6">
                                        <input type="text" name="whatsapp" value="{{$store->whatsapp}}" class="form-control mb-3" placeholder="Whatsapp"/>
                                    </div>
                                    <div class="col-lg-6">
                                        <input type="text" name="instagram" value="{{$store->instagram}}" class="form-control mb-3" placeholder="Instagram"/>
                                    </div>
                                    <div class="col-lg-6">
                                        <input type="text" name="tiktok" value="{{$store->tiktok}}" class="form-control mb-3" placeholder="Tiktok"/>
                                    </div>
                                    <div class="col-lg-6">
                                        <input type="text" name="linkedin" value="{{$store->linkedin}}" class="form-control mb-3" placeholder="Linkedin"/>
                                    </div>
                                    <div class="col-lg-6">
                                        <input type="text" name="twitter" value="{{$store->twitter}}" class="form-control mb-3" placeholder="Twitter"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <h4 class="card-title mb-3 mt-4">Store Meta Information:</h4>

                                <div class="form-group">
                                    <label for="meta_title" class="col-form-label">Store Meta Title</label>
                                    <input type="text" id="meta_title" value="{{$store->meta_title}}" name="meta_title" class="form-control" placeholder="Store Meta Title"/>
                                </div>
                                <div class="form-group">
                                    <label for="meta_keywords" class="col-form-label">Store Meta Keywords</label>
                                    <input type="text" id="meta_keywords" data-role="tagsinput" value="{{$store->meta_keywords}}" name="meta_keywords[]" class="form-control" placeholder="Store Meta Keywords"/>
                                </div>
                                <div class="form-group">
                                    <label for="meta_description" class="col-form-label">Store Meta Description</label>
                                    <textarea class="form-control" name="meta_description" id="meta_description" placeholder="Store Meta Description">{{$store->meta_description}}</textarea>
                                </div>

                                <div class="form-group row pt-3">
                                    <div class="col-sm-12 text-center">
                                        <button class="btn btn-primary" type="submit"><i class="fas fa-save"></i> Update Store</button>
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
    <script src="{{url('assets')}}/plugins/dropify/dropify.min.js"></script>
    <script src="{{url('assets')}}/pages/fileuploads-demo.js"></script>
    <script src="{{url('assets')}}/plugins/select2/select2.min.js"></script>
    <script src="{{url('assets')}}/js/tagsinput.js"></script>
    <script src="{{url('assets')}}/plugins/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
    <script type="text/javascript">
        $('[data-toggle="select2"]').select2();

        var defaultOptions = {};
        $('[data-toggle="touchspin"]').each(function (idx, obj) {
            var objOptions = $.extend({}, defaultOptions, $(obj).data());
            $(obj).TouchSpin(objOptions);
        });

        @if($store->store_logo && file_exists(public_path($store->store_logo)))
            $(".dropify-preview").eq(0).css("display", "block");
            $(".dropify-clear").eq(0).css("display", "block");
            $(".dropify-filename-inner").eq(0).html("{{$store->store_logo}}");
            $("span.dropify-render").eq(0).html("<img src='{{url($store->store_logo)}}'>");
        @endif

        @if($store->store_banner && file_exists(public_path($store->store_banner)))
            $(".dropify-preview").eq(1).css("display", "block");
            $(".dropify-clear").eq(1).css("display", "block");
            $(".dropify-filename-inner").eq(1).html("{{$store->store_banner}}");
            $("span.dropify-render").eq(1).html("<img src='{{url($store->store_banner)}}'>");
        @endif
    </script>
@endsection
