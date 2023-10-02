<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta content="" name="description" />
        <meta content="MyraStudio" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <!-- App favicon -->
        <link rel="shortcut icon" href="{{url('assets')}}/images/favicon.ico">

        <!-- App css -->
        <link href="{{url('assets')}}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="{{url('assets')}}/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="{{url('assets')}}/css/theme.min.css" rel="stylesheet" type="text/css" />

        @yield('header_css')

    </head>

    <body>

        <div style="background: #3D7EAA; background: -webkit-linear-gradient(to right, #FFE47A, #3D7EAA); background: linear-gradient(to right, #FFE47A, #3D7EAA);">
            <div class="container">

                <div class="row">
                    <div class="col-12">
                        <div class="d-flex align-items-center min-vh-100">
                            <div class="w-100 d-block bg-white shadow-lg rounded my-5">


                                @yield('content')



                            </div> <!-- end .w-100 -->
                        </div> <!-- end .d-flex -->
                    </div> <!-- end col-->
                </div> <!-- end row -->

            </div>
            <!-- end container -->
        </div>
        <!-- end page -->

        <!-- jQuery  -->
        <script src="{{url('assets')}}/js/jquery.min.js"></script>
        <script src="{{url('assets')}}/js/bootstrap.bundle.min.js"></script>
        <script src="{{url('assets')}}/js/metismenu.min.js"></script>
        <script src="{{url('assets')}}/js/waves.js"></script>
        <script src="{{url('assets')}}/js/simplebar.min.js"></script>

        <!-- App js -->
        <script src="{{url('assets')}}/js/theme.js"></script>

    </body>

</html>
