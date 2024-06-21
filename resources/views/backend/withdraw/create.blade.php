@extends('backend.master')

@section('header_css')
    <link href="{{url('assets')}}/plugins/select2/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="{{url('assets')}}/plugins/bootstrap-touchspin/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css" />
    <style>
        .select2-selection{
            min-height: 34px !important;
            border: 1px solid #ced4da !important;
        }
        .select2 {
            width: 100% !important;
        }
    </style>
@endsection

@section('page_title')
    Vendor
@endsection
@section('page_heading')
    Create New Vendor
@endsection

@section('content')
    <div class="row justify-content-center">
        <div class="col-lg-6 col-xl-6">
            <div class="card">
                <div class="card-body">

                    <form class="needs-validation" method="POST" action="{{url('save/withdraw/request')}}" enctype="multipart/form-data">
                        @csrf

                        <h4 class="card-title mb-3">Withdraw Information:</h4>
                        <div class="row">
                            <div class="col-lg-12">

                                <div class="form-group">
                                    <label for="vendor_id" class="col-form-label">Select Vendor<span class="text-danger">*</span> (Business Name - Store Name - User Name)</label>
                                    <select id="vendor_id" name="vendor_id" onchange="vendorInfo()" class="form-control" data-toggle="select2" required>
                                        <option value="">Select One</option>
                                        @foreach ($vendors as $vendor)
                                        <option value="{{$vendor->id}}">{{$vendor->business_name}} - {{$vendor->store_name}} - {{$vendor->name}}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="payment_method" class="col-form-label">Payment Method<span class="text-danger">*</span></label>
                                    <select id="payment_method" name="payment_method" onchange="paymentMethod()" class="form-control" required>
                                        <option value="">Select One</option>
                                        <option value="1">Bank</option>
                                        <option value="2">bKash</option>
                                        <option value="3">Nagad</option>
                                        <option value="4">Rocket</option>
                                        <option value="5">Upay</option>
                                        <option value="6">Sure Cash</option>
                                    </select>
                                </div>

                                <div class="row d-none" id="bank_account">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="bank_name" class="col-form-label">Bank Name<span class="text-danger">*</span></label>
                                            <input type="text" id="bank_name" name="bank_name" class="form-control" placeholder="Bank Name"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="branch_name" class="col-form-label">Branch Name<span class="text-danger">*</span></label>
                                            <input type="text" id="branch_name" name="branch_name" class="form-control" placeholder="Branch Name"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="routing_no" class="col-form-label">Routing No</label>
                                            <input type="text" id="routing_no" name="routing_no" class="form-control" placeholder="Routing No"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="acc_holder_name" class="col-form-label">Account Holder Name<span class="text-danger">*</span></label>
                                            <input type="text" id="acc_holder_name" name="acc_holder_name" class="form-control" placeholder="Account Holder Name"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="acc_no" class="col-form-label">Account No<span class="text-danger">*</span></label>
                                            <input type="text" id="acc_no" name="acc_no" class="form-control" placeholder="Account No"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="row d-none" id="mobile_account">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="mobile_no" class="col-form-label">Mobile Account No<span class="text-danger">*</span></label>
                                            <input type="text" id="mobile_no" name="mobile_no" class="form-control" placeholder="Mobile Account No"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="current_balance" class="col-form-label">Current Balance</label>
                                            <input type="text" id="current_balance" name="current_balance" value="0" class="form-control" readonly/>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="withdraw_amount" class="col-form-label">Withdraw Amount<span class="text-danger">*</span></label>
                                            <input type="text" data-toggle="touchspin" id="withdraw_amount" value="{{ old('withdraw_amount') }}" name="withdraw_amount" class="form-control" required/>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="transaction_id" class="col-form-label">Transaction ID</label>
                                    <input type="text" id="transaction_id" value="{{ old('transaction_id') }}" placeholder="Transaction ID" name="transaction_id" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label for="remarks" class="col-form-label">Remarks</label>
                                    <textarea id="remarks" name="remarks" class="form-control" placeholder="Comments"></textarea>
                                </div>

                                <div class="form-group row pt-3">
                                    <div class="col-sm-12 text-center">
                                        <button class="btn btn-primary" type="submit"><i class="fas fa-save"></i> Submit & Approve Withdraw</button>
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
    <script src="{{url('assets')}}/plugins/select2/select2.min.js"></script>
    <script src="{{url('assets')}}/plugins/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
    <script type="text/javascript">
        $('[data-toggle="select2"]').select2();

        var defaultOptions = {};
        $('[data-toggle="touchspin"]').each(function (idx, obj) {
            var objOptions = $.extend({}, defaultOptions, $(obj).data());
            $(obj).TouchSpin(objOptions);
        });

        $( document ).ready(function() {
            paymentMethod();
            vendorInfo();
        });

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        function vendorInfo(){

            var vendorId = $("#vendor_id").val();
            if(vendorId){
                var formData = new FormData();
                formData.append("vendor_id", $("#vendor_id").val());

                $(this).html('Saving..');
                $.ajax({
                    data: formData,
                    url: "{{ url('vendor/balance') }}",
                    type: "POST",
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (data) {
                        $("#current_balance").val(data.balance);
                    },
                    error: function (data) {
                        console.log('Error:', data);
                        $('#saveBtn').html('Save');
                    }
                });
            }

        }

        function paymentMethod(){
            var paymentMethod = parseInt($("#payment_method").val());
            if(paymentMethod && paymentMethod > 0){
                if(paymentMethod == 1){
                    $("#bank_account").removeClass("d-none");
                    $("#bank_account").addClass("d-block");

                    $("#mobile_account").removeClass("d-block");
                    $("#mobile_account").addClass("d-none");
                } else {
                    $("#mobile_account").removeClass("d-none");
                    $("#mobile_account").addClass("d-block");

                    $("#bank_account").removeClass("d-block");
                    $("#bank_account").addClass("d-none");
                }
            }
        }
    </script>
@endsection
