@extends('backend.master')

@section('header_css')
    <link href="{{url('assets')}}/plugins/dropify/dropify.min.css" rel="stylesheet" type="text/css" />
    <link href="{{ url('assets') }}/css/spectrum.min.css" rel="stylesheet" type="text/css" />
@endsection

@section('page_title')
    Banner
@endsection
@section('page_heading')
    Add New Banner
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">Banner Create Form</h4>

                    <form class="needs-validation" method="POST" action="{{url('save/new/banner')}}" enctype="multipart/form-data">
                        @csrf

                        <div class="row">
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="banner">Banner Image <span class="text-danger">*</span></label>
                                    <input type="file" name="image" class="dropify" data-height="262" data-max-file-size="1M" accept="image/*" required/>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="row">
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="position">Banner Position</label>
                                            <select class="form-control" name="position" id="position" required>
                                                <option value="">Select Option</option>
                                                <option value="top">Top (Homepage)</option>
                                                <option value="left">Left (Homepage)</option>
                                                <option value="right">Right (Homepage)</option>
                                                <option value="middle">Middle (Homepage)</option>
                                                <option value="bottom">Bottom (Homepage)</option>
                                                <option value="shop">Top (ShopPage)</option>
                                                <option value="popup">Popup (Homepage)</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="text_position">Text Position</label>
                                            <select class="form-control" name="text_position" id="text_position">
                                                <option value="">Select Option</option>
                                                <option value="left">Left</option>
                                                <option value="right">Right</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="link">Banner Link</label>
                                            <input type="text" name="link" class="form-control" id="link" placeholder="https://">
                                            <div class="invalid-feedback" style="display: block;">
                                                @error('link')
                                                    {{ $message }}
                                                @enderror
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="sub_title">Sub Title</label>
                                            <div class="row">
                                                <div class="col-2">
                                                    <input type="text" class="form-control colorpicker pl-2" name="sub_title_color">
                                                </div>
                                                <div class="col-10 pl-0">
                                                    <input type="text" name="sub_title" id="sub_title" class="form-control" placeholder="Write Sub Title Here"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="title">Banner Title</label>
                                            <div class="row">
                                                <div class="col-2">
                                                    <input type="text" class="form-control colorpicker pl-2" name="title_color">
                                                </div>
                                                <div class="col-10 pl-0">
                                                    <input type="text" name="title" id="title" class="form-control" placeholder="Write Title Here"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="description">Banner Description</label>
                                            <div class="row">
                                                <div class="col-2">
                                                    <input type="text" class="form-control colorpicker pl-2" name="description_color">
                                                </div>
                                                <div class="col-10 pl-0">
                                                    <input type="text" name="description" id="description" class="form-control" placeholder="Write Description Here"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="btn_text">Button Text</label>
                                            <div class="row">
                                                <div class="col-4">
                                                    <input type="text" class="form-control colorpicker pl-2" name="btn_color">
                                                </div>
                                                <div class="col-8 pl-0">
                                                    <input type="text" name="btn_text" id="btn_text" class="form-control" placeholder="ex. New Collection"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="title">Button link</label>
                                            <input type="text" name="btn_link" class="form-control" id="btn_link" placeholder="https://">
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-lg-12 text-center">
                                <div class="form-group">
                                    <button class="btn btn-primary" type="submit"><i class="feather-save"></i> Save Banner</button>
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
    <script src="{{ url('assets') }}/js/spectrum.min.js"></script>

    <script>
        $(".colorpicker").spectrum({
            preferredFormat: 'hex',
        });
    </script>
@endsection
