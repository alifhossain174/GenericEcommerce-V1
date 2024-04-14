@extends('backend.master')

@section('page_title')
    Product
@endsection
@section('page_heading')
    Upload Products from Excel
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">Upload Products from Excel</h4>
                    <div class="row">
                        <div class="col-lg-5" style="border: 1px solid #f7f7f7">
                            <img src="{{url('assets')}}/images/excel_upload.png" class="img-fluid">
                        </div>
                        <div class="col-lg-7 p-5" style="background: #f7f7f7">
                            <span style="font-size: 15px; color: #1e1e1e;">
                                You can upload products using excel file but the fromat of the excel file have to match our sample file below. It will be better if you use our demo excel file to feed data and then upload into our system.
                                <br><br>
                                Demo Excel File:
                                <a href="{{url('/')}}/products.xlsx" download="{{url('/')}}/products.xlsx">products.xlsx</a>
                            </span>

                            <form action="{{url('/')}}" method="POST" class="mt-4">
                                @csrf

                                <div class="form-group">
                                    <label>Upload Excel File</label>
                                    <input type="file" name="excel_file" class="form-control" required>
                                </div>

                                <button type="submit" class="btn btn-success rounded w-100 d-block"><i class="feather-upload"></i> Upload Products</button>
                                <small>Please be patience, Uploading products may take a few minutes depending on the volume of data</small>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
