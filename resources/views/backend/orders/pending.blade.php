@extends('backend.master')

@section('header_css')
    <link href="{{ url('dataTable') }}/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="{{ url('dataTable') }}/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <style>
        .dataTables_wrapper .dataTables_paginate .paginate_button{
            padding: 0px;
            border-radius: 4px;
        }
        table.dataTable tbody td:nth-child(1){
            text-align: center !important;
            font-weight: 600;
        }
        table.dataTable tbody td:nth-child(2){
            text-align: center !important;
        }
        table.dataTable tbody td:nth-child(3){
            text-align: center !important;
        }
        table.dataTable tbody td:nth-child(4){
            text-align: center !important;
        }
        table.dataTable tbody td:nth-child(5){
            text-align: center !important;
        }
        table.dataTable tbody td:nth-child(6){
            text-align: center !important;
            min-width: 100px !important;
        }
        table.dataTable tbody td:nth-child(7){
            text-align: center !important;
            min-width: 80px !important;
        }
        table.dataTable tbody td:nth-child(8){
            text-align: center !important;
            min-width: 80px !important;
        }
        table.dataTable tbody td:nth-child(9){
            text-align: center !important;
            min-width: 80px !important;
        }
        table.dataTable tbody td:nth-child(10){
            text-align: center !important;
            min-width: 100px !important;
        }
        tfoot {
            display: table-header-group !important;
        }
        tfoot th{
            text-align: center;
        }

    </style>
@endsection

@section('page_title')
    Orders
@endsection
@section('page_heading')
    View All Pending Orders
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">Pending Orders</h4>
                    <div class="table-responsive">
                        <table class="table table-bordered mb-0 data-table">
                            <thead>
                                <tr>
                                    <th class="text-center">SL</th>
                                    <th class="text-center">Order No</th>
                                    <th class="text-center" style="min-width: 120px !important;">Order Date</th>
                                    <th class="text-center">Name</th>
                                    <th class="text-center">Email</th>
                                    <th class="text-center">Phone</th>
                                    <th class="text-center">Status</th>
                                    <th class="text-center">Payment</th>
                                    <th class="text-center">Total</th>
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
            pageLength: 15,
            ajax: "{{ url('view/pending/orders') }}",
            columns: [
                {
                    data: 'DT_RowIndex',
                    name: 'DT_RowIndex'
                },
                {
                    data: 'order_no',
                    name: 'order_no'
                }, //orderable: true, searchable: true
                {
                    data: 'order_date',
                    name: 'order_date'
                },
                {data: 'customer_name', name: 'customer_name'},
                {data: 'customer_email', name: 'customer_email'},
                {data: 'customer_phone', name: 'customer_phone'},
                {
                    data: 'order_status',
                    name: 'order_status'
                },
                {
                    data: 'payment_status',
                    name: 'payment_status'
                },
                {data: 'total', name: 'total'},
                {data: 'action', name: 'action', orderable: false, searchable: false},
            ],
        });
    </script>

    {{-- js code for user crud --}}
    <script>
        function orderEditWarning(){
            if(!confirm("Warning! Dont Edit Any Order if it is not Necessary")){
                return false;
            }
        }

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('body').on('click', '.cancelBtn', function () {
            var slug = $(this).data("id");
            if(confirm("Are You sure to Cancel !")){
                $.ajax({
                    type: "GET",
                    url: "{{ url('cancel/order') }}"+'/'+slug,
                    success: function (data) {
                        table.draw();
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
                        table.draw();
                        toastr.success("Order has been Approved", "Approved Successfully");
                    },
                    error: function (data) {
                        console.log('Error:', data);
                    }
                });
            }
        });
    </script>
@endsection
