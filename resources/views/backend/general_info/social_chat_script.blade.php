@extends('backend.master')

@section('page_title')
    Website Config
@endsection
@section('page_heading')
    Social Login & Chat Scripts
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3">Social Login & Chat Scripts</h4>
                    <p class="card-subtitle mb-4">Manage all your Social Login Scripts and Third Party Chat API</p>

                    <div class="row">
                        <div class="col-sm-3 mb-2 mb-sm-0">
                            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                <a class="nav-link active show" id="v-pills-gr-tab" data-toggle="pill" href="#v-pills-gr" role="tab" aria-controls="v-pills-gr"
                                    aria-selected="true">
                                    <i class="mdi mdi-home-variant d-lg-none d-block"></i>
                                    <span class="d-none d-lg-block">Google Recaptcha</span>
                                </a>
                                <a class="nav-link" id="v-pills-ga-tab" data-toggle="pill" href="#v-pills-ga" role="tab" aria-controls="v-pills-ga"
                                    aria-selected="false">
                                    <i class="mdi mdi-settings-outline d-lg-none d-block"></i>
                                    <span class="d-none d-lg-block">Google Analytics</span>
                                </a>
                                <a class="nav-link" id="v-pills-sl-tab" data-toggle="pill" href="#v-pills-sl" role="tab" aria-controls="v-pills-sl"
                                    aria-selected="false">
                                    <i class="mdi mdi-settings-outline d-lg-none d-block"></i>
                                    <span class="d-none d-lg-block">Social Login</span>
                                </a>
                                <a class="nav-link" id="v-pills-tawk-tab" data-toggle="pill" href="#v-pills-tawk" role="tab" aria-controls="v-pills-tawk"
                                    aria-selected="false">
                                    <i class="mdi mdi-account-circle d-lg-none d-block"></i>
                                    <span class="d-none d-lg-block">Tawk Chat</span>
                                </a>
                                <a class="nav-link" id="v-pills-crisp-tab" data-toggle="pill" href="#v-pills-crisp" role="tab" aria-controls="v-pills-crisp"
                                    aria-selected="false">
                                    <i class="mdi mdi-settings-outline d-lg-none d-block"></i>
                                    <span class="d-none d-lg-block">Crisp Chat</span>
                                </a>
                            </div>
                        </div> <!-- end col-->

                        <div class="col-sm-9">
                            <div class="tab-content" id="v-pills-tabContent">
                                <div class="tab-pane fade active show" id="v-pills-gr" role="tabpanel" aria-labelledby="v-pills-gr-tab">
                                    <p class="mb-0">Google Recaptcha ad ut irure tempor velit nostrud occaecat ullamco aliqua anim Leggings sint. Veniam sint duis incididunt
                                        do esse magna mollit excepteur laborum qui. Id id reprehenderit sit est eu aliqua occaecat quis et velit
                                        excepteur laborum mollit dolore eiusmod. Ipsum dolor in occaecat commodo et voluptate minim reprehenderit
                                        mollit pariatur. Deserunt non laborum enim et cillum eu deserunt excepteur ea incididunt minim occaecat.</p>
                                </div>
                                <div class="tab-pane fade" id="v-pills-ga" role="tabpanel" aria-labelledby="v-pills-ga-tab">
                                    <p class="mb-0">Google Analytics ad ut irure tempor velit nostrud occaecat ullamco aliqua anim Leggings sint. Veniam sint duis incididunt
                                        do esse magna mollit excepteur laborum qui. Id id reprehenderit sit est eu aliqua occaecat quis et velit
                                        excepteur laborum mollit dolore eiusmod. Ipsum dolor in occaecat commodo et voluptate minim reprehenderit
                                        mollit pariatur. Deserunt non laborum enim et cillum eu deserunt excepteur ea incididunt minim occaecat.</p>
                                </div>
                                <div class="tab-pane fade" id="v-pills-sl" role="tabpanel" aria-labelledby="v-pills-sl-tab">
                                    <p class="mb-0">Social Login ad ut irure tempor velit nostrud occaecat ullamco aliqua anim Leggings sint. Veniam sint duis incididunt
                                        do esse magna mollit excepteur laborum qui. Id id reprehenderit sit est eu aliqua occaecat quis et velit
                                        excepteur laborum mollit dolore eiusmod. Ipsum dolor in occaecat commodo et voluptate minim reprehenderit
                                        mollit pariatur. Deserunt non laborum enim et cillum eu deserunt excepteur ea incididunt minim occaecat.</p>
                                </div>
                                <div class="tab-pane fade" id="v-pills-tawk" role="tabpanel" aria-labelledby="v-pills-tawk-tab">
                                    <p class="mb-0">Tawk Chat dolor voluptate do laboris laboris irure reprehenderit id incididunt duis pariatur mollit aute magna
                                        pariatur consectetur. Eu veniam duis non ut dolor deserunt commodo et minim in quis laboris ipsum velit
                                        id veniam. Quis ut consectetur adipisicing officia excepteur non sit. Ut et elit aliquip labore Leggings
                                        enim eu. Ullamco mollit occaecat dolore ipsum id officia mollit qui esse anim eiusmod do sint minim consectetur
                                        qui.</p>
                                </div>
                                <div class="tab-pane fade" id="v-pills-crisp" role="tabpanel" aria-labelledby="v-pills-crisp-tab">
                                    <p class="mb-0">Crisp Chat truck quinoa dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis
                                        natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque
                                        eu, pretium quis, sem. Nulla consequat massa quis enim. Cillum ad ut irure tempor velit nostrud occaecat ullamco
                                        aliqua anim Leggings sint. Veniam sint duis incididunt do esse magna mollit excepteur laborum qui.</p>
                                </div>
                            </div> <!-- end tab-content-->
                        </div> <!-- end col-->
                    </div>

                </div>
            </div>
        </div>
    </div>
@endsection

