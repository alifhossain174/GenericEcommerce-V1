@extends('backend.master')

@section('header_css')
    <link href="{{ url('dataTable') }}/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="{{ url('dataTable') }}/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="{{ url('dataTable') }}/css/buttons.dataTables.min.css" rel="stylesheet">
    <link href="{{ url('assets') }}/plugins/daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css" />
    <link href="{{ url('assets') }}/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet"/>
    <style>
        .dataTables_wrapper .dataTables_paginate .paginate_button{
            padding: 0px;
            border-radius: 4px;
        }
        table.dataTable tbody td:nth-child(1){
            text-align: center !important;
            font-weight: 600;
        }
        table.dataTable tbody td{
            text-align: center !important;
        }
        tfoot {
            display: table-header-group !important;
        }
        tfoot th{
            text-align: center;
        }

        .graph_card{
            position: relative
        }
        .graph_card i{
            position: absolute;
            top: 50%;
            right: 18px;
            font-size: 18px;
            height: 35px;
            width: 35px;
            line-height: 33px;
            text-align: center;
            border-radius: 50%;
            font-weight: 300;
            transform: translateY(-50%);
        }
        .dt-buttons{
            margin-left: 15px;
        }
        button.dt-button{
            padding: 0.3em 1em !important;
        }
        button.buttons-excel, button.buttons-excel:hover{
            background: #008000db !important;
            color: white !important;
            border: 1px solid #129912 !important;
            border-radius: 4px !important;
        }
        button.buttons-pdf, button.buttons-pdf:hover{
            background: #af0000de !important;
            color: white !important;
            border-radius: 4px !important;
            border-color: #ad0000 !important;
        }
        button.buttons-print, button.buttons-print:hover{
            background: #0087bee0 !important;
            color: white !important;
            border-radius: 4px !important;
            border-color: #007eb2 !important;
        }
    </style>
@endsection

@php
    $pageTitle = "All Orders";
    $parameter = "";
    if(isset($request->status)){
        if($request->status == 'pending'){
            $parameter = "pending";
            $pageTitle = "Pending Orders";
        }
        if($request->status == 'approved'){
            $parameter = "approved";
            $pageTitle = "Approved Orders";
        }
        if($request->status == 'intransit'){
            $parameter = "intransit";
            $pageTitle = "InTransit Orders";
        }
        if($request->status == 'delivered'){
            $parameter = "delivered";
            $pageTitle = "Delivered Orders";
        }
        if($request->status == 'cancelled'){
            $parameter = "cancelled";
            $pageTitle = "Cancelled Orders";
        }
    }
@endphp

@section('page_title')
    Orders
@endsection
@section('page_heading')
    View {{$pageTitle}}
@endsection

@section('content')

    <div id="accordion">
        @if($parameter == "")
            @include('backend.orders.order_statistics')
        @endif
        @include('backend.orders.filter_orders')
    </div>

    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">{{$pageTitle}}</h4>
                    <div class="table-responsive">
                        <table class="table table-bordered mb-0 data-table">
                            <thead>
                                <tr>
                                    <th class="text-center">SL</th>
                                    <th class="text-center">Order No</th>
                                    <th class="text-center" style="width: 80px">Order Date</th>
                                    <th class="text-center">From</th>
                                    <th class="text-center">Name</th>
                                    <th class="text-center">Phone</th>
                                    <th class="text-center">Total</th>
                                    <th class="text-center">Payment</th>
                                    <th class="text-center">Status</th>
                                    <th class="text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="6"></th>
                                    <th></th>
                                    <th colspan="3"></th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection


