@extends('backend.master')

@section('header_css')
    <link href="{{url('assets')}}/plugins/dropify/dropify.min.css" rel="stylesheet" type="text/css" />
    <link href="{{url('assets')}}/css/tagsinput.css" rel="stylesheet" type="text/css" />
    <link href="{{ url('assets') }}/css/spectrum.min.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" href="{{url('codeMirror')}}/css/codemirror.css">
    <link rel="stylesheet" href="{{url('codeMirror')}}/css/themes/material.css">

    <style>
        .bootstrap-tagsinput .badge {
            margin: 2px 2px !important;
        }
    </style>
@endsection

@section('header_js')
    <script src="{{url('codeMirror')}}/js/codemirror.js"></script>
    <script src="{{url('codeMirror')}}/js/xml.js"></script>
    <script src="{{url('codeMirror')}}/js/php.js"></script>
    <script src="{{url('codeMirror')}}/js/javascript.js"></script>
    <script src="{{url('codeMirror')}}/js/python.js"></script>
    <script src="{{url('codeMirror')}}/js/addons/closetag.js"></script>
    <script src="{{url('codeMirror')}}/js/addons/closebrackets.js"></script>
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
                    <h4 class="card-title mb-3">General Information Form</h4>

                    <form class="needs-validation" method="POST" action="{{url('update/general/info')}}" enctype="multipart/form-data">
                        @csrf

                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="logo">Company Logo : </label>
                                    <input type="file" name="logo" class="dropify" data-height="225" data-max-file-size="1M" accept="image/*"/>
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="company_name">Company Name</label>
                                            <input type="text" id="company_name" name="company_name" value="{{$data->company_name}}" class="form-control" placeholder="Enter Company Name Here">
                                            <div class="invalid-feedback" style="display: block;">
                                                @error('company_name')
                                                    {{ $message }}
                                                @enderror
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="email">Company Email</label>
                                            <input type="text" id="email" name="email" data-role="tagsinput" value="{{$data->email}}" class="form-control" placeholder="example@company.com">
                                            <div class="invalid-feedback" style="display: block;">
                                                @error('email')
                                                    {{ $message }}
                                                @enderror
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="short_description">Short Description</label>
                                            <textarea id="short_description" name="short_description" rows="3" class="form-control" placeholder="Enter Short Description about Company">{{$data->short_description}}</textarea>
                                            <div class="invalid-feedback" style="display: block;">
                                                @error('short_description')
                                                    {{ $message }}
                                                @enderror
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="address">Company Address</label>
                                            <textarea id="address" name="address" rows="3" class="form-control" placeholder="Enter Company Address Here">{{$data->address}}</textarea>
                                            <div class="invalid-feedback" style="display: block;">
                                                @error('address')
                                                    {{ $message }}
                                                @enderror
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="contact">Company Contact No</label>
                                            <input type="text" id="contact" name="contact" data-role="tagsinput" value="{{$data->contact}}" class="form-control" placeholder="Enter Phone No Here">
                                            <div class="invalid-feedback" style="display: block;">
                                                @error('contact')
                                                    {{ $message }}
                                                @enderror
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="google_map_link">Google Map Link</label>
                                            <input type="text" id="google_map_link" name="google_map_link" value="{{$data->google_map_link}}" class="form-control" placeholder="https://map.google.com">
                                            <div class="invalid-feedback" style="display: block;">
                                                @error('google_map_link')
                                                    {{ $message }}
                                                @enderror
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row mt-3">
                            <label for="header_css" class="col-sm-2 col-form-label">Header CSS</label>
                            <div class="col-sm-10">
                                <input name="header_css" class="form-control" data-role="tagsinput" value="{{$data->header_css}}" id="header_css" placeholder="https://custom.css">
                                <div class="invalid-feedback" style="display: block;">
                                    @error('header_css')
                                        {{ $message }}
                                    @enderror
                                </div>
                            </div>
                        </div>

                        {{-- code editor --}}
                        <div class="form-group row mt-3">
                            <label for="custom_css" class="col-sm-2 col-form-label">Custom CSS</label>
                            <div class="col-sm-10">
                                <textarea name="custom_css" class="form-control" id="code_editor" style="cursor: pointer">{{$data->custom_css}}</textarea>
                            </div>
                        </div>
                        {{-- code editor --}}


                        <div class="form-group row mt-3">
                            <label for="header_script" class="col-sm-2 col-form-label">Header Script</label>
                            <div class="col-sm-10">
                                <input name="header_script" class="form-control" data-role="tagsinput" value="{{$data->header_script}}" id="header_script" placeholder="https://custom.js">
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
                                <input name="footer_script" class="form-control" data-role="tagsinput" value="{{$data->footer_script}}" id="footer_script" placeholder="https://custom.js">
                                <div class="invalid-feedback" style="display: block;">
                                    @error('footer_script')
                                        {{ $message }}
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="form-group row mt-3">
                            <label for="youtube" class="col-sm-2 col-form-label">Footer Copyright Text :</label>
                            <div class="col-sm-10">
                                <textarea name="footer_copyright_text" id="footer_copyright_text" class="form-control">{!! $data->footer_copyright_text !!}</textarea>
                            </div>
                        </div>


                        <h4 class="card-title mb-3 mt-5">Social Media Links</h4>
                        <hr>

                        <div class="row">
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="facebook" class="col-form-label"><i class="fab fa-facebook-square" style="color: #1877F2;"></i> Facebook Page Link :</label>
                                    <input type="text" name="facebook" class="form-control" value="{{$data->facebook}}" id="facebook" placeholder="https://facebook.com/">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('facebook')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="twitter" class="col-form-label"><i class="fab fa-twitter" style="color: #00acee;"></i> Twitter Link :</label>
                                    <input type="text" name="twitter" class="form-control" value="{{$data->twitter}}" id="twitter" placeholder="https://twitter.com/">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('twitter')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="instagram" class="col-form-label"><i class="fab fa-instagram" style="color: #ffb719;"></i> Instagram Link :</label>
                                    <input type="text" name="instagram" class="form-control" value="{{$data->instagram}}" id="instagram" placeholder="https://instagram.com/">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('instagram')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="linkedin" class="col-form-label"><i class="fab fa-linkedin" style="color: #0072b1;"></i> Linkedin Profile :</label>
                                    <input type="text" name="linkedin" class="form-control" value="{{$data->linkedin}}" id="linkedin" placeholder="https://linkedin.com/">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('linkedin')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="messenger" class="col-form-label"><i class="fab fa-facebook-messenger" style="color: #44bec7;"></i> Messenger :</label>
                                    <input type="text" name="messenger" class="form-control" value="{{$data->messenger}}" id="messenger" placeholder="https://messenger.com/">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('messenger')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="whatsapp" class="col-form-label"><i class="fab fa-whatsapp" style="color: #075e54;"></i> Whats App :</label>
                                    <input type="text" name="whatsapp" class="form-control" value="{{$data->whatsapp}}" id="whatsapp" placeholder="https://whatsapp.com/">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('whatsapp')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="telegram" class="col-form-label"><i class="fab fa-telegram-plane" style="color: #0088cc;"></i> Telegram :</label>
                                    <input type="text" name="telegram" class="form-control" value="{{$data->telegram}}" id="telegram" placeholder="https://telegram.com/">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('telegram')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="youtube" class="col-form-label"><i class="fab fa-youtube" style="color: #FF0000;"></i> Youtube Channel Link :</label>
                                    <input type="text" name="youtube" class="form-control" value="{{$data->youtube}}" id="youtube" placeholder="https://youtube.com/">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('youtube')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                            </div>
                        </div>



                        <h4 class="card-title mb-3 mt-5">Website Theme Color</h4>
                        <hr>

                        <div class="row">
                            <div class="col-lg-2 col-md-3 col-sm-4">
                                <div class="form-group">
                                    <label for="primary_color" class="col-form-label">Primary Color :</label>
                                    <input type="text" name="primary_color" class="form-control" value="{{$data->primary_color}}" id="primary_color">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('primary_color')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-3 col-sm-4">
                                <div class="form-group">
                                    <label for="secondary_color" class="col-form-label">Secondary Color :</label>
                                    <input type="text" name="secondary_color" class="form-control" value="{{$data->secondary_color}}" id="secondary_color">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('secondary_color')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-3 col-sm-4">
                                <div class="form-group">
                                    <label for="tertiary_color" class="col-form-label">Tertiary Color :</label>
                                    <input type="text" name="tertiary_color" class="form-control" value="{{$data->tertiary_color}}" id="tertiary_color">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('tertiary_color')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-3 col-sm-4">
                                <div class="form-group">
                                    <label for="title_color" class="col-form-label">Title Color :</label>
                                    <input type="text" name="title_color" class="form-control" value="{{$data->title_color}}" id="title_color">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('title_color')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-3 col-sm-4">
                                <div class="form-group">
                                    <label for="paragraph_color" class="col-form-label">Paragraph Color :</label>
                                    <input type="text" name="paragraph_color" class="form-control" value="{{$data->paragraph_color}}" id="paragraph_color">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('paragraph_color')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-3 col-sm-4">
                                <div class="form-group">
                                    <label for="border_color" class="col-form-label">Border Color :</label>
                                    <input type="text" name="border_color" class="form-control" value="{{$data->border_color}}" id="border_color">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('border_color')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                            </div>
                        </div>




                        <h4 class="card-title mb-3 mt-5">Search Engine Optimization (SEO)</h4>
                        <hr>
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


                        <div class="form-group text-center pt-3 mt-3">
                            <a href="{{url('/home')}}" style="width: 130px;" class="btn btn-danger d-inline-block text-white m-2" type="submit"><i class="mdi mdi-cancel"></i> Cancel</a>
                            <button class="btn btn-primary m-2" type="submit" style="width: 140px;"><i class="fas fa-save"></i> Update Info</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection


@section('footer_js')
    <script>
        var textareas = document.getElementById("code_editor");
        editor = CodeMirror.fromTextArea(textareas, {
            mode: "javascript",
            theme: "material",
            lineNumbers: true,
            autoCloseTags: true,
            autoCloseBrackets: true
        });
        editor.setSize("100%", "300");
    </script>
@endsection
