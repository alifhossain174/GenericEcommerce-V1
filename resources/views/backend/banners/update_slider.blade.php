@extends('backend.master')

@section('header_css')
    <link href="{{url('assets')}}/plugins/dropify/dropify.min.css" rel="stylesheet" type="text/css" />
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

                    <form class="needs-validation" method="POST" action="{{url('update/slider')}}" enctype="multipart/form-data">
                        @csrf

                        <input type="hidden" name="slug" value="{{$data->slug}}">

                        <div class="form-group row">
                            <label for="slider" class="col-sm-2 col-form-label">Slider</label>
                            <div class="col-sm-10">
                                @if(file_exists(public_path($data->image))) <img src="{{url($data->image)}}" width="200"> @endif <br><br>
                                <input type="file" name="image" class="dropify" data-height="300" data-max-file-size="1M" accept="image/*"/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="link" class="col-sm-2 col-form-label">Link</label>
                            <div class="col-sm-10">
                                <input type="text" name="link" class="form-control" value="{{$data->link}}" id="link" placeholder="Slider Link">
                                <div class="invalid-feedback" style="display: block;">
                                    @error('link')
                                        {{ $message }}
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="colFormLabe0" class="col-sm-2 col-form-label">Status <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
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

                        <div class="form-group">
                            <button class="btn btn-primary" type="submit">Update Slider</button>
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
