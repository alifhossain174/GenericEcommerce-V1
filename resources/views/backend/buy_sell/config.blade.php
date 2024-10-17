@extends('backend.master')

@section('header_css')
    <link href="{{url('assets')}}/plugins/dropify/dropify.min.css" rel="stylesheet" type="text/css" />
    <link href="{{url('assets')}}/css/tagsinput.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <style>
        .bootstrap-tagsinput .badge {
            margin: 2px 2px !important;
        }
    </style>
@endsection

@section('page_title')
    BuySell Config
@endsection
@section('page_heading')
    BuySell Config Page
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">BuySell Config Form</h4>

                    <form class="needs-validation" method="POST" action="{{url('save/buy/sell/config')}}" enctype="multipart/form-data">
                        @csrf

                        <div class="row">
                            <div class="col-lg-12">

                                <div class="form-group row">
                                    <label for="banner" class="col-sm-2 col-form-label">Page Banner</label>
                                    <div class="col-sm-6">
                                        <input type="file" name="banner" id="banner" class="dropify" data-height="200" data-max-file-size="1M" accept="image/*"/>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="description" class="col-sm-2 col-form-label">Page Description</label>
                                    <div class="col-sm-10">
                                        <textarea id="description" name="description" class="form-control">{!! $config->description !!}</textarea>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" style="color: transparent">Button</label>
                                    <div class="col-sm-10">
                                        <button class="btn btn-primary" type="submit"><i class="fas fa-save"></i> Save Info</button>
                                    </div>
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
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <script src="{{url('assets')}}/js/tagsinput.js"></script>
    <script type="text/javascript">
        $('#description').summernote({
            placeholder: 'Write Description Here',
            tabsize: 2,
            height: 400
        });

        @if($config->banner && file_exists(public_path($config->banner)))
            $(".dropify-preview").eq(0).css("display", "block");
            $(".dropify-clear").eq(0).css("display", "block");
            $(".dropify-filename-inner").eq(0).html("{{$config->banner}}");
            $("span.dropify-render").eq(0).html("<img src='{{url($config->banner)}}'>");
        @endif
    </script>
@endsection
