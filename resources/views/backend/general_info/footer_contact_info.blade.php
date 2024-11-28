@extends('backend.master')

@section('header_css')
<link href="{{url('assets')}}/plugins/dropify/dropify.min.css" rel="stylesheet" type="text/css" />
<link href="{{url('assets')}}/css/tagsinput.css" rel="stylesheet" type="text/css" />
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<style>
    <style>.bootstrap-tagsinput .badge {
        margin: 2px 2px !important;
    }
</style>
@endsection

@section('page_title')
Website Config
@endsection
@section('page_heading')
Entry Footer Contact Information
@endsection

@section('content')
<div class="row">
    <div class="col-lg-12 col-xl-12">
        <div class="card">
            <div class="card-body">
                <form class="needs-validation" method="POST" action="{{url('update/footer/contact/info')}}"
                    enctype="multipart/form-data">
                    @csrf

                    <div class="row">
                        <div class="col-lg-8">
                            <h4 class="card-title mb-3">Footer Contact Information</h4>
                        </div>
                        <div class="col-lg-4 text-right">

                            <a href="{{url('/home')}}" style="width: 130px;"
                                class="btn btn-danger d-inline-block text-white m-2" type="submit"><i
                                    class="mdi mdi-cancel"></i> Cancel</a>
                            <button class="btn btn-primary m-2" type="submit" style="width: 140px;"><i
                                    class="fas fa-save"></i> Update Info</button>

                        </div>
                    </div>

                    <div class="row justify-content-center pt-3">
                        <div class="col-lg-9">

                            <div class="form-group row">
                                <label for="contact" class="col-sm-2 col-form-label">Phone No. <span
                                        class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <input type="text" id="contact" data-role="tagsinput" name="contact"
                                        value="{{$data->contact}}" class="form-control" placeholder="01*********">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('contact')
                                        {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="email" class="col-sm-2 col-form-label">Company Emails <span
                                        class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <input type="text" id="email" data-role="tagsinput" name="email"
                                        value="{{$data->email}}" class="form-control" placeholder="Write Email Here">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('email')
                                        {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                            </div>

                            <div class="form-group text-center">
                                <a href="{{url('/home')}}" style="width: 130px;"
                                    class="btn btn-danger d-inline-block text-white m-2" type="submit"><i
                                        class="mdi mdi-cancel"></i> Cancel</a>
                                <button class="btn btn-primary m-2" type="submit" style="width: 140px;"><i
                                        class="fas fa-save"></i> Update Info</button>
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
<script src="{{url('assets')}}/js/tagsinput.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<script>
    $('#short_description').summernote({
            placeholder: 'Write Short Description Here',
            tabsize: 2,
            height: 200
        });

        $('#address').summernote({
            placeholder: 'Write Short Description Here',
            tabsize: 2,
            height: 200
        });

        $('#footer_copyright_text').summernote({
            placeholder: 'Write Short Description Here',
            tabsize: 2,
            height: 200
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

        @if($data->payment_banner && file_exists(public_path($data->payment_banner)))
            $(".dropify-preview").eq(3).css("display", "block");
            $(".dropify-clear").eq(3).css("display", "block");
            $(".dropify-filename-inner").eq(3).html("{{$data->payment_banner}}");
            $("span.dropify-render").eq(3).html("<img src='{{url($data->payment_banner)}}'>");
        @endif
</script>
@endsection
