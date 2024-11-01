
<div class="card mb-1">
    <div class="card-header bg-white border-bottom-0 collapsed" style="cursor: pointer;" id="headingOne" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        <a href="javascript:void(0)" style="position: relative;" class="d-block text-dark font-size-15">
            <i class="fas fa-chart-line"></i> Total Order Statistics
            <span style="position: absolute; top: 50%; transform:translateY(-50%); right: 20px">&#8595;</span>
        </a>
    </div>
    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
        <div class="row pt-1 pl-3 pr-3">
            <div class="col-lg-6 col-xl-3">
                <div class="card graph_card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col">
                                <h6 class="text-uppercase font-size-12 text-muted">Total Pending Orders</h6>
                                <span class="h4 mb-0">
                                    ৳ {{ number_format(DB::table('orders')->where('order_status', 0)->sum('total'), 2) }}
                                </span>
                            </div>
                        </div>
                        <div id="sparkline1"></div>
                    </div>
                    <i class="feather-shopping-cart" style="color: #c28a00; background: #daa5202e;"></i>
                </div>
            </div>

            <div class="col-lg-6 col-xl-3">
                <div class="card graph_card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col">
                                <h6 class="text-uppercase font-size-12 text-muted">Total Approved Orders</h6>
                                <span class="h4 mb-0">
                                    ৳ {{ number_format(DB::table('orders')->where('order_status', 1)->orWhere('order_status', 2)->sum('total'), 2) }}
                                </span>
                            </div>
                        </div>
                        <div id="sparkline2"></div>
                    </div>
                    <i class="feather-trending-up" style="color: #0074E4; background: #0074E42E;"></i>
                </div>
            </div>

            <div class="col-lg-6 col-xl-3">
                <div class="card graph_card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col">
                                <h6 class="text-uppercase font-size-12 text-muted">Total Delivered Orders</h6>
                                <span class="h4 mb-0">
                                    ৳ {{ number_format(DB::table('orders')->where('order_status', 3)->sum('total'), 2) }}
                                </span>
                            </div>
                        </div>

                        <div id="sparkline3"></div>
                    </div>
                    <i class="feather-package" style="color: #027e02; background: #027e0238;"></i>
                </div>
            </div>

            <div class="col-lg-6 col-xl-3">
                <div class="card graph_card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col">
                                <h6 class="text-uppercase font-size-12 text-muted">Total Cancelled Orders</h6>
                                <span class="h4 mb-0">
                                    ৳ {{ number_format(DB::table('orders')->where('order_status', 4)->sum('total'), 2) }}
                                </span>
                            </div>
                        </div>

                        <div id="sparkline4"></div>
                    </div>
                    <i class="feather-trash-2" style="color: #a60000; background: #a6000026;"></i>
                </div>
            </div>
        </div>
    </div>
</div>


