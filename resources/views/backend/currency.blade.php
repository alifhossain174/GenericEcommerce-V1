@extends('backend.master')

@section('header_css')
    <link href="{{ url('dataTable') }}/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="{{ url('dataTable') }}/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="{{ url('assets') }}/plugins/select2/select2.min.css" rel="stylesheet" type="text/css" />
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

        tfoot {
            display: table-header-group !important;
        }

        tfoot th {
            text-align: center;
        }

        .select2-selection {
            height: 34px !important;
            border: 1px solid #ced4da !important;
        }

        .select2 {
            width: 100% !important;
        }
    </style>
@endsection

@section('page_title')
    Currency
@endsection
@section('page_heading')
    View All Currencies
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">Currency List</h4>
                    <div class="table-responsive">

                        <label id="customFilter">
                            <button class="btn btn-success btn-sm" id="addCurrency" style="margin-left: 5px"><b><i
                                        class="feather-plus"></i> Add Currency</b></button>
                        </label>

                        <table class="table table-bordered mb-0 data-table">
                            <thead>
                                <tr>
                                    <th class="text-center">SL</th>
                                    <th class="text-center">Currency Name</th>
                                    <th class="text-center">Code</th>
                                    <th class="text-center">Symbol</th>
                                    <th class="text-center">Exchange Rate</th>
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


    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form id="productForm" name="productForm" class="form-horizontal">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Edit Currency</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="id" id="id">

                        <div class="form-group">
                            <label> Currency Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>

                        <div class="form-group">
                            <label> Currency Code <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="code" name="code" required>
                        </div>

                        <div class="form-group">
                            <label> Symbol <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="symbol" name="symbol" required>
                        </div>

                        <div class="form-group">
                            <label> Exchange Rate <span class="text-danger">*</span></label>
                            <input type="number" step="0.000001" class="form-control" id="exchange_rate"
                                name="exchange_rate" required>
                        </div>

                        <div class="form-group">
                            <label> Status <span class="text-danger">*</span></label>
                            <select class="form-control" id="status" name="status" required>
                                <option value="1">Active</option>
                                <option value="0">Inactive</option>
                            </select>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id="updateBtn" class="btn btn-primary">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form id="productForm2" name="productForm2" class="form-horizontal">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel2">Add New Currency</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label> Currency Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" name="name" required>
                        </div>
                        <div class="form-group">
                            <label> Currency Code <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" name="code" required>
                        </div>
                        <div class="form-group">
                            <label> Symbol <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" name="symbol" required>
                        </div>
                        <div class="form-group">
                            <label> Exchange Rate <span class="text-danger">*</span></label>
                            <input type="number" step="0.000001" class="form-control" name="exchange_rate" required>
                        </div>

                        <input type="number" hidden class="form-control" name="status" value="0" required>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id="saveBtn" class="btn btn-primary">Save Now</button>
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
    <script src="{{ url('assets') }}/plugins/select2/select2.min.js"></script>

    <script type="text/javascript">
        $('[data-toggle="select2"]').select2();

        var table = $(".data-table").DataTable({
            processing: true,
            serverSide: true,
            pageLength: 15,
            stateSave: true,
            lengthMenu: [15, 25, 50, 100],

            ajax: "{{ url('view/currency') }}",
            columns: [{
                    data: 'DT_RowIndex',
                    name: 'DT_RowIndex'
                },
                {
                    data: 'name',
                    name: 'name'
                },
                {
                    data: 'code',
                    name: 'code'
                },
                {
                    data: 'symbol',
                    name: 'symbol'
                },
                {
                    data: 'exchange_rate',
                    name: 'exchange_rate'
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
            ]
        });
        $(".dataTables_filter").append($("#customFilter"));
    </script>

    {{-- js code for currency crud --}}
    <script>
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('#addCurrency').click(function() {
            $('#productForm2').trigger("reset");
            $('#exampleModal2').modal('show');
        });

        $('#saveBtn').click(function(e) {
            e.preventDefault();
            $(this).html('Saving..');
            $.ajax({
                data: $('#productForm2').serialize(),
                url: "{{ url('save/new/currency') }}",
                type: "POST",
                dataType: 'json',
                success: function(data) {
                    $('#saveBtn').html('Save Now');
                    $('#productForm2').trigger("reset");
                    $('#exampleModal2').modal('hide');
                    toastr.success("New Currency Added", "Added Successfully");
                    table.draw(false);
                },
                error: function(data) {
                    console.log('Error:', data);
                    $('#saveBtn').html('Save');
                }
            });
        });

        $('body').on('click', '.editBtn', function() {
            var id = $(this).data('id');
            $.get("{{ url('get/currency/info') }}" + '/' + id, function(data) {
                $('#exampleModal').modal('show');
                $('#id').val(id);
                $('#name').val(data.name);
                $('#code').val(data.code);
                $('#symbol').val(data.symbol);
                $('#exchange_rate').val(data.exchange_rate);
                $('#status').val(data.status);
            })
        });

        $('#updateBtn').click(function(e) {
            e.preventDefault();
            $(this).html('Updating...');
            $.ajax({
                data: $('#productForm').serialize(),
                url: "{{ url('update/currency/info') }}",
                type: "POST",
                dataType: 'json',
                success: function(data) {
                    $('#updateBtn').html('Save');
                    $('#productForm').trigger("reset");
                    $('#exampleModal').modal('hide');
                    toastr.success("Currency Updated", "Updated Successfully");
                    table.draw(false);
                },
                error: function(data) {
                    console.log('Error:', data);
                    toastr.warning("Ops!!", "Something Went Wrong");
                    $('#updateBtn').html('Try Again');
                }
            });
        });

        $('body').on('click', '.deleteBtn', function() {
            var id = $(this).data("id");
            if (confirm("Are You sure want to delete !")) {
                $.ajax({
                    type: "GET",
                    url: "{{ url('delete/currency') }}" + '/' + id,
                    success: function(data) {
                        table.draw(false);
                        toastr.error("Currency has been Deleted", "Deleted Successfully");
                    },
                    error: function(data) {
                        console.log('Error:', data);
                    }
                });
            }
        });
    </script>
@endsection
