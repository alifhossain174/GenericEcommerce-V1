@extends('backend.master')

@section('header_css')
    <link href="{{url('assets')}}/plugins/dropify/dropify.min.css" rel="stylesheet" type="text/css" />
@endsection

@section('page_title')
    Brand
@endsection
@section('page_heading')
    Update Brand
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">Brand Update Form</h4>

                    <form class="needs-validation" method="POST" action="{{url('update/brand')}}" enctype="multipart/form-data">
                        @csrf

                        <input type="hidden" name="slug" value="{{$data->slug}}">
                        <input type="hidden" name="id" value="{{$data->id}}">

                        <div class="form-group row">
                            <label for="colFormLabel" class="col-sm-2 col-form-label">Name <span class="text-danger">*</span></label>
                            <div class="col-sm-10">
                                <input type="text" name="name" class="form-control" value="{{$data->name}}" id="colFormLabel" placeholder="Brand Name" required>
                                <div class="invalid-feedback" style="display: block;">
                                    @error('name')
                                        {{ $message }}
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="colFormLabel" class="col-sm-2 col-form-label">Change Logo</label>
                            <div class="col-sm-8">
                                <input type="file" name="logo" class="dropify" data-height="100" data-max-file-size="1M" accept="image/*"/>
                            </div>
                            <div class="col-sm-2">
                                <label class="col-form-label">Previous Logo</label><br>
                                @if($data->logo != '' && file_exists(public_path($data->logo)))
                                    <img src="{{url($data->logo)}}" width="60">
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="colFormLabel" class="col-sm-2 col-form-label">Change Banner (545px*845px)</label>
                            <div class="col-sm-8">
                                <input type="file" name="banner" class="dropify" data-height="200" data-max-file-size="1M" accept="image/*"/>
                            </div>
                            <div class="col-sm-2">
                                <label class="col-form-label">Previous Banner</label><br>
                                @if($data->banner != '' && file_exists(public_path($data->banner)))
                                    <img src="{{url($data->banner)}}" width="60">
                                @endif
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
                            <button class="btn btn-primary" type="submit">Update Brand Info</button>
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
