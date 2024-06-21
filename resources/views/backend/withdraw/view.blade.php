@extends('backend.master')

@section('header_css')
    <link href="{{ url('dataTable') }}/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="{{ url('dataTable') }}/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <style>
        .dataTables_wrapper .dataTables_paginate .paginate_button {
            padding: 0px;
            border-radius: 4px;
        }

        table.dataTable tbody td:nth-child(1) {
            font-weight: 600;
        }

        table.dataTable tbody td {
            text-align: center !important;
        }

        .graph_card{
            position: relative
        }
        .graph_card i{
            position: absolute;
            top: 18px;
            right: 18px;
            font-size: 18px;
            height: 35px;
            width: 35px;
            line-height: 33px;
            text-align: center;
            border-radius: 50%;
            font-weight: 300;
        }
    </style>
@endsection

@section('page_title')
    Withdraw
@endsection
@section('page_heading')
    View All Withdraws
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-6 col-xl-3">
            <div class="card graph_card">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="text-uppercase font-size-12 text-muted mb-3">Completed Withrawal</h6>
                            <span class="h3 mb-0">
                                ৳ {{DB::table('withdraws')->where('status', 1)->sum('withdraw_amount')}}
                            </span>
                        </div>
                    </div> <!-- end row -->

                    <div id="sparkline1" class="mt-3"></div>
                </div> <!-- end card-body-->
                <i class="feather-dollar-sign" style="color: #027e02; background: #027e0238;"></i>
            </div> <!-- end card-->
        </div> <!-- end col-->

        <div class="col-lg-6 col-xl-3">
            <div class="card graph_card">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="text-uppercase font-size-12 text-muted mb-3">Pending Withrawal</h6>
                            <span class="h3 mb-0">
                                ৳ {{DB::table('withdraws')->where('status', 0)->sum('withdraw_amount')}}
                            </span>
                        </div>
                    </div> <!-- end row -->
                    <div id="sparkline2" class="mt-3"></div>
                </div> <!-- end card-body-->
                <i class="feather-dollar-sign" style="color: #0074E4; background: #0074E42E;"></i>
            </div> <!-- end card-->
        </div> <!-- end col-->

        <div class="col-lg-6 col-xl-3">
            <div class="card graph_card">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="text-uppercase font-size-12 text-muted mb-3">Cancelled Withdrawal</h6>
                            <span class="h3 mb-0">
                                ৳ {{DB::table('withdraws')->where('status', 2)->sum('withdraw_amount')}}
                            </span>
                        </div>
                    </div> <!-- end row -->

                    <div id="sparkline3" class="mt-3"></div>
                </div> <!-- end card-body-->
                <i class="feather-dollar-sign" style="color: #a60000; background: #a6000026;"></i>
            </div> <!-- end card-->
        </div> <!-- end col-->

        <div class="col-lg-6 col-xl-3">
            <div class="card graph_card">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="text-uppercase font-size-12 text-muted mb-3">Vendor Balance</h6>
                            <span class="h3 mb-0">
                                ৳ {{DB::table('users')->where('user_type', 4)->sum('balance')}}
                            </span>
                        </div>
                    </div> <!-- end row -->

                    <div id="sparkline4" class="mt-3"></div>
                </div> <!-- end card-body-->
                <i class="feather-dollar-sign" style="color: #c28a00; background: #daa5202e;"></i>
            </div> <!-- end card-->
        </div> <!-- end col-->
    </div>

    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">All Withdraws</h4>
                    <div class="table-responsive">
                        <table class="table table-bordered mb-0 data-table">
                            <thead>
                                <tr>
                                    <th class="text-center">SL</th>
                                    <th class="text-center">Vendor</th>
                                    {{-- <th class="text-center">Store</th> --}}
                                    {{-- <th class="text-center">Before Withdraw</th> --}}
                                    <th class="text-center">Amount</th>
                                    <th class="text-center">Datetime</th>
                                    <th class="text-center">Method</th>
                                    <th class="text-center">Bank</th>
                                    <th class="text-center">Bank Acc</th>
                                    <th class="text-center">MFS Acc</th>
                                    <th class="text-center">Tran. ID</th>
                                    <th class="text-center">Status</th>
                                    <th class="text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form id="productForm" name="productForm" class="form-horizontal">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Withdraw Info</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Vendor Name</label>
                                    <input type="text" class="form-control" id="vendor_name" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Store Name</label>
                                    <input type="text" class="form-control" id="store_name" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Before Withdraw</label>
                                    <input type="text" class="form-control" id="amount_before_withdraw" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Withdraw Amount</label>
                                    <input type="text" class="form-control" id="withdraw_amount" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Current Balance</label>
                                    <input type="text" class="form-control" id="amount_after_withdraw" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Payment Method</label>
                                    <input type="text" class="form-control" id="payment_method" readonly>
                                </div>
                            </div>
                        </div>

                        <div class="row d-none" id="bank_account">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label>Bank Name</label>
                                    <input type="text" class="form-control" id="bank_name" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Branch Name</label>
                                    <input type="text" class="form-control" id="branch_name" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Routing No</label>
                                    <input type="text" class="form-control" id="routing_no" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Account Holder Name</label>
                                    <input type="text" class="form-control" id="acc_holder_name" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Account No</label>
                                    <input type="text" class="form-control" id="acc_no" readonly>
                                </div>
                            </div>
                        </div>

                        <div class="row d-none" id="mobile_account">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label>MFS Account No</label>
                                    <input type="text" class="form-control" id="mobile_no" readonly>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Transaction ID</label>
                                    <input type="text" class="form-control" id="transaction_id" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Status</label>
                                    <input type="text" class="form-control" id="status" readonly>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label>Remarks</label>
                                    <textarea class="form-control" id="remarks" readonly></textarea>
                                </div>
                            </div>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form id="productForm" name="productForm" class="form-horizontal">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Withdraw Info</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="withdraw_id2">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Vendor Name</label>
                                    <input type="text" class="form-control" id="vendor_name2" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Store Name</label>
                                    <input type="text" class="form-control" id="store_name2" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Before Withdraw</label>
                                    <input type="text" class="form-control" id="amount_before_withdraw2" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Withdraw Amount</label>
                                    <input type="text" class="form-control" id="withdraw_amount2" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Current Balance</label>
                                    <input type="text" class="form-control" id="amount_after_withdraw2" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Payment Method</label>
                                    <input type="text" class="form-control" id="payment_method2" readonly>
                                </div>
                            </div>
                        </div>

                        <div class="row d-none" id="bank_account2">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label>Bank Name</label>
                                    <input type="text" class="form-control" id="bank_name2" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Branch Name</label>
                                    <input type="text" class="form-control" id="branch_name2" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Routing No</label>
                                    <input type="text" class="form-control" id="routing_no2" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Account Holder Name</label>
                                    <input type="text" class="form-control" id="acc_holder_name2" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Account No</label>
                                    <input type="text" class="form-control" id="acc_no2" readonly>
                                </div>
                            </div>
                        </div>

                        <div class="row d-none" id="mobile_account2">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label>MFS Account No</label>
                                    <input type="text" class="form-control" id="mobile_no2" readonly>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label>Transaction ID</label>
                                    <input type="text" class="form-control" id="transaction_id2">
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label>Remarks</label>
                                    <textarea class="form-control" id="remarks2"></textarea>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id="saveBtn" class="btn btn-primary">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection


