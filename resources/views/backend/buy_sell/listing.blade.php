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

    </style>
@endsection

@section('page_title')
    BuySell Listing
@endsection
@section('page_heading')
    View All Listing
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">BuySell Listing</h4>
                    <div class="table-responsive">

                        <table class="table table-bordered mb-0 data-table">
                            <thead>
                                <tr>
                                    <th class="text-center">SL</th>
                                    <th class="text-center">Category</th>
                                    <th class="text-center">Image</th>
                                    <th class="text-center">Title</th>
                                    <th class="text-center">Price</th>
                                    <th class="text-center">Dis. Price</th>
                                    <th class="text-center">Phone</th>
                                    <th class="text-center">Posted By</th>
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
            ajax: "{{ url('buy/sell/listing') }}",
            columns: [
                {
                    data: 'DT_RowIndex',
                    name: 'DT_RowIndex'
                },
                {data: 'category_name', name: 'category_name'},
                {
                    data: 'image',
                    name: 'image',
                    render: function( data, type, full, meta ) {
                        if(data){
                            return "<img src=\"/" + data + "\" width=\"50\"/>";
                        } else {
                            return '';
                        }
                    }
                },
                {
                    data: 'product_title',
                    name: 'product_title'
                }, //orderable: true, searchable: true
                {data: 'regular_price', name: 'regular_price'},
                {data: 'discount_price', name: 'discount_price'},
                {data: 'phone', name: 'phone'},
                {data: 'user_name', name: 'user_name'},
                {data: 'status', name: 'status'},
                {data: 'action', name: 'action', orderable: false, searchable: false},
            ]
        });

        $(".dataTables_filter").append($("#customFilter"));
    </script>

    {{-- js code for user crud --}}
    <script>
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('body').on('click', '.deleteBtn', function () {
            var slug = $(this).data("id");
            if(confirm("Are You sure want to delete !")){
                $.ajax({
                    type: "GET",
                    url: "{{ url('delete/buy/sell/listing') }}"+'/'+slug,
                    success: function (data) {
                        table.draw(false);
                        toastr.error("Data has been Deleted", "Deleted Successfully");
                    },
                    error: function (data) {
                        console.log('Error:', data);
                    }
                });
            }
        });

        $('body').on('click', '.approveBtn', function () {
            var slug = $(this).data("id");
            if(confirm("Are You sure want to Approve !")){
                $.ajax({
                    type: "GET",
                    url: "{{ url('approve/buy/sell/listing') }}"+'/'+slug,
                    success: function (data) {
                        table.draw(false);
                        toastr.success("Data has been Approved", "Approved Successfully");
                    },
                    error: function (data) {
                        console.log('Error:', data);
                    }
                });
            }
        });

        $('body').on('click', '.denyBtn', function () {
            var slug = $(this).data("id");
            if(confirm("Are You sure want to Approve !")){
                $.ajax({
                    type: "GET",
                    url: "{{ url('deny/buy/sell/listing') }}"+'/'+slug,
                    success: function (data) {
                        table.draw(false);
                        toastr.error("Data has been Denied", "Denied Successfully");
                    },
                    error: function (data) {
                        console.log('Error:', data);
                    }
                });
            }
        });
    </script>
@endsection
