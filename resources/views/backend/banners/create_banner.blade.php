@extends('backend.master')

@section('header_css')
    <link href="{{url('assets')}}/plugins/dropify/dropify.min.css" rel="stylesheet" type="text/css" />
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

                        <div class="form-group row">
                            <label for="banner" class="col-sm-2 col-form-label">Banner (544*280)</label>
                            <div class="col-sm-10">
                                <input type="file" name="image" class="dropify" data-height="300" data-max-file-size="1M" accept="image/*" required/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="link" class="col-sm-2 col-form-label">Link</label>
                            <div class="col-sm-10">
                                <input type="text" name="link" class="form-control" id="link" placeholder="Banner Link">
                                <div class="invalid-feedback" style="display: block;">
                                    @error('link')
                                        {{ $message }}
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="position" class="col-sm-2 col-form-label">Position</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="position" id="position" required>
                                    <option value="">Select Option</option>
                                    <option value="top">Top</option>
                                    <option value="left">Left</option>
                                    <option value="right">Right</option>
                                    <option value="middle">Middle</option>
                                    <option value="bottom">Bottom</option>
                                </select>
                                <div class="invalid-feedback" style="display: block;">
                                    @error('position')
                                        {{ $message }}
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <button class="btn btn-primary" type="submit">Save Banner</button>
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
@endsection
