@extends('backend.master')

@section('header_css')
<link href="{{url('assets')}}/plugins/dropify/dropify.min.css" rel="stylesheet" type="text/css" />
<link href="{{ url('assets') }}/css/spectrum.min.css" rel="stylesheet" type="text/css" />
@endsection

@section('page_title')
Slider
@endsection
@section('page_heading')
Update Slider
@endsection

@section('content')
<div class="row">
    <div class="col-lg-12 col-xl-12">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title mb-3">Slider Update Form</h4>

                <form class="needs-validation" method="POST" action="{{url('update/slider')}}"
                    enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="slug" value="{{$data->slug}}">

                    <div class="row justify-content-center">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="slider">Slider Image <span class="text-danger">*</span></label>
                                <input type="file" name="image" class="dropify" data-height="262"
                                    data-max-file-size="1M" accept="image/*" />
                                <small class="form-text text-muted">[ Please upload jpg, jpeg, png file of 1226px *
                                    632px
                                    ]</small>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="slider">Mobile/App Slider Image<span class="text-danger">*</span></label>
                                <input type="file" name="image_for_app" class="dropify" data-height="262"
                                    data-max-file-size="1M" accept="image/*" />
                                <small class="form-text text-muted">[ Please upload jpg, jpeg, png file of 500px *
                                    260px
                                    ]</small>
                            </div>
                        </div>
                    </div>

                    <div class="row justify-content-center">
                        <div class="col-lg-8">

                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label for="text_position">Text Position</label>
                                        <select class="form-control" name="text_position" id="text_position">
                                            <option value="">Select Option</option>
                                            <option value="left" @if($data->text_position == 'left') selected
                                                @endif>Left</option>
                                            <option value="right" @if($data->text_position == 'right') selected
                                                @endif>Right</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label for="link">Slider Link</label>
                                        <input type="text" name="link" value="{{$data->link}}" class="form-control"
                                            id="link" placeholder="https://">
                                        <div class="invalid-feedback" style="display: block;">
                                            @error('link')
                                            {{ $message }}
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label for="link_for_app">App Link</label>
                                        <input type="text" name="link_for_app" value="{{$data->link_for_app}}"
                                            class="form-control" id="link_for_app" placeholder="https://">
                                        <div class="invalid-feedback" style="display: block;">
                                            @error('link_for_app')
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
                                                <input type="text" class="form-control colorpicker pl-2"
                                                    value="{{$data->sub_title_color}}" name="sub_title_color">
                                            </div>
                                            <div class="col-10 pl-0">
                                                <input type="text" name="sub_title" value="{{$data->sub_title}}"
                                                    id="sub_title" class="form-control"
                                                    placeholder="Write Sub Title Here" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="title">Banner Title</label>
                                        <div class="row">
                                            <div class="col-2">
                                                <input type="text" class="form-control colorpicker pl-2"
                                                    value="{{$data->title_color}}" name="title_color">
                                            </div>
                                            <div class="col-10 pl-0">
                                                <input type="text" name="title" id="title" value="{{$data->title}}"
                                                    class="form-control" placeholder="Write Title Here" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="description">Banner Description</label>
                                        <div class="row">
                                            <div class="col-2">
                                                <input type="text" class="form-control colorpicker pl-2"
                                                    value="{{$data->description_color}}" name="description_color">
                                            </div>
                                            <div class="col-10 pl-0">
                                                <input type="text" name="description" id="description"
                                                    value="{{$data->description}}" class="form-control"
                                                    placeholder="Write Description Here" />
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
                                                <input type="text" class="form-control colorpicker pl-2"
                                                    value="{{$data->btn_color}}" name="btn_color">
                                            </div>
                                            <div class="col-8 pl-0">
                                                <input type="text" name="btn_text" id="btn_text"
                                                    value="{{$data->btn_text}}" class="form-control"
                                                    placeholder="ex. New Collection" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="title">Button link</label>
                                        <input type="text" name="btn_link" value="{{$data->btn_link}}"
                                            class="form-control" id="btn_link" placeholder="https://">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="colFormLabe0">Status <span class="text-danger">*</span></label>
                                        <select name="status" class="form-control" id="colFormLabe0" required>
                                            <option value="">Select One</option>
                                            <option value="1" @if($data->status == 1) selected @endif>Active</option>
                                            <option value="0" @if($data->status == 0) selected @endif>Inactive</option>
                                        </select>
                                        <div class="invalid-feedback" style="display: block;">
                                            @error('status')
                                            {{ $message }}
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-lg-12 text-center">
                            <div class="form-group">
                                <button class="btn btn-primary" type="submit"><i class="feather-save"></i> Update
                                    Slider</button>
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
    @if($data->image && file_exists(public_path($data->image)))
            $(".dropify-preview").eq(0).css("display", "block");
            $(".dropify-clear").eq(0).css("display", "block");
            $(".dropify-filename-inner").eq(0).html("{{$data->image}}");
            $("span.dropify-render").eq(0).html("<img src='{{url($data->image)}}'>");
        @endif

        @if($data->image_for_app && file_exists(public_path($data->image_for_app)))
            $(".dropify-preview").eq(1).css("display", "block");
            $(".dropify-clear").eq(1).css("display", "block");
            $(".dropify-filename-inner").eq(1).html("{{$data->image_for_app}}");
            $("span.dropify-render").eq(1).html("<img src='{{url($data->image_for_app)}}'>");
        @endif

        $(".colorpicker").spectrum({
            preferredFormat: 'hex',
        });
</script>
@endsection
