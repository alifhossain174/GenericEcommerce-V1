@extends('backend.master')

@section('header_css')
    <link href="{{url('assets')}}/plugins/dropify/dropify.min.css" rel="stylesheet" type="text/css" />
    <link href="{{url('assets')}}/css/tagsinput.css" rel="stylesheet" type="text/css" />
    <style>
        .bootstrap-tagsinput .badge {
            margin: 2px 2px !important;
        }
    </style>
@endsection

@section('page_title')
    General Information
@endsection
@section('page_heading')
    Entry General Information
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <form class="needs-validation" method="POST" action="{{url('update/general/info')}}" enctype="multipart/form-data">
                        @csrf

                        <div class="row">
                            <div class="col-lg-8">
                                <h4 class="card-title mb-3">General Information Form</h4>
                            </div>
                            <div class="col-lg-4 text-right">

                                <a href="{{url('/home')}}" style="width: 130px;" class="btn btn-danger d-inline-block text-white m-2" type="submit"><i class="mdi mdi-cancel"></i> Cancel</a>
                                <button class="btn btn-primary m-2" type="submit" style="width: 140px;"><i class="fas fa-save"></i> Update Info</button>

                            </div>
                        </div>

                        <div class="row justify-content-center pt-3">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="logo">Primary Logo (Light)</label>
                                    <input type="file" name="logo" class="dropify" data-height="150" data-max-file-size="1M" accept="image/*"/>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="logo">Secondary Logo (Dark)</label>
                                    <input type="file" name="logo_dark" class="dropify" data-height="150" data-max-file-size="1M" accept="image/*"/>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="fav_icon">Favicon</label>
                                    <input type="file" name="fav_icon" class="dropify" data-height="150" data-max-file-size="1M" accept="image/*"/>
                                </div>
                            </div>
                        </div>


                        <div class="row justify-content-center pt-3">
                            <div class="col-lg-9">

                                <div class="form-group row">
                                    <label for="company_name" class="col-sm-2 col-form-label">Company Name <span class="text-danger">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="text" id="company_name" name="company_name" value="{{$data->company_name}}" class="form-control" placeholder="Enter Company Name Here" required>
                                        <div class="invalid-feedback" style="display: block;">
                                            @error('company_name')
                                                {{ $message }}
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="tab_title" class="col-sm-2 col-form-label">Browser Tab Title <span class="text-danger">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="text" id="tab_title" name="tab_title" value="{{$data->tab_title}}" class="form-control" placeholder="Tab Title" required>
                                        <div class="invalid-feedback" style="display: block;">
                                            @error('tab_title')
                                                {{ $message }}
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="contact" class="col-sm-2 col-form-label">Phone No. <span class="text-danger">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="text" id="contact" data-role="tagsinput" name="contact" value="{{$data->contact}}" class="form-control" placeholder="01*********">
                                        <div class="invalid-feedback" style="display: block;">
                                            @error('contact')
                                                {{ $message }}
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="email" class="col-sm-2 col-form-label">Company Emails <span class="text-danger">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="text" id="email" data-role="tagsinput" name="email" value="{{$data->email}}" class="form-control" placeholder="Write Email Here">
                                        <div class="invalid-feedback" style="display: block;">
                                            @error('email')
                                                {{ $message }}
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="short_description" class="col-sm-2 col-form-label">Short Description</label>
                                    <div class="col-sm-10">
                                        <textarea id="short_description" name="short_description" rows="3" class="form-control" placeholder="Enter Short Description about Company">{{$data->short_description}}</textarea>
                                        <div class="invalid-feedback" style="display: block;">
                                            @error('short_description')
                                                {{ $message }}
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="address" class="col-sm-2 col-form-label">Company Address</label>
                                    <div class="col-sm-10">
                                        <textarea id="address" name="address" rows="3" class="form-control" placeholder="Enter Company Address Here">{{$data->address}}</textarea>
                                        <div class="invalid-feedback" style="display: block;">
                                            @error('address')
                                                {{ $message }}
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="google_map_link" class="col-sm-2 col-form-label">Google Map Link</label>
                                    <div class="col-sm-10">
                                        <input type="text" id="google_map_link" name="google_map_link" value="{{$data->google_map_link}}" class="form-control" placeholder="https://map.google.com">
                                        <div class="invalid-feedback" style="display: block;">
                                            @error('google_map_link')
                                                {{ $message }}
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="footer_copyright_text" class="col-sm-2 col-form-label">Footer Copyright Text</label>
                                    <div class="col-sm-10">
                                        <textarea name="footer_copyright_text" id="footer_copyright_text" class="form-control">{!! $data->footer_copyright_text !!}</textarea>
                                    </div>
                                </div>

                            </div>

                        </div>



                        {{-- <div class="form-group row mt-3">
                            <label for="header_css" class="col-sm-2 col-form-label">Header CSS</label>
                            <div class="col-sm-10">
                                <textarea name="header_css" class="form-control" id="header_css" placeholder="<link href='https://custom.css' rel='stylesheet' type='text/css'/>">{{$data->header_css}}</textarea>
                                <div class="invalid-feedback" style="display: block;">
                                    @error('header_css')
                                        {{ $message }}
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="form-group row mt-3">
                            <label for="header_script" class="col-sm-2 col-form-label">Header Script</label>
                            <div class="col-sm-10">
                                <textarea name="header_script" class="form-control" id="header_script" placeholder="<script src='https://custom.js'></script>">{{$data->header_script}}</textarea>
                                <div class="invalid-feedback" style="display: block;">
                                    @error('header_script')
                                        {{ $message }}
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="form-group row mt-3">
                            <label for="footer_script" class="col-sm-2 col-form-label">Footer Script</label>
                            <div class="col-sm-10">
                                <textarea name="footer_script" class="form-control" id="footer_script" placeholder="<script src='https://custom.js'></script>">{{$data->footer_script}}</textarea>
                                <div class="invalid-feedback" style="display: block;">
                                    @error('footer_script')
                                        {{ $message }}
                                    @enderror
                                </div>
                            </div>
                        </div>


                        <fieldset class="border p-2 mt-4" style="border-radius: 4px;">
                            <legend  class="w-auto">Search Engine Optimization (SEO)</legend>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="meta_title">Meta Title <small>(For SEO)</small></label>
                                        <input type="text" id="meta_title" name="meta_title" value="{{$data->meta_title}}" class="form-control" placeholder="Enter Meta Title Here">
                                        <div class="invalid-feedback" style="display: block;">
                                            @error('meta_title')
                                                {{ $message }}
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="meta_keywords">Meta Keywords <small>(For SEO) "," Comma Separated</small></label>
                                        <input type="text" id="meta_keywords" data-role="tagsinput" name="meta_keywords" value="{{$data->meta_keywords}}" class="form-control">
                                        <div class="invalid-feedback" style="display: block;">
                                            @error('meta_keywords')
                                                {{ $message }}
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="meta_description">Meta Description <small>(For SEO)</small></label>
                                        <textarea id="meta_description" name="meta_description" class="form-control" placeholder="Write Meta Description Here">{{$data->meta_description}}</textarea>
                                        <div class="invalid-feedback" style="display: block;">
                                            @error('meta_description')
                                                {{ $message }}
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </fieldset> --}}


                        {{-- <div class="form-group text-center pt-3 mt-3">
                            <a href="{{url('/home')}}" style="width: 130px;" class="btn btn-danger d-inline-block text-white m-2" type="submit"><i class="mdi mdi-cancel"></i> Cancel</a>
                            <button class="btn btn-primary m-2" type="submit" style="width: 140px;"><i class="fas fa-save"></i> Update Info</button>
                        </div> --}}
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection


