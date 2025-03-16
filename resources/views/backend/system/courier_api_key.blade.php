@extends('backend.master')

@section('header_css')
    <link href="{{ url('assets') }}/plugins/switchery/switchery.min.css" rel="stylesheet" type="text/css" />
@endsection

@section('page_title')
    Courier Api Key & COD Charge Setup
@endsection
@section('page_heading')
    Courier Api Key & COD Charge Setup
@endsection

@section('content')
    <div class="row">

        <div class="col-lg-4 col-xl-4">
            <div class="card"
                style=@if (isset($courierApiKeys[0]) && $courierApiKeys[0]->status == 1) border: 2px solid green; box-shadow: 2px 2px 5px #b5b5b5; @endif">
                <div class="card-body">
                    <h4 class="card-title mb-3">
                        <div class="row">
                            <div class="col-lg-8">Steadfast Courier</div>
                            <div class="col-lg-4 text-right">
                                <input type="checkbox" class="switchery_checkbox" id="steadfast" value="steadfast"
                                    @if (isset($courierApiKeys[0]) && $courierApiKeys[0]->status == 1) checked @endif
                                    onchange="changeGatewayStatus('steadfast')" name="has_variant" data-size="small"
                                    data-toggle="switchery" data-color="#53c024" data-secondary-color="#df3554" />
                            </div>
                        </div>
                    </h4>

                    <div class="row" style="height: 120px;">
                        <div class="col-lg-12 text-center pt-4 pb-4">
                            <img src="{{ url('images') }}/steadfastlogo.svg" style="max-width: 200px; max-height: 65px">
                        </div>
                    </div>

                    <form class="needs-validation" method="POST" action="{{ url('update/courier/api/key/info') }}"
                        enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="provider" value="steadfast">
                        <div class="row">
                            <div class="col-lg-12">

                                <div class="form-group">
                                    <label for="app_key">APP Key</label>
                                    <input type="text" id="app_key" name="app_key"
                                        value="{{ isset($courierApiKeys[0]) ? $courierApiKeys[0]->app_key : '' }}"
                                        class="form-control" placeholder="ex. 7345876UYTUYR856778">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('app_key')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="secret_key">Secret Key</label>
                                    <input type="text" id="secret_key" name="secret_key"
                                        value="{{ isset($courierApiKeys[0]) ? $courierApiKeys[0]->secret_key : '' }}"
                                        class="form-control" placeholder="ex. 7345876UYTUYR8568">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('secret_key')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="courier_cod_charge">Courier COD Charge</label>
                                    <input type="number" id="courier_cod_charge" name="courier_cod_charge"
                                        value="{{ isset($courierApiKeys[0]) ? $courierApiKeys[0]->courier_cod_charge : '' }}"
                                        class="form-control" max="0.01" step="0.01" placeholder="0.01">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('courier_cod_charge')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="form-group text-center pt-3">
                            <button class="btn btn-primary" type="submit">Update Info</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('footer_js')
    <script src="{{ url('assets') }}/plugins/switchery/switchery.min.js"></script>
    <script>
        $('[data-toggle="switchery"]').each(function(idx, obj) {
            new Switchery($(this)[0], $(this).data());
        });

        function changeGatewayStatus(value) {
            var provider = value;
            $.ajax({
                type: "GET",
                url: "{{ url('change/gateway/status') }}" + '/' + provider,
                success: function(data) {
                    toastr.success("Status Changed", "Updated Successfully");
                    setTimeout(function() {
                        console.log("Wait For 1 Sec");
                        location.reload(true);
                    }, 1000);
                },
                error: function(data) {
                    console.log('Error:', data);
                }
            });
        }
    </script>
@endsection
