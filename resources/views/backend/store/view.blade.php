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

        table#DataTables_Table_0 img{
            transition: all .2s linear;
        }
        img.gridProductImage:hover{
            scale: 2;
            cursor: pointer;
        }

    </style>
@endsection

@section('page_title')
    Stores
@endsection
@section('page_heading')
    View All Stores
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">Store List</h4>
                    <div class="table-responsive">
                        <table class="table table-bordered mb-0 data-table">
                            <thead>
                                <tr>
                                    <th class="text-center">SL</th>
                                    <th class="text-center">Store Logo</th>
                                    <th class="text-center">Store Name</th>
                                    <th class="text-center">Business Name</th>
                                    <th class="text-center">Total Products</th>
                                    <th class="text-center">Total Earnings</th>
                                    <th class="text-center">Comission</th>
                                    <th class="text-center">Status</th>
                                    <th class="text-center">Created At</th>
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
            ajax: "{{ url('view/all/stores') }}",
            columns: [
                {
                    data: 'DT_RowIndex',
                    name: 'DT_RowIndex'
                },
                {
                    data: 'store_logo',
                    name: 'store_logo',
                    render: function( data, type, full, meta ) {
                        if(data){
                            return "<img class=\"gridProductImage\" src=\"/" + data + "\" width=\"40\"/>";
                        } else {
                            return '';
                        }
                    }
                },
                {data: 'store_name', name: 'store_name'},
                {data: 'business_name', name: 'business_name'},
                {data: 'total_products', name: 'total_products'},
                {data: 'total_earnings', name: 'total_earnings'},
                {data: 'store_percentage', name: 'store_percentage'},
                {data: 'status', name: 'status'},
                {data: 'created_at', name: 'created_at'},
                {data: 'action', name: 'action', orderable: false, searchable: false},
            ],
        });
        $("#DataTables_Table_0_length").append($("#customFilter"));
    </script>

    <script>
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('body').on('click', '.inactiveBtn', function () {
            var id = $(this).data("id");
            if(confirm("Are You sure want to Inactive ?")){
                $.ajax({
                    type: "GET",
                    url: "{{ url('inactive/store') }}"+'/'+id,
                    success: function (data) {
                        table.draw(false);
                        toastr.success("Store is Inactive Now", "Success");
                    },
                    error: function (data) {
                        console.log('Error:', data);
                        toastr.warning("Something Went Wrong", "Try Again");
                    }
                });
            }
        });

        $('body').on('click', '.activeBtn', function () {
            var id = $(this).data("id");
            if(confirm("Are You sure want to Activate ?")){
                $.ajax({
                    type: "GET",
                    url: "{{ url('activate/store') }}"+'/'+id,
                    success: function (data) {
                        table.draw(false);
                        toastr.success("Store is Live Now", "Success");
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
