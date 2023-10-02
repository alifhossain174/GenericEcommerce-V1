@extends('backend.master')

@section('header_css')
    <link href="{{url('assets')}}/plugins/dropify/dropify.min.css" rel="stylesheet" type="text/css" />
@endsection

@section('page_title')
    Category
@endsection
@section('page_heading')
    Add New Category
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">Category Create Form</h4>

                    <form class="needs-validation" method="POST" action="{{url('save/new/category')}}" enctype="multipart/form-data">
                        @csrf

                        <div class="form-group row">
                            <label for="colFormLabel" class="col-sm-2 col-form-label">Name <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <input type="text" name="name" class="form-control" id="colFormLabel" placeholder="Category Name" required>
                                <div class="invalid-feedback" style="display: block;">
                                    @error('name')
                                        {{ $message }}
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="colFormLabel" class="col-sm-2 col-form-label">Category Icon</label>
                            <div class="col-sm-10">
                                <input type="file" name="icon" class="dropify" data-height="100" data-max-file-size="1M" accept="image/*"/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="colFormLabel" class="col-sm-2 col-form-label">Category Banner</label>
                            <div class="col-sm-10">
                                <input type="file" name="banner_image" class="dropify" data-height="200" data-max-file-size="1M" accept="image/*"/>
                            </div>
                        </div>


                        {{-- <div class="input-group">
                            <span class="input-group-btn">
                                <a id="lfm" data-input="thumbnail" data-preview="holder" class="btn btn-primary text-white">
                                    <i class="fi fi-rr-picture"></i> Set hero image
                                </a>
                            </span>
                            <input id="thumbnail" class="form-control" type="text" name="hero_img">
                        </div>
                        <small class="text-muted">Please upload jpg, jpeg, png file.</small> --}}


                        <div class="form-group">
                            <button class="btn btn-primary" type="submit">Save Category</button>
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
    <script>
        // var route_prefix = "/filemanager";
        // {!! \File::get(base_path('vendor/unisharp/laravel-filemanager/public/js/stand-alone-button.js')) !!}

        // $('#lfm').filemanager('image', {
        //     prefix: route_prefix
        // });

        // var loadFile = function(event) {
        //     var output = document.getElementById('output');
        //     output.src = URL.createObjectURL(event.target.files[0]);
        //     output.onload = function() {
        //         URL.revokeObjectURL(output.src) // free memory
        //     }
        // };
    </script>
@endsection
