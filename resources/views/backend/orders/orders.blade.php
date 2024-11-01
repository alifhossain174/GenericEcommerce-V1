@extends('backend.master')

@section('header_css')
    <link href="{{ url('dataTable') }}/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="{{ url('dataTable') }}/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.2.2/css/buttons.dataTables.min.css">
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

@section('page_title')
    Orders
@endsection
@section('page_heading')
    View All Orders
@endsection

@section('content')

    <div id="accordion">
        @include('backend.orders.order_statistics')
        @include('backend.orders.filter_orders')
    </div>

    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">All Orders</h4>
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
                                    <th colspan="2"></th>
                                    <th></th>
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


    <!-- DataTables Buttons JS -->
    <script src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js"></script>
    <!-- JSZip (for Excel export) -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <!-- PDFMake (for PDF export, optional) -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <!-- Buttons for Excel and PDF -->
    <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.flash.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.print.min.js"></script>


    <script type="text/javascript">
        let grandTotal = 0;
        var table = $(".data-table").DataTable({
            processing: true,
            serverSide: true,
            pageLength: 10,
            lengthMenu: [
                [10, 25, 50, 100, -1], // Values for entries to show
                [10, 25, 50, 100, "All"] // Corresponding display options
            ],
            ajax: "{{ url('view/orders') }}",
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
                {data: 'order_from', name: 'order_from'},
                {data: 'customer_name', name: 'customer_name'},
                {data: 'customer_phone', name: 'customer_phone'},
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
                {data: 'action', name: 'action', orderable: false, searchable: false},
            ],
            footerCallback: function(row, data, start, end, display) {
                var api = this.api();

                // Calculate the page total for the current page
                var pageTotal = api.column(6, { page: 'current' }).data().reduce(function(a, b) {
                    return parseFloat(a) + parseFloat(b);
                }, 0);

                // Update the footer
                $(api.column(6).footer()).html('Page Total: ' + pageTotal.toFixed(2)); // Display page total
                // $(api.column(7).footer()).html('Grand Total: ' + $(row).data('grand-total').toFixed(2)); // Display grand total from server
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
