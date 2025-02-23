@extends('backend.master')

@section('header_css')
    <link href="{{url('assets')}}/css/jquery.datetimepicker.css" rel="stylesheet" type="text/css" />
    <link href="{{url('assets')}}/plugins/select2/select2.min.css" rel="stylesheet" type="text/css" />
    <style>
        @media print {
            .hidden-print{
                display: none !important;
            }
        }
        .select2-selection{
            height: 34px !important;
            border: 1px solid #ced4da !important;
        }
        .select2 {
            width: 100% !important;
        }
    </style>
@endsection

@section('page_title')
    Report
@endsection
@section('page_heading')
    Stock Report
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">Stock Report Criteria</h4>

                    <form class="needs-validation row">
                        <div class="form-group col">
                            <label for="category_id">Category</label>
                            <select class="form-control" data-toggle="select2" id="category_id">
                                @php
                                    echo App\Models\Category::getDropDownList('name');
                                @endphp
                            </select>
                        </div>
                        <div class="form-group col">
                            <label for="product_code">Product Code</label>
                            <input type="text" class="form-control" id="product_code" placeholder="e.g. YUYADSGUDF45">
                        </div>
                        <div class="form-group col">
                            <label for="product_status">Product Status</label>
                            <select id="product_status" data-toggle="select2" class="form-control">
                                <option value="">Select Status</option>
                                <option value="1">Active</option>
                                <option value="0">Inactive</option>
                            </select>
                        </div>
                        <div class="form-group col">
                            <label for="min_stock">Min Stock</label>
                            <input type="number" class="form-control" id="min_stock">
                        </div>
                        <div class="form-group col">
                            <label for="max_stock">Max Stock</label>
                            <input type="number" class="form-control" id="max_stock">
                        </div>
                        <div class="form-group col-lg-12 text-right">
                            <button type="button" onclick="generateReport()" class="btn btn-primary" id="generate_stock_report_btn"><i class="feather-refresh-ccw "></i> Generate Report</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 col-xl-12" id="report_view_section">

        </div>
    </div>
@endsection


@section('footer_js')
    <script src="{{url('assets')}}/js/jquery.datetimepicker.full.min.js"></script>
    <script src="{{url('assets')}}/plugins/select2/select2.min.js"></script>
    <script>

        $('[data-toggle="select2"]').select2();

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        function generateReport(){

            $("#generate_stock_report_btn").html("Generating...");
            var category_id = $("#category_id").val();
            var product_code = $("#product_code").val();
            var product_status = $("#product_status").val();
            var min_stock = $("#min_stock").val();
            var max_stock = $("#max_stock").val();

            $.ajax({
                data: {
                    category_id: category_id,
                    product_code: product_code,
                    product_status: product_status,
                    min_stock: min_stock,
                    max_stock: max_stock
                },
                url: "{{ url('generate/stock/report') }}",
                type: "POST",
                dataType: 'json',
                success: function(data) {
                    $("#report_view_section").html(data.report);
                    $("#generate_stock_report_btn").html("<i class='feather-refresh-ccw'></i> Generate Report");
                    toastr.success('Report Generated Successfully');
                },
                error: function(data) {
                    console.log('Error:', data);
                    toastr.error('Something went wrong');
                    $("#generate_stock_report_btn").html("<i class='feather-refresh-ccw'></i> Generate Report");
                }
            });
        }

        function printPageArea(areaID){
            var printContent = document.getElementById(areaID).innerHTML;
            var originalContent = document.body.innerHTML;
            document.body.innerHTML = printContent;
            window.print();
            document.body.innerHTML = originalContent;
        }
    </script>
@endsection