@section('footer_js')

    {{-- js code for data table --}}
    <script src="{{ url('dataTable') }}/js/jquery.validate.js"></script>
    <script src="{{ url('dataTable') }}/js/jquery.dataTables.min.js"></script>
    <script src="{{ url('dataTable') }}/js/dataTables.bootstrap4.min.js"></script>

    <script src="{{ url('assets') }}/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <script src="{{ url('assets') }}/plugins/moment/moment.js"></script>
    <script src="{{ url('assets') }}/plugins/daterangepicker/daterangepicker.js"></script>

    <script src="{{ url('dataTable') }}/js/dataTables.buttons.min.js"></script>
    <script src="{{ url('dataTable') }}/js/jszip.min.js"></script>
    <script src="{{ url('dataTable') }}/js/pdfmake.min.js"></script>
    <script src="{{ url('dataTable') }}/js/vfs_fonts.js"></script>
    <script src="{{ url('dataTable') }}/js/buttons.html5.min.js"></script>
    <script src="{{ url('dataTable') }}/js/buttons.print.min.js"></script>

    <script type="text/javascript">

        // Date Range Picker
        var defaultOptions = {
            "cancelClass": "btn-light",
            "applyButtonClasses": "btn-success"
        };

        // date pickers
        $('[data-toggle="daterangepicker"]').each(function (idx, obj) {
            var objOptions = $.extend({}, defaultOptions, $(obj).data());
            $(obj).daterangepicker(objOptions);
        });

        var start = moment().subtract(29, 'days');
        var end = moment();
        var defaultRangeOptions = {
            startDate: start,
            endDate: end,
            ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            }
        };

        $('[data-toggle="date-picker-range"]').each(function (idx, obj) {
            var objOptions = $.extend({}, defaultRangeOptions, $(obj).data());
            var target = objOptions["targetDisplay"];
            //rendering
            $(obj).daterangepicker(objOptions, function(start, end) {
                if (target)
                    $(target).html(start.format('MMM D, YYYY') + ' - ' + end.format('MMM D, YYYY'));
            });
        });

        const targetNode = document.getElementById("selectedValue");
        const observer = new MutationObserver((mutationsList) => {
            for (const mutation of mutationsList) {
                if (mutation.type === "characterData" || mutation.type === "childList") {
                    filterOrderData();
                }
            }
        });
        observer.observe(targetNode, { childList: true, characterData: true, subtree: true });

        var table = $(".data-table").DataTable({
            processing: true,
            serverSide: true,
            stateSave: true,
            pageLength: 10,
            lengthMenu: [
                [10, 25, 50, 100, -1],
                [10, 25, 50, 100, "All"]
            ],
            ajax: {
                url: "{{ url('view/orders') }}",
                data: function(d) {
                    if("{{$parameter}}" !== ""){
                        d.status = "{{$parameter ?? ''}}";
                    } else {
                        d.order_status = $("#order_status").val();
                    }
                    d.order_no = $("#order_no").val() || "";
                    d.order_from = $("#order_from").val();
                    d.payment_status = $("#payment_status").val();
                    d.customer_name = $("#customer_name").val();
                    d.customer_phone = $("#customer_phone").val();
                    d.purchase_date_range = $("#selectedValue").text();
                    d.delivery_method = $("#delivery_method").val();
                    d.coupon_code = $("#coupon_code").val();
                }
            },
            columns: [
                {
                    data: 'DT_RowIndex',
                    name: 'DT_RowIndex'
                },
                {
                    data: 'order_no',
                    name: 'order_no'
                },
                {
                    data: 'order_date',
                    name: 'order_date'
                },
                {
                    data: 'order_from',
                    name: 'order_from'
                },
                {
                    data: 'customer_name',
                    name: 'customer_name'
                },
                {
                    data: 'customer_phone',
                    name: 'customer_phone'
                },
                {
                    data: 'total',
                    name: 'total'
                },
                {
                    data: 'payment_status',
                    name: 'payment_status'
                },
                {
                    data: 'order_status',
                    name: 'order_status'
                },
                {
                    data: 'action',
                    name: 'action',
                    orderable: false,
                    searchable: false
                },
            ],
            footerCallback: function(row, data, start, end, display) {
                var api = this.api();
                var pageTotal = api.column(6, { page: 'current' }).data().reduce(function(a, b) {
                    return parseFloat(a) + parseFloat(b);
                }, 0);
                $(api.column(6).footer()).html('Page Total: ' + pageTotal.toFixed(2)); // Display page total
            },
            dom: 'lBfrtip', // Include 'l' for length changing input (Show Entries)
            buttons: [
                {
                    extend: 'excelHtml5',
                    title: 'Orders Data',
                    text: '<i class="far fa-file-excel"></i> Excel',
                    exportOptions: {
                        columns: ':visible' // Export only visible columns
                    }
                },
                {
                    extend: 'pdfHtml5',
                    title: 'Orders Data',
                    text: '<i class="far fa-file-pdf"></i> PDF',
                    exportOptions: {
                        columns: ':visible'
                    }
                },
                {
                    extend: 'print',
                    title: 'Orders Data',
                    text: '<i class="fas fa-print"></i> Print',
                    exportOptions: {
                        columns: ':visible'
                    }
                }
            ]
        });
    </script>

    {{-- js code for user crud --}}
    <script>
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        function filterOrderData(){
            table.draw(false);
        }

        function clearFilters(){
            $("#order_no").val("");
            $("#order_from").val("");
            $("#payment_status").val("");
            $("#customer_name").val("");
            $("#customer_phone").val("");
            $("#order_status").val("");
            $("#delivery_method").val("");
            $("#coupon_code").val("");
            $("#selectedValue").text("");
            table.draw(false);
        }

        function orderEditWarning() {
            if (!confirm("Warning! Dont Edit Any Order if it is not Necessary")) {
                return false;
            }
        }

        $('body').on('click', '.cancelBtn', function () {
            var slug = $(this).data("id");
            if(confirm("Are You sure to Cancel !")){
                $.ajax({
                    type: "GET",
                    url: "{{ url('cancel/order') }}"+'/'+slug,
                    success: function (data) {
                        table.draw(false);
                        toastr.error("Order has been Cancelled", "Cancelled Successfully");
                    },
                    error: function (data) {
                        console.log('Error:', data);
                    }
                });
            }
        });

        $('body').on('click', '.approveBtn', function () {
            var slug = $(this).data("id");
            if(confirm("Are You sure to Approve !")){
                $.ajax({
                    type: "GET",
                    url: "{{ url('approve/order') }}"+'/'+slug,
                    success: function (data) {
                        table.draw(false);
                        toastr.success("Order has been Approved", "Approved Successfully");
                    },
                    error: function (data) {
                        console.log('Error:', data);
                    }
                });
            }
        });

        $('body').on('click', '.intransitBtn', function () {
            var slug = $(this).data("id");
            if(confirm("Are You sure to In Transit !")){
                $.ajax({
                    type: "GET",
                    url: "{{ url('intransit/order') }}"+'/'+slug,
                    success: function (data) {
                        table.draw(false);
                        toastr.success("Order has been Approved", "Approved Successfully");
                    },
                    error: function (data) {
                        console.log('Error:', data);
                    }
                });
            }
        });

        $('body').on('click', '.deliveryBtn', function () {
            var slug = $(this).data("id");
            if(confirm("Are You sure to Delivered !")){
                $.ajax({
                    type: "GET",
                    url: "{{ url('deliver/order') }}"+'/'+slug,
                    success: function (data) {
                        table.draw(false);
                        toastr.success("Order has been Delivered", "Delivered Successfully");
                    },
                    error: function (data) {
                        console.log('Error:', data);
                    }
                });
            }
        });

        $('body').on('click', '.deleteBtn', function () {
            var slug = $(this).data("id");
            if(confirm("Are You sure to Delete Order !")){
                $.ajax({
                    type: "GET",
                    url: "{{ url('delete/order') }}"+'/'+slug,
                    success: function (data) {
                        table.draw(false);
                        toastr.error("Order has been Deleted", "Deleted Successfully");
                        //location.reload(true);
                    },
                    error: function (data) {
                        console.log('Error:', data);
                    }
                });
            }
        });
    </script>

@endsection
