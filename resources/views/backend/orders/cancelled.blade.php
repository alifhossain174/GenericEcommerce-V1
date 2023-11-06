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
    View All Cancelled Orders
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">Cancelled Orders</h4>
                    <div class="table-responsive">
                        <table class="table table-bordered mb-0 data-table">
                            <thead>
                                <tr>
                                    <th class="text-center">SL</th>
                                    <th class="text-center">Order No</th>
                                    <th class="text-center">Order Date</th>
                                    <th class="text-center">Payment</th>
                                    <th class="text-center">Status</th>
                                    <th class="text-center">Sub Total</th>
                                    <th class="text-center">Discount</th>
                                    <th class="text-center">Delivery</th>
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
            stateSave: true,
            pageLength: 15,
            lengthMenu: [15, 25, 50, 100],
            ajax: "{{ url('view/cancelled/orders') }}",
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
                {
                    data: 'payment_status',
                    name: 'payment_status'
                },
                {
                    data: 'order_status',
                    name: 'order_status'
                },
                {
                    data: 'sub_total',
                    name: 'sub_total'
                },
                {data: 'discount', name: 'discount'},
                {data: 'delivery_fee', name: 'delivery_fee'},
                {data: 'total', name: 'total'},
                {data: 'action', name: 'action', orderable: false, searchable: false},
            ],
        });
    </script>
@endsection
