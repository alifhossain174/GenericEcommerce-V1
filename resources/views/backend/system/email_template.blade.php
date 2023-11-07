@extends('backend.master')

@section('header_css')
    <link href="{{url('assets')}}/plugins/switchery/switchery.min.css" rel="stylesheet" type="text/css" />
    <style>
        .mail_template{
            height: 220px;
            overflow: hidden;
            position: relative;
            border-radius: 4px;
        }
        .gallery-img::before {
            position: absolute;
            content: "";
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            background: linear-gradient( 180deg, rgba(44, 51, 51, 0) 0%, rgba(44, 51, 51, 0) 48.75%, #20262e 100% );
            border-radius: 8px;
            z-index: 1;
        }
        .image-view-btn {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 36px;
            height: 36px;
            background: var(--secondary-color);
            border-radius: 100%;
            text-align: center;
            line-height: 40px;
            color: var(--white-color);
            font-size: 18px;
            z-index: 2;
            opacity: 0;
            visibility: hidden;
        }
    </style>
@endsection

@section('page_title')
    Email
@endsection

@section('page_heading')
    Email Templates
@endsection

@section('content')

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">Choose Your Default Order Placed Mail Templates</h4>
                    <div class="row">
                        <div class="col-lg-3 col-xl-3">
                            <div class="card" style="height: 300px; border: 2px solid green; box-shadow: 2px 2px 5px #b5b5b5; overflow:hidden">
                                <div class="card-body">
                                    <h4 class="card-title mb-3">
                                        <div class="row">
                                            <div class="col-lg-8"><i class="feather-mail" style="color: green"></i> Simplee</div>
                                            <div class="col-lg-4 text-right">
                                                <input type="checkbox" class="switchery_checkbox" id="ssl_commerz" value="ssl_commerz" onchange="changeGatewayStatus(this.value)" name="has_variant" data-size="small" data-toggle="switchery" data-color="#53c024" data-secondary-color="#df3554"/>
                                            </div>
                                        </div>
                                    </h4>
                                    <div class="row">
                                        <div class="col-lg-12 text-center">
                                            <div class="mail_template">
                                                {{-- <img src="{{url('email_templates')}}/order_successfull_1.png" class="img-fluid"> --}}
                                                {{-- <a class="venobox vbox-item" data-gall="gallery01" href="{{url('email_templates')}}/order_successfull_1.png"><i class="fas fa-eye" aria-hidden="true"></i></a>
                                                <div class="mail_template_overlay">

                                                </div> --}}
                                                <div class="gallery-img">
                                                    <img src="{{url('email_templates')}}/order_successfull_1.png" class="img-fluid">
                                                    <a href="https://bangla-eschool.getupdemo.xyz/storage/files/1/Gallery/img-1.png" data-fancybox="photo" class="image-view-btn"><i class="fi fi-ss-eye"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-xl-3">
                            <div class="card" style="box-shadow: 2px 2px 5px #b5b5b5;">
                                <div class="card-body">
                                    <h4 class="card-title mb-3">
                                        <div class="row">
                                            <div class="col-lg-8"><i class="feather-mail"></i> Complexo</div>
                                            <div class="col-lg-4 text-right">
                                                <input type="checkbox" class="switchery_checkbox" id="ssl_commerz" value="ssl_commerz" onchange="changeGatewayStatus(this.value)" name="has_variant" data-size="small" data-toggle="switchery" data-color="#53c024" data-secondary-color="#df3554"/>
                                            </div>
                                        </div>
                                    </h4>
                                    <div class="row">
                                        <div class="col-lg-12 text-center">
                                            <img src="{{url('email_templates')}}/order_successfull_1.png" class="img-fluid">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>


@endsection


@section('footer_js')
    <script src="{{url('assets')}}/plugins/switchery/switchery.min.js"></script>
    <script>
        $('[data-toggle="switchery"]').each(function (idx, obj) {
            new Switchery($(this)[0], $(this).data());
        });

        function changeGatewayStatus(value){
            var provider = value;
            $.ajax({
                type: "GET",
                url: "{{ url('change/email/template/status') }}"+'/'+provider,
                success: function (data) {
                    toastr.success("Status Changed", "Updated Successfully");
                    setTimeout(function() {
                        console.log("Wait For 1 Sec");
                        location.reload(true);
                    }, 1000);
                },
                error: function (data) {
                    console.log('Error:', data);
                }
            });
        }
    </script>
@endsection
