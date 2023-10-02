@extends('backend.master')

@section('header_css')
    <link href="{{url('assets')}}/plugins/dropify/dropify.min.css" rel="stylesheet" type="text/css" />
@endsection

@section('page_title')
    Slider
@endsection
@section('page_heading')
    Add New Slider
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">Slider Create Form</h4>

                    <form class="needs-validation" method="POST" action="{{url('save/new/slider')}}" enctype="multipart/form-data">
                        @csrf

                        <div class="form-group row">
                            <label for="slider" class="col-sm-2 col-form-label">Slider (1112*586)</label>
                            <div class="col-sm-10">
                                <input type="file" name="image" class="dropify" data-height="300" data-max-file-size="1M" accept="image/*" required/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="link" class="col-sm-2 col-form-label">Link</label>
                            <div class="col-sm-10">
                                <input type="text" name="link" class="form-control" id="link" placeholder="Slider Link">
                                <div class="invalid-feedback" style="display: block;">
                                    @error('link')
                                        {{ $message }}
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <button class="btn btn-primary" type="submit">Save Slider</button>
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
