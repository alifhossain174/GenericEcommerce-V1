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
    Custom Page
@endsection
@section('page_heading')
    Create Custom Page
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">Custom Page Create Form</h4>

                    <form class="needs-validation" method="POST" action="{{url('save/custom/page')}}" enctype="multipart/form-data">
                        @csrf

                        <div class="row">
                            <div class="col-lg-5">

                                <div class="form-group">
                                    <label for="colFormLabel" class="col-form-label">Page Feature Image (1112px X 400px)</label>
                                    <input type="file" name="image" class="dropify" data-height="250" data-max-file-size="1M" accept="image/*"/>
                                </div>

                                <div class="form-group">
                                    <label for="meta_title">Page Meta Title <small class="text-info font-weight-bolder">(SEO)</small></label>
                                    <input type="text" id="meta_title" name="meta_title" class="form-control" placeholder="Meta Title">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('meta_title')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="meta_keywords">Page Meta Keywords <small class="text-info font-weight-bolder">(SEO)</small></label>
                                    <input type="text" id="meta_keywords" data-role="tagsinput" name="meta_keywords" class="form-control">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('meta_keywords')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="meta_description">Page Meta Description <small class="text-info font-weight-bolder">(SEO)</small></label>
                                    <textarea id="meta_description" name="meta_description" class="form-control" placeholder="Meta Description Here" rows="5"></textarea>
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('meta_description')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>

                            </div>
                            <div class="col-lg-7">

                                <div class="form-group">
                                    <label for="page_title" class="col-form-label">Page Title <span class="text-danger">*</span></label>
                                    <input type="text" name="page_title" class="form-control" id="page_title" placeholder="Page Title" required>
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('page_title')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="description" class="col-form-label">Page Description</label>
                                    <textarea id="description" name="description" class="form-control"></textarea>
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('description')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>

                            </div>
                        </div>


                        <div class="form-group row pt-3">
                            <div class="col-sm-12 text-center">
                                <button class="btn btn-primary" type="submit"><i class="fas fa-save"></i> Save Custom Page</button>
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
    <script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
    <script src="{{url('assets')}}/js/tagsinput.js"></script>
    <script type="text/javascript">
        CKEDITOR.replace('description', {
            filebrowserUploadUrl: "{{route('ckeditor.upload', ['_token' => csrf_token() ])}}",
            filebrowserUploadMethod: 'form',
            height: 400,
        });
    </script>
@endsection