@section('footer_js')
    {{-- js code for data table --}}
    <script src="{{ url('dataTable') }}/js/jquery.validate.js"></script>
    <script src="{{ url('dataTable') }}/js/jquery.dataTables.min.js"></script>
    <script src="{{ url('dataTable') }}/js/dataTables.bootstrap4.min.js"></script>

    <script type="text/javascript">
        var table = $(".data-table").DataTable({
            processing: true,
            serverSide: true,
            stateSave: true,
            ajax: "{{ url('view/all/withdraws') }}",
            columns: [{
                    data: 'DT_RowIndex',
                    name: 'DT_RowIndex'
                },
                {
                    data: 'business_name',
                    name: 'business_name'
                },
                // {
                //     data: 'store_name',
                //     name: 'store_name'
                // },
                // {
                //     data: 'amount_before_withdraw',
                //     name: 'amount_before_withdraw'
                // },
                {
                    data: 'withdraw_amount',
                    name: 'withdraw_amount'
                },
                {
                    data: 'created_at',
                    name: 'created_at'
                },
                {
                    data: 'payment_method',
                    name: 'payment_method'
                },
                {
                    data: 'bank_name',
                    name: 'bank_name'
                },
                {
                    data: 'acc_no',
                    name: 'acc_no'
                },
                {
                    data: 'mobile_no',
                    name: 'mobile_no'
                },
                {
                    data: 'transaction_id',
                    name: 'transaction_id'
                },
                {
                    data: 'status',
                    name: 'status'
                },
                {
                    data: 'action',
                    name: 'action',
                    orderable: false,
                    searchable: false
                },
            ],
        });
    </script>

    <script>
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('body').on('click', '.viewBtn', function () {
            var id = $(this).data('id');
            $.get("{{ url('get/withdraw/info') }}" +'/' + id, function (data) {
                $('#exampleModal').modal('show');
                $('#vendor_name').val(data.business_name);
                $('#store_name').val(data.store_name);
                var paymentMethod = '';
                if(data.payment_method == 1){
                    paymentMethod = 'Bank';
                } else if(data.payment_method == 2){
                    paymentMethod = 'bKash';
                } else if(data.payment_method == 3){
                    paymentMethod = 'Nagad';
                } else if(data.payment_method == 4){
                    paymentMethod = 'Rocket';
                } else if(data.payment_method == 5){
                    paymentMethod = 'Upay';
                } else {
                    paymentMethod = 'SureCash';
                }

                if(data.payment_method == 1){
                    $("#bank_account").removeClass("d-none");
                    // $("#bank_account").addClass("d-block");

                    $("#mobile_account").removeClass("d-block");
                    $("#mobile_account").addClass("d-none");
                } else {
                    $("#mobile_account").removeClass("d-none");
                    $("#mobile_account").addClass("d-block");

                    $("#bank_account").removeClass("d-block");
                    $("#bank_account").addClass("d-none");
                }

                $('#payment_method').val(paymentMethod);
                $('#withdraw_amount').val(data.withdraw_amount);
                $('#amount_before_withdraw').val(data.amount_before_withdraw);
                $('#amount_after_withdraw').val(data.amount_after_withdraw);
                $('#bank_name').val(data.bank_name);
                $('#branch_name').val(data.branch_name);
                $('#routing_no').val(data.routing_no);
                $('#acc_holder_name').val(data.acc_holder_name);
                $('#acc_no').val(data.acc_no);
                $('#mobile_no').val(data.mobile_no);
                $('#transaction_id').val(data.transaction_id);
                var status = '';
                if(data.status == 0){
                    status = 'Pending';
                } else if(data.status == 1){
                    status = 'Completed';
                } else {
                    status = 'Cancelled';
                }
                $('#status').val(status);
                $('#remarks').val(data.remarks);
            })
        });


        $('body').on('click', '.approveBtn', function () {
            var id = $(this).data('id');
            $.get("{{ url('get/withdraw/info') }}" +'/' + id, function (data) {
                $('#exampleModal2').modal('show');
                $('#withdraw_id2').val(data.id);
                $('#vendor_name2').val(data.business_name);
                $('#store_name2').val(data.store_name);
                var paymentMethod = '';
                if(data.payment_method == 1){
                    paymentMethod = 'Bank';
                } else if(data.payment_method == 2){
                    paymentMethod = 'bKash';
                } else if(data.payment_method == 3){
                    paymentMethod = 'Nagad';
                } else if(data.payment_method == 4){
                    paymentMethod = 'Rocket';
                } else if(data.payment_method == 5){
                    paymentMethod = 'Upay';
                } else {
                    paymentMethod = 'SureCash';
                }

                if(data.payment_method == 1){
                    $("#bank_account2").removeClass("d-none");
                    // $("#bank_account").addClass("d-block");

                    $("#mobile_account2").removeClass("d-block");
                    $("#mobile_account2").addClass("d-none");
                } else {
                    $("#mobile_account2").removeClass("d-none");
                    $("#mobile_account2").addClass("d-block");

                    $("#bank_account2").removeClass("d-block");
                    $("#bank_account2").addClass("d-none");
                }

                $('#payment_method2').val(paymentMethod);
                $('#withdraw_amount2').val(data.withdraw_amount);
                $('#amount_before_withdraw2').val(data.amount_before_withdraw);
                $('#amount_after_withdraw2').val(data.amount_after_withdraw);
                $('#bank_name2').val(data.bank_name);
                $('#branch_name2').val(data.branch_name);
                $('#routing_no2').val(data.routing_no);
                $('#acc_holder_name2').val(data.acc_holder_name);
                $('#acc_no2').val(data.acc_no);
                $('#mobile_no2').val(data.mobile_no);
                $('#transaction_id2').val(data.transaction_id);
                var status = '';
                if(data.status == 0){
                    status = 'Pending';
                } else if(data.status == 1){
                    status = 'Completed';
                } else {
                    status = 'Cancelled';
                }
                $('#status2').val(status);
                $('#remarks2').val(data.remarks);
            })
        });

        $('#saveBtn').click(function (e) {
            e.preventDefault();
            var formData = new FormData();
            formData.append("id", $("#withdraw_id2").val());
            formData.append("transaction_id", $("#transaction_id2").val());
            formData.append("remarks", $("#remarks2").val());

            $(this).html('Saving..');
            $.ajax({
                data: formData,
                url: "{{ url('approve/withdraw') }}",
                type: "POST",
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    $('#saveBtn').html('Save');
                    $('#exampleModal2').modal('hide');
                    table.draw(false);
                    toastr.success("Withdraw Approved Successfully", "Success");
                },
                error: function (data) {
                    console.log('Error:', data);
                    toastr.warning("Something Went Wrong", "Try Again");
                    $('#saveBtn').html('Try Again');
                }
            });
        });

        $('body').on('click', '.deleteBtn', function () {
            var id = $(this).data("id");
            if(confirm("Are You sure want to Delete ?")){
                $.ajax({
                    type: "GET",
                    url: "{{ url('delete/withdraw') }}"+'/'+id,
                    success: function (data) {
                        table.draw(false);
                        toastr.success("Withdraw Deleted Successfully", "Success");
                    },
                    error: function (data) {
                        console.log('Error:', data);
                        toastr.warning("Something Went Wrong", "Try Again");
                    }
                });
            }
        });

        $('body').on('click', '.denyBtn', function () {
            var id = $(this).data("id");
            if(confirm("Are You sure want to Deny ?")){
                $.ajax({
                    type: "GET",
                    url: "{{ url('deny/withdraw') }}"+'/'+id,
                    success: function (data) {
                        table.draw(false);
                        toastr.success("Withdraw is Denied", "Denied");
                    },
                    error: function (data) {
                        console.log('Error:', data);
                        toastr.warning("Something Went Wrong", "Try Again");
                    }
                });
            }
        });
    </script>
@endsection
