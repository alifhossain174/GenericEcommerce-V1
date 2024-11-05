@extends('backend.master')

@section('header_css')
    <link href="{{url('assets')}}/plugins/switchery/switchery.min.css" rel="stylesheet" type="text/css" />
    <style>
        .premium_addon{
            text-align: center;
            background: goldenrod;
            padding: 5px;
            font-size: 14px;
            color: white;
            text-shadow: 1px 1px 1px black;
            border-radius: 3px 3px 0px 0px;
        }
        .payment_card{
            height: 745px
        }
        .premium_note{
            font-size: 15px;
            text-align: center;
            border: 1px solid goldenrod;
            padding: 6px 4px;
            border-radius: 4px;
            background: white;
        }
    </style>
@endsection

@section('page_title')
    Payment Gateways
@endsection

@section('page_heading')
    Payment Gateways Credentials
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 mb-2">
            <h5 class="premium_note">Note: Premium add-ons are not included in the initial package purchase and must be purchased separately. However, cash on delivery is available at no additional cost.</h5>
        </div>
        <div class="col">
            <div class="card payment_card" style="@if($gateways[0]->status == 1) border: 2px solid green; box-shadow: 2px 2px 5px #b5b5b5; @endif">
                <h5 class="premium_addon">Premium Add-On</h5>
                <div class="card-body">
                    <h4 class="card-title mb-3">
                        <div class="row">
                            <div class="col-lg-8">SSL Commerz</div>
                            <div class="col-lg-4 text-right">
                                <input type="checkbox" class="switchery_checkbox" id="ssl_commerz" @if($gateways[0]->status == 1) checked @endif value="ssl_commerz" onchange="changeGatewayStatus(this.value)" name="has_variant" data-size="small" data-toggle="switchery" data-color="#53c024" data-secondary-color="#df3554"/>
                            </div>
                        </div>
                    </h4>

                    <div class="row" style="height: 100px;">
                        <div class="col-lg-12 text-center pt-3 pb-3">
                            <img src="{{url('/')}}/images/ssl_commerz.png" class="img-fluid" style="max-width: 180px; max-height: 110px; padding-top: 15px">
                        </div>
                    </div>

                    <form class="needs-validation" method="POST" action="{{url('update/payment/gateway/info')}}" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="provider_name" value="{{$gateways[0]->provider_name}}">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="api_key">Store ID</label>
                                    <input type="text" id="api_key" name="api_key" value="{{$gateways[0]->api_key}}" class="form-control" placeholder="3423423URYUR">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('api_key')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="secret_key">Store Password</label>
                                    <input type="text" id="secret_key" name="secret_key" value="{{$gateways[0]->secret_key}}" class="form-control" placeholder="7345876UYTUYR856778">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('secret_key')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="username">Username</label>
                                    <input type="text" id="username" name="username" value="{{$gateways[0]->username}}" class="form-control" placeholder="Username">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('username')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="text" id="password" name="password" value="{{$gateways[0]->password}}" class="form-control" placeholder="*********">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('password')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="live">Payment Mode</label>
                                    <select class="form-control" id="live" name="live">
                                        <option value="">Select One</option>
                                        <option value="0" @if($gateways[0]->live == 0) selected @endif>Test/Sandbox</option>
                                        <option value="1" @if($gateways[0]->live == 1) selected @endif>Production/Live</option>
                                    </select>
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('live')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="status">Status</label>
                                    <select class="form-control" id="status" name="status">
                                        <option value="">Select One</option>
                                        <option value="0" @if($gateways[0]->status == 0) selected @endif>Inactive</option>
                                        <option value="1" @if($gateways[0]->status == 1) selected @endif>Active</option>
                                    </select>
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('status')
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

        <div class="col">
            <div class="card payment_card" style="@if($gateways[1]->status == 1) border: 2px solid green; box-shadow: 2px 2px 5px #b5b5b5; @endif">
                <h5 class="premium_addon">Premium Add-On</h5>
                <div class="card-body">
                    <h4 class="card-title mb-3">
                        <div class="row">
                            <div class="col-lg-8">Stripe</div>
                            <div class="col-lg-4 text-right">
                                <input type="checkbox" class="switchery_checkbox" id="stripe" value="stripe" @if($gateways[1]->status == 1) checked @endif onchange="changeGatewayStatus(this.value)" name="has_variant" data-size="small" data-toggle="switchery" data-color="#53c024" data-secondary-color="#df3554"/>
                            </div>
                        </div>
                    </h4>

                    <div class="row" style="height: 100px;">
                        <div class="col-lg-12 text-center pt-3 pb-3">
                            <img src="{{url('/')}}/images/stripe_payment_gatway.png" style="max-width: 180px; max-height: 80px; height: 70px">
                        </div>
                    </div>

                    <form class="needs-validation" method="POST" action="{{url('update/payment/gateway/info')}}" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="provider_name" value="{{$gateways[1]->provider_name}}">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="api_key">API Key</label>
                                    <input type="text" id="api_key" name="api_key" value="{{$gateways[1]->api_key}}" class="form-control" placeholder="3423423URYUR">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('api_key')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="secret_key">Secret Key</label>
                                    <input type="text" id="secret_key" name="secret_key" value="{{$gateways[1]->secret_key}}" class="form-control" placeholder="7345876UYTUYR856778">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('secret_key')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="username">Username</label>
                                    <input type="text" id="username" name="username" value="{{$gateways[1]->username}}" class="form-control" placeholder="Username">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('username')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="text" id="password" name="password" value="{{$gateways[1]->password}}" class="form-control" placeholder="*********">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('password')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="live">Payment Mode</label>
                                    <select class="form-control" id="live" name="live">
                                        <option value="">Select One</option>
                                        <option value="0" @if($gateways[1]->live == 0) selected @endif>Test/Sandbox</option>
                                        <option value="1" @if($gateways[1]->live == 1) selected @endif>Production/Live</option>
                                    </select>
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('live')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="status">Status</label>
                                    <select class="form-control" id="status" name="status">
                                        <option value="">Select One</option>
                                        <option value="0" @if($gateways[1]->status == 0) selected @endif>Inactive</option>
                                        <option value="1" @if($gateways[1]->status == 1) selected @endif>Active</option>
                                    </select>
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('status')
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

        <div class="col">
            <div class="card payment_card" style="@if($gateways[2]->status == 1) border: 2px solid green; box-shadow: 2px 2px 5px #b5b5b5; @endif">
                <h5 class="premium_addon">Premium Add-On</h5>
                <div class="card-body">
                    <h4 class="card-title mb-3">
                        <div class="row">
                            <div class="col-lg-8">bKash</div>
                            <div class="col-lg-4 text-right">
                                <input type="checkbox" class="switchery_checkbox" id="bkash" value="bkash" @if($gateways[2]->status == 1) checked @endif onchange="changeGatewayStatus(this.value)" name="has_variant" data-size="small" data-toggle="switchery" data-color="#53c024" data-secondary-color="#df3554"/>
                            </div>
                        </div>
                    </h4>

                    <div class="row" style="height: 100px;">
                        <div class="col-lg-12 text-center pt-3 pb-3">
                            <img src="{{url('/')}}/images/bkash_payment_gateway.png" style="max-width: 180px; max-height: 110px; height: 70px">
                        </div>
                    </div>

                    <form class="needs-validation" method="POST" action="{{url('update/payment/gateway/info')}}" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="provider_name" value="{{$gateways[2]->provider_name}}">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="api_key">API Key</label>
                                    <input type="text" id="api_key" name="api_key" value="{{$gateways[2]->api_key}}" class="form-control" placeholder="3423423URYUR">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('api_key')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="secret_key">Secret Key</label>
                                    <input type="text" id="secret_key" name="secret_key" value="{{$gateways[2]->secret_key}}" class="form-control" placeholder="7345876UYTUYR856778">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('secret_key')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="username">Username</label>
                                    <input type="text" id="username" name="username" value="{{$gateways[2]->username}}" class="form-control" placeholder="Username">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('username')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="text" id="password" name="password" value="{{$gateways[2]->password}}" class="form-control" placeholder="*********">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('password')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="live">Payment Mode</label>
                                    <select class="form-control" id="live" name="live">
                                        <option value="">Select One</option>
                                        <option value="0" @if($gateways[2]->live == 0) selected @endif>Test/Sandbox</option>
                                        <option value="1" @if($gateways[2]->live == 1) selected @endif>Production/Live</option>
                                    </select>
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('live')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="status">Status</label>
                                    <select class="form-control" id="status" name="status">
                                        <option value="">Select One</option>
                                        <option value="0" @if($gateways[2]->status == 0) selected @endif>Inactive</option>
                                        <option value="1" @if($gateways[2]->status == 1) selected @endif>Active</option>
                                    </select>
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('status')
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

        <div class="col">
            <div class="card payment_card" style="@if($gateways[3]->status == 1) border: 2px solid green; box-shadow: 2px 2px 5px #b5b5b5; @endif">
                <h5 class="premium_addon">Premium Add-On</h5>
                <div class="card-body">
                    <h4 class="card-title mb-3">
                        <div class="row">
                            <div class="col-lg-8">Amar Pay</div>
                            <div class="col-lg-4 text-right">
                                <input type="checkbox" class="switchery_checkbox" id="amar_pay" value="amar_pay" @if($gateways[3]->status == 1) checked @endif onchange="changeGatewayStatus(this.value)" name="has_variant" data-size="small" data-toggle="switchery" data-color="#53c024" data-secondary-color="#df3554"/>
                            </div>
                        </div>
                    </h4>

                    <div class="row" style="height: 100px;">
                        <div class="col-lg-12 text-center pt-3 pb-3">
                            <img src="{{url('/')}}/images/amar_pay.png" style="max-width: 200px; max-height: 110px; height: 55px; padding-top: 10px">
                        </div>
                    </div>

                    <form class="needs-validation" method="POST" action="{{url('update/payment/gateway/info')}}" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="provider_name" value="{{$gateways[3]->provider_name}}">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="api_key">API Key</label>
                                    <input type="text" id="api_key" name="api_key" value="{{$gateways[3]->api_key}}" class="form-control" placeholder="3423423URYUR">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('api_key')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="secret_key">Secret Key</label>
                                    <input type="text" id="secret_key" name="secret_key" value="{{$gateways[3]->secret_key}}" class="form-control" placeholder="7345876UYTUYR856778">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('secret_key')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="username">Username</label>
                                    <input type="text" id="username" name="username" value="{{$gateways[3]->username}}" class="form-control" placeholder="Username">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('username')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="text" id="password" name="password" value="{{$gateways[3]->password}}" class="form-control" placeholder="*********">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('password')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="live">Payment Mode</label>
                                    <select class="form-control" id="live" name="live">
                                        <option value="">Select One</option>
                                        <option value="0" @if($gateways[3]->live == 0) selected @endif>Test/Sandbox</option>
                                        <option value="1" @if($gateways[3]->live == 1) selected @endif>Production/Live</option>
                                    </select>
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('live')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="status">Status</label>
                                    <select class="form-control" id="status" name="status">
                                        <option value="">Select One</option>
                                        <option value="0" @if($gateways[3]->status == 0) selected @endif>Inactive</option>
                                        <option value="1" @if($gateways[3]->status == 1) selected @endif>Active</option>
                                    </select>
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('status')
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

        <div class="col">
            <div class="card payment_card" style="@if($gateways[4]->status == 1) border: 2px solid green; box-shadow: 2px 2px 5px #b5b5b5; @endif">
                <h5 class="premium_addon">Premium Add-On</h5>
                <div class="card-body">
                    <h4 class="card-title mb-3">
                        <div class="row">
                            <div class="col-lg-8">Paypal</div>
                            <div class="col-lg-4 text-right">
                                <input type="checkbox" class="switchery_checkbox" id="paypal" value="paypal" @if($gateways[4]->status == 1) checked @endif onchange="changeGatewayStatus(this.value)" name="has_variant" data-size="small" data-toggle="switchery" data-color="#53c024" data-secondary-color="#df3554"/>
                            </div>
                        </div>
                    </h4>

                    <div class="row" style="height: 100px;">
                        <div class="col-lg-12 text-center pt-3 pb-3">
                            <img src="{{url('/')}}/images/paypal.png" style="max-width: 200px; max-height: 110px; height: 55px; padding-top: 10px">
                        </div>
                    </div>

                    <form class="needs-validation" method="POST" action="{{url('update/payment/gateway/info')}}" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="provider_name" value="{{$gateways[4]->provider_name}}">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="api_key">API Key</label>
                                    <input type="text" id="api_key" name="api_key" value="{{$gateways[4]->api_key}}" class="form-control" placeholder="3423423URYUR">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('api_key')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="secret_key">Secret Key</label>
                                    <input type="text" id="secret_key" name="secret_key" value="{{$gateways[4]->secret_key}}" class="form-control" placeholder="7345876UYTUYR856778">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('secret_key')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="username">Username</label>
                                    <input type="text" id="username" name="username" value="{{$gateways[4]->username}}" class="form-control" placeholder="Username">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('username')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="text" id="password" name="password" value="{{$gateways[4]->password}}" class="form-control" placeholder="*********">
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('password')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="live">Payment Mode</label>
                                    <select class="form-control" id="live" name="live">
                                        <option value="">Select One</option>
                                        <option value="0" @if($gateways[4]->live == 0) selected @endif>Test/Sandbox</option>
                                        <option value="1" @if($gateways[4]->live == 1) selected @endif>Production/Live</option>
                                    </select>
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('live')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="status">Status</label>
                                    <select class="form-control" id="status" name="status">
                                        <option value="">Select One</option>
                                        <option value="0" @if($gateways[4]->status == 0) selected @endif>Inactive</option>
                                        <option value="1" @if($gateways[4]->status == 1) selected @endif>Active</option>
                                    </select>
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('status')
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
    <script src="{{url('assets')}}/plugins/switchery/switchery.min.js"></script>
    <script>
        $('[data-toggle="switchery"]').each(function (idx, obj) {
            new Switchery($(this)[0], $(this).data());
        });

        function changeGatewayStatus(value){
            var provider = value;
            $.ajax({
                type: "GET",
                url: "{{ url('change/payment/gateway/status') }}"+'/'+provider,
                success: function (data) {
                    toastr.success("Status Changed", "Updated Successfully");
                    setTimeout(function() {
                        console.log("Wait For 1 Sec");
                        location.reload(true);
                    }, 1000);
                },
                error: function (data) {
                    console.log('Error:', data);
                }
            });
        }
    </script>
@endsection
