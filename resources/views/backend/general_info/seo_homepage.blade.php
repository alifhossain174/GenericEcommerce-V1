@extends('backend.master')

@section('header_css')
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
    SEO for HomePage
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">Search Engine Optimization for HomePage</h4>

                    <form class="needs-validation" method="POST" action="{{url('update/seo/homepage')}}" enctype="multipart/form-data">
                        @csrf
                        <div class="row pt-3">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="meta_title">Meta Title</label>
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
                                    <label for="meta_keywords">Meta Keywords <small>("," Comma Separated)</small></label>
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
                                    <label for="meta_description">Meta Description</label>
                                    <textarea id="meta_description" name="meta_description" rows="5" class="form-control" placeholder="Write Meta Description Here">{{$data->meta_description}}</textarea>
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
    <script src="{{url('assets')}}/js/tagsinput.js"></script>
@endsection
