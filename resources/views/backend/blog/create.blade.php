@extends('backend.master')

@section('header_css')
    <link href="{{url('assets')}}/plugins/dropify/dropify.min.css" rel="stylesheet" type="text/css" />
    <link href="{{url('assets')}}/plugins/select2/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="{{url('assets')}}/css/tagsinput.css" rel="stylesheet" type="text/css" />
    <style>
        .select2-selection{
            height: 34px !important;
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
    Blog
@endsection
@section('page_heading')
    Write a Blog
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">Blog Entry Form</h4>

                    <form class="needs-validation" method="POST" action="{{url('save/new/blog')}}" enctype="multipart/form-data">
                        @csrf

                        <div class="row">
                            <div class="col-lg-12">

                                <div class="row">

                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="image">Cover Image <span class="text-danger">*</span></label>
                                            <input type="file" name="image" class="dropify" data-height="200" data-max-file-size="1M" accept="image/*" required/>
                                        </div>
                                    </div>
                                    <div class="col-lg-9">

                                        <div class="form-group">
                                            <label for="category_id">Category<span class="text-danger">*</span></label>
                                            <select name="category_id" data-toggle="select2" class="form-control" id="category_id" required>
                                                @php
                                                    echo App\Models\BlogCategory::getDropDownList('name');
                                                @endphp
                                            </select>
                                            <div class="invalid-feedback" style="display: block;">
                                                @error('category_id')
                                                    {{ $message }}
                                                @enderror
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="title">Blog Title <span class="text-danger">*</span></label>
                                            <input type="text" id="title" name="title" maxlength="255" class="form-control" placeholder="Enter Product Title Here" required>
                                            <div class="invalid-feedback" style="display: block;">
                                                @error('title')
                                                    {{ $message }}
                                                @enderror
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="short_description">Short Description</label>
                                            <textarea id="short_description" name="short_description" class="form-control" placeholder="Enter Short Description Here"></textarea>
                                            <div class="invalid-feedback" style="display: block;">
                                                @error('short_description')
                                                    {{ $message }}
                                                @enderror
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="description">Full Description</label>
                                    <textarea id="description" name="description" class="form-control"></textarea>
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('short_description')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>

                                <div class="form-group d-none">
                                    <label for="tags">Tags (for search result)</label>
                                    <input type="text" name="tags" data-role="tagsinput" class="form-control">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('tags')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row mt-3">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body table-responsive">
                                        <h4 class="card-title mb-3">Blog SEO Information <small class="text-danger font-weight-bolder">(Optional)</small></h4>

                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="meta_title">Meta Title</label>
                                                    <input type="text" id="meta_title" name="meta_title" class="form-control" placeholder="Meta Title">
                                                    <div class="invalid-feedback" style="display: block;">
                                                        @error('meta_title')
                                                            {{ $message }}
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="meta_keywords">Meta Keywords</label>
                                                    <input type="text" id="meta_keywords" data-role="tagsinput" name="meta_keywords" class="form-control">
                                                    <div class="invalid-feedback" style="display: block;">
                                                        @error('meta_keywords')
                                                            {{ $message }}
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <label for="meta_description">Meta Description</label>
                                                    <textarea id="meta_description" name="meta_description" class="form-control" placeholder="Meta Description Here"></textarea>
                                                    <div class="invalid-feedback" style="display: block;">
                                                        @error('meta_description')
                                                            {{ $message }}
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="form-group text-center pt-3">
                            <a href="{{url('view/all/blogs')}}" style="width: 130px;" class="btn btn-danger d-inline-block text-white m-2" type="submit"><i class="mdi mdi-cancel"></i> Cancel</a>
                            <button class="btn btn-primary m-2" style="width: 130px;" type="submit"><i class="fas fa-save"></i> Save Blog</button>
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

    <script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
    <script type="text/javascript">

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('[data-toggle="select2"]').select2();

        CKEDITOR.replace('description', {
            filebrowserUploadUrl: "{{route('ckeditor.upload', ['_token' => csrf_token() ])}}",
            filebrowserUploadMethod: 'form',
            height: 300,
        });

    </script>
@endsection
