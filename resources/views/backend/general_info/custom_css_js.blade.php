@extends('backend.master')

@section('header_css')
    <link rel="stylesheet" href="{{url('codeMirror')}}/css/codemirror.css">
    <link rel="stylesheet" href="{{url('codeMirror')}}/css/themes/material.css">
    <style>
        .CodeMirror {
            border-radius: 6px;
            padding: 12px 3px;
        }
        .CodeMirror-scroll{
            width: 100%;
        }
    </style>
@endsection

@section('header_js')
    <script src="{{url('codeMirror')}}/js/codemirror.js"></script>
    <script src="{{url('codeMirror')}}/js/xml.js"></script>
    <script src="{{url('codeMirror')}}/js/php.js"></script>
    <script src="{{url('codeMirror')}}/js/javascript.js"></script>
    <script src="{{url('codeMirror')}}/js/python.js"></script>
    <script src="{{url('codeMirror')}}/js/addons/closetag.js"></script>
    <script src="{{url('codeMirror')}}/js/addons/closebrackets.js"></script>
@endsection

@section('page_title')
    Website Config
@endsection
@section('page_heading')
    Custom CSS & JS
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">Custom CSS & JS Form</h4>

                    <form class="needs-validation" method="POST" action="{{url('update/custom/css/js')}}" enctype="multipart/form-data">
                        @csrf

                        <div class="form-group row mt-3">
                            <label for="custom_css" class="col-sm-2 col-form-label">Write Custom CSS</label>
                            <div class="col-sm-10">
                                <textarea name="custom_css" class="form-control" id="code_editor_css" style="cursor: pointer">{{$data->custom_css}}</textarea>
                            </div>
                        </div>

                        <div class="form-group row mt-3">
                            <label for="custom_js" class="col-sm-2 col-form-label">Write Custom JS</label>
                            <div class="col-sm-10">
                                <textarea name="custom_js" class="form-control" id="code_editor_js" style="cursor: pointer">{{$data->custom_js}}</textarea>
                            </div>
                        </div>

                        <div class="form-group text-center pt-3 mt-3">
                            <a href="{{url('/home')}}" style="width: 130px;" class="btn btn-danger d-inline-block text-white m-2" type="submit"><i class="mdi mdi-cancel"></i> Cancel</a>
                            <button class="btn btn-primary m-2" type="submit" style="width: 140px;"><i class="fas fa-save"></i> Update Code</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection


@section('footer_js')
    <script>
        var textareas = document.getElementById("code_editor_css");
        editor = CodeMirror.fromTextArea(textareas, {
            mode: "javascript",
            theme: "material",
            lineNumbers: true,
            autoCloseTags: true,
            autoCloseBrackets: true
        });
        editor.setSize("100%", "200");

        var textareas = document.getElementById("code_editor_js");
        editor = CodeMirror.fromTextArea(textareas, {
            mode: "javascript",
            theme: "material",
            lineNumbers: true,
            autoCloseTags: true,
            autoCloseBrackets: true
        });
        editor.setSize("100%", "200");
    </script>
@endsection