@section('footer_js')
    <script src="{{url('assets')}}/plugins/dropify/dropify.min.js"></script>
    <script src="{{url('assets')}}/pages/fileuploads-demo.js"></script>
    <script src="{{url('assets')}}/js/tagsinput.js"></script>
    <script src="https://cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>

    <script>

        CKEDITOR.replace('footer_copyright_text', {
            filebrowserUploadUrl: "{{route('ckeditor.upload', ['_token' => csrf_token() ])}}",
            filebrowserUploadMethod: 'form',
            height: 120,
        });

        @if($data->logo && file_exists(public_path($data->logo)))
            $(".dropify-preview").eq(0).css("display", "block");
            $(".dropify-clear").eq(0).css("display", "block");
            $(".dropify-filename-inner").eq(0).html("{{$data->logo}}");
            $("span.dropify-render").eq(0).html("<img src='{{url($data->logo)}}'>");
        @endif

        @if($data->logo_dark && file_exists(public_path($data->logo_dark)))
            $(".dropify-preview").eq(1).css("display", "block");
            $(".dropify-clear").eq(1).css("display", "block");
            $(".dropify-filename-inner").eq(1).html("{{$data->logo_dark}}");
            $("span.dropify-render").eq(1).html("<img src='{{url($data->logo_dark)}}'>");
        @endif

        @if($data->fav_icon && file_exists(public_path($data->fav_icon)))
            $(".dropify-preview").eq(2).css("display", "block");
            $(".dropify-clear").eq(2).css("display", "block");
            $(".dropify-filename-inner").eq(2).html("{{$data->fav_icon}}");
            $("span.dropify-render").eq(2).html("<img src='{{url($data->fav_icon)}}'>");
        @endif
    </script>
@endsection
