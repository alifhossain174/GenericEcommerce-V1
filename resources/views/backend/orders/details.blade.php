@extends('backend.master')

@section('page_title')
    Orders
@endsection
@section('page_heading')
    Orders Details
@endsection
@section('header_css')
    <style>
        @media print {
            .hidden-print {
                display: none !important;
            }
        }

        table tbody tr td {
            padding: 5px 10px !important
        }

        table thead tr th {
            padding: 5px 10px !important
        }

        address {
            font-size: 15px;
        }

        address h6 {
            font-size: 15px;
        }

        .order_details_text p {
            font-size: 15px;
        }

        /* Invoice Action  */
        .invoice-action-card .card-title {
            font-size: 20px;
            font-weight: 600;
            position: relative;
            margin-bottom: 16px;
        }

        .invoice-action-card .card {
            border-radius: 4px !important;
            margin-bottom: 12px !important;
            border: 1px solid #DEE2E6 !important;
        }

        .invoice-action-card .card-header {
            padding: 0;
            background-color: transparent;
            border: none;
            border-radius: 0 !important;
        }

        .invoice-action-card .btn-link {
            color: #000;
            display: block;
            width: 100%;
            text-align: left;
            padding: 12px;
            border: 1px solid #DEE2E6;
            background: #f5f5f5;
            border: none;
            text-decoration: initial !important;
        }

        .invoice-action-card .btn-link span {
            display: flex;
            align-items: center;
            gap: 12px;
            font-weight: 600;
            color: #132843;
        }

        .invoice-action-card .btn-link .arrow {
            position: absolute;
            right: 14px;
            top: 12px;
        }

        .invoice-action-card .btn-link .arrow i {
            font-size: 12px;
            color: #666;
        }
    </style>
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-8 col-12">
            <div class="card" id="printableArea">
                <div class="card-body">
                    <div class="row">
                        <div class="col text-left">
                            <h4 class="m-0">{{ $generalInfo->company_name }}</h4>
                        </div>
                        <div class="col text-center">
                            @if (file_exists(public_path($generalInfo->logo_dark)))
                                <img src="{{ url($generalInfo->logo_dark) }}" alt="" height="50">
                            @endif
                        </div>
                        <div class="col text-right">
                            <h4 class="m-0">Invoice</h4>
                        </div>
                    </div>


                    <div class="row mt-4">
                        <div class="col-6">

                            @if ($shippingInfo)
                                <h6 class="font-weight-bold">Shipping Info :</h6>
                                <address class="line-h-24">
                                    <b>{{ $shippingInfo->full_name }}</b><br>
                                    <p id="customer-phone">{{ $shippingInfo->phone }}</p><br>
                                    {{ $shippingInfo->email }}<br>
                                    {{ $shippingInfo->address }}<br>
                                    @if ($shippingInfo->thana)
                                        Thana : {{ $shippingInfo->thana }}<br>
                                    @endif
                                    {{ $shippingInfo->city }} {{ $shippingInfo->post_code }},
                                    {{ $shippingInfo->country }}<br>
                                </address>
                            @endif

                        </div><!-- end col -->
                        <div class="col-6">
                            <div class="mt-3 float-right order_details_text">
                                <p class="mb-1"><strong>Order NO: </strong> #{{ $order->order_no }}</p>
                                <p class="mb-1"><strong>Tran. ID: </strong> #{{ $order->trx_id }}</p>

                                @if (isset($order->tracking_id) && !empty($order->tracking_id))
                                    @php
                                        // Parse the courier_details JSON if available
                                        $courierDetails = null;
                                        if (isset($order->courier_details) && !empty($order->courier_details)) {
                                            $courierDetails = json_decode($order->courier_details, true);
                                        }
                                    @endphp

                                    @if ($courierDetails && isset($courierDetails['consignment_id']))
                                        <p class="mb-1"><strong>SteadFast Parcel ID: </strong>
                                            {{ $courierDetails['consignment_id'] }}</p>
                                    @endif
                                    <p class="mb-1"><strong>SteadFast Tracking ID: </strong> {{ $order->tracking_id }}
                                    </p>
                                @endif

                                <p class="mb-1"><strong>Order Date: </strong>
                                    {{ date('jS F, Y', strtotime($order->order_date)) }}
                                </p>
                                <p class="mb-1">
                                    <strong>Order From: </strong>
                                    @if ($order->order_from == 1)
                                        Website
                                    @elseif($order->order_from == 2)
                                        Mobile App
                                    @else
                                        POS
                                    @endif
                                </p>
                                <p class="mb-1"><strong>Order Status: </strong>
                                    @php
                                        if ($order->order_status == 0) {
                                            echo '<span class="badge badge-soft-warning" style="padding: 2px 10px !important;">Pending</span>';
                                        } elseif ($order->order_status == 1) {
                                            echo '<span class="badge badge-soft-info" style="padding: 2px 10px !important;">Approved</span>';
                                        } elseif ($order->order_status == 5) {
                                            echo '<span class="badge badge-soft-info" style="padding: 2px 10px !important;">Ready to Ship</span>';
                                        } elseif ($order->order_status == 2) {
                                            echo '<span class="badge badge-soft-info" style="padding: 2px 10px !important;">Intransit - courier: ' .
                                                $order->courier_status .
                                                '</span>';
                                        } elseif ($order->order_status == 3) {
                                            echo '<span class="badge badge-soft-success" style="padding: 2px 10px !important;">Delivered</span>';
                                        } else {
                                            echo '<span class="badge badge-soft-danger" style="padding: 2px 10px !important;">Cancelled</span>';
                                        }
                                    @endphp
                                </p>
                                <p class="mb-1"><strong>Delivery Method: </strong>
                                    @php
                                        if ($order->delivery_method == 1) {
                                            echo '<span class="badge badge-soft-success" style="padding: 3px 5px !important;">Home Delivery</span>';
                                        }
                                        if ($order->delivery_method == 2) {
                                            echo '<span class="badge badge-soft-success" style="padding: 3px 5px !important;">Store Pickup</span>';
                                        }
                                    @endphp
                                </p>
                                <p class="mb-1"><strong>Payment Method: </strong>
                                    @php
                                        if ($order->payment_method == null) {
                                            echo '<span class="badge badge-soft-danger" style="padding: 2px 10px !important;">Unpaid</span>';
                                        } elseif ($order->payment_method == 1) {
                                            echo '<span class="badge badge-soft-info" style="padding: 2px 10px !important;">COD</span>';
                                        } elseif ($order->payment_method == 2) {
                                            echo '<span class="badge badge-soft-success" style="padding: 2px 10px !important;">bKash</span>';
                                        } elseif ($order->payment_method == 3) {
                                            echo '<span class="badge badge-soft-success" style="padding: 2px 10px !important;">Nagad</span>';
                                        } else {
                                            echo '<span class="badge badge-soft-success" style="padding: 2px 10px !important;">Card</span>';
                                        }
                                    @endphp
                                </p>
                                <p class="m-b-10"><strong>Payment Status:</strong>
                                    @switch($order->payment_status)
                                        @case(0)
                                            <span class="badge badge-soft-warning"
                                                style="padding: 2px 10px !important;">Unpaid</span>
                                        @break

                                        @case(1)
                                            <span class="badge badge-soft-success" style="padding: 2px 10px !important;">Paid</span>
                                        @break

                                        @case(2)
                                            <span class="badge badge-soft-primary"
                                                style="padding: 2px 10px !important;">Failed</span>
                                        @break

                                        @case(3)
                                            <span class="badge badge-soft-info" style="padding: 2px 10px !important;">Partial</span>
                                        @break

                                        @default
                                            <span class="badge badge-soft-danger"
                                                style="padding: 2px 10px !important;">Cancel</span>
                                    @endswitch
                                </p>
                            </div>
                        </div><!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-sm table-bordered mt-4">
                                    <thead>
                                        <tr>
                                            <th class="text-center" style="width: 60px;">SL</th>
                                            <th>Item</th>
                                            <th class="text-center">Variant</th>
                                            @if (env('MultiVendor') == true)
                                                <th class="text-center">Store</th>
                                            @endif
                                            <!-- <th class="text-center">Reward Points</th> -->
                                            <th class="text-center">Quantity</th>
                                            <th class="text-center">Unit Cost</th>
                                            <th class="text-right">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @php
                                            $sl = 1;
                                            $configSetup = DB::table('config_setups')->get();
                                        @endphp
                                        @foreach ($orderDetails as $details)
                                            @php
                                                if ($details->color_id) {
                                                    $colorInfo = App\Models\Color::where(
                                                        'id',
                                                        $details->color_id,
                                                    )->first();
                                                }
                                                if ($details->storage_id) {
                                                    $storageInfo = App\Models\StorageType::where(
                                                        'id',
                                                        $details->storage_id,
                                                    )->first();
                                                }
                                                if ($details->sim_id) {
                                                    $simInfo = App\Models\Sim::where('id', $details->sim_id)->first();
                                                }
                                                if ($details->region_id) {
                                                    $regionInfo = DB::table('country')
                                                        ->where('id', $details->region_id)
                                                        ->first();
                                                }
                                                if ($details->warrenty_id) {
                                                    $warrentyInfo = App\Models\ProductWarrenty::where(
                                                        'id',
                                                        $details->warrenty_id,
                                                    )->first();
                                                }
                                                if ($details->device_condition_id) {
                                                    $deviceCondition = App\Models\DeviceCondition::where(
                                                        'id',
                                                        $details->device_condition_id,
                                                    )->first();
                                                }
                                                if ($details->size_id) {
                                                    $productSize = App\Models\ProductSize::where(
                                                        'id',
                                                        $details->size_id,
                                                    )->first();
                                                }
                                            @endphp

                                            <tr>
                                                <td class="text-center">{{ $sl++ }}</td>
                                                <!-- <td>
                                                                <b>{{ $details->product_name }}</b><br />
                                                                Category : {{ $details->category_name }}<br />
                                                                SKU : {{ $details->product_code }}
                                                        </td> -->
                                                <td style="display: flex;align-items: center;">
                                                    <div class="product-info-img" style="display: inline-block;"><img
                                                            src="{{ url(env('ADMIN_URL') . '/' . $details->product_image) }}"
                                                            max-width="80" alt="product-img" title="product-img"
                                                            class="avatar-md"></div>
                                                    <div class="product-info"
                                                        style="display: inline-block; padding-left: 10px;">
                                                        <b>{{ $details->product_name }}</b>
                                                        <br />
                                                        SKU : {{ $details->product_code }}
                                                    </div>
                                                </td>
                                                <td class="text-center">
                                                    @if ($details->color_id)
                                                        {{ $configSetup[6]->name }}:
                                                        {{ $colorInfo ? $colorInfo->name : '' }} |
                                                    @endif
                                                    @if ($details->storage_id)
                                                        {{ $configSetup[1]->name }}:
                                                        {{ $storageInfo ? $storageInfo->ram : '' }}/{{ $storageInfo ? $storageInfo->rom : '' }}
                                                        |
                                                    @endif
                                                    @if ($details->sim_id)
                                                        {{ $configSetup[2]->name }}: {{ $simInfo ? $simInfo->name : '' }}
                                                    @endif
                                                    @if ($details->size_id)
                                                        {{ $configSetup[0]->name }}:
                                                        {{ $productSize ? $productSize->name : '' }}
                                                    @endif

                                                    <br>
                                                    @if ($details->region_id && $regionInfo?->name)
                                                        {{ $configSetup[5]->name }}: {{ $regionInfo?->name }} |
                                                    @endif
                                                    @if ($details->warrenty_id)
                                                        {{ $configSetup[4]->name }}:
                                                        {{ $warrentyInfo ? $warrentyInfo->name : '' }} |
                                                    @endif
                                                    @if ($details->device_condition_id)
                                                        {{ $configSetup[3]->name }}:
                                                        {{ $deviceCondition ? $deviceCondition->name : '' }}
                                                    @endif
                                                </td>
                                                @if (env('MultiVendor') == true)
                                                    <td class="text-center">{{ $details->store_name }}</td>
                                                @endif
                                                <!-- <td class="text-center">{{ $details->reward_points }}</td> -->
                                                <td class="text-center">{{ $details->qty }}</td>
                                                <td class="text-center">{{ $currencySymbol }}
                                                    {{ number_format($details->unit_price, 2) }}</td>
                                                <td class="text-right">{{ $currencySymbol }}
                                                    {{ number_format($details->total_price, 2) }}</td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-6">
                            <div class="clearfix pt-3">
                                <h6 class="text-muted">Billing Address:</h6>
                                @if ($billingAddress)
                                    <address class="line-h-24">
                                        {{ $billingAddress->address }}<br>
                                        {{ $billingAddress->city }} {{ $billingAddress->post_code }},
                                        {{ $billingAddress->country }}<br>
                                    </address>
                                @endif
                            </div>

                            @if ($userInfo)
                                <div class="clearfix pt-2">
                                    <h6 class="text-muted">User Account Info:</h6>
                                    <address class="line-h-24">
                                        {{ $userInfo->name }}<br>
                                        @if ($userInfo->email)
                                            {{ $userInfo->email }}<br>
                                        @endif
                                        @if ($userInfo->phone)
                                            {{ $userInfo->phone }}<br>
                                        @endif
                                        @if ($userInfo->address)
                                            {{ $userInfo->address }}
                                        @endif
                                    </address>
                                </div>
                            @endif

                            @if ($order->order_note)
                                <div class="clearfix pt-2">
                                    <h6 class="text-muted">Order note by Customer:</h6>
                                    <p>
                                        {{ $order->order_note }}
                                    </p>
                                </div>
                            @endif

                        </div>
                        <div class="col-6 text-right">
                            <div class="float-right">
                                <p><b>Sub-total :</b> {{ $currencySymbol }} {{ number_format($order->sub_total, 0) }}</p>
                                @if ($order->discount > 0)
                                    <p><b>Discount @if ($order->coupon_code)
                                                ({{ $order->coupon_code }})
                                            @endif:</b> {{ $currencySymbol }}
                                        {{ number_format($order->discount, 0) }}</p>
                                @endif
                                <!-- <p><b>Reward Points Used :</b> {{ $order->reward_points_used }}</p> -->
                                @if ($order->vat + $order->tax > 0)
                                    <p><b>VAT/TAX :</b> {{ $currencySymbol }}
                                        {{ number_format($order->vat + $order->tax, 0) }}</p>
                                @endif
                                <p><b>Delivery Charge :</b> {{ $currencySymbol }}
                                    {{ number_format($order->delivery_fee, 0) }}</p>
                                <p><b>Total Order Amount :</b> {{ $currencySymbol }} {{ number_format($order->total, 0) }}
                                </p>
                                <p><b>Paid Amount :</b><span id="order_delivery_charge">
                                        {{ $order->total - $payments['total'] == 0 ? 'Full Paid' : $currencySymbol . ' ' . number_format($payments['total'], 2) }}
                                    </span></p>

                                @if ($order->total - $payments['total'] > 0)
                                    <p><b>Due Amount :</b> {{ $currencySymbol }} <span
                                            id="order_delivery_charge">{{ number_format($order->total - $payments['total'], 2) }}</span>
                                    </p>
                                @endif
                            </div>
                            <div class="clearfix"></div>

                            <div class="hidden-print mt-4 mb-4">
                                <div class="text-right">
                                    <a href="{{ url('bulk/print/orders?orders=' . $order->id) }}" target="_blank"
                                        class="btn btn-primary waves-effect waves-light"><i class="fa fa-print m-r-5"></i>
                                        Print Invoice</a>
                                    <!-- <a href="javascript:void(0);" onclick="printPageArea('printableArea')"
                                            class="btn btn-primary waves-effect waves-light"><i class="fa fa-print m-r-5"></i>
                                            Print Invoice</a> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-xl-4 col-12">
            <div class="invoice-action-card card p-3">
                <h3 class="card-title">Invoice Actions</h3>
                <div class="accordion" id="accordionExample">
                    <div class="card">
                        <div class="card-header" id="headingOne">
                            <h2 class="mb-0">
                                <button class="btn btn-link" type="button" data-toggle="collapse"
                                    data-target="#order_shipment" aria-expanded="true" aria-controls="order_shipment">

                                    <span> <i class="fa fa-shipping-fast"></i> Order & Shipment
                                    </span>

                                    <div class="arrow"><i class="fas fa-chevron-down"></i></div>
                                </button>
                            </h2>
                        </div>

                        <div id="order_shipment" class="collapse show" aria-labelledby="headingOne"
                            data-parent="#accordionExample">
                            <div class="card-body">
                                <form action="{{ url('order/info/update') }}" method="POST"
                                    enctype="multipart/form-data">
                                    @csrf
                                    <input type="hidden" name="order_id" value="{{ $order->id }}">
                                    <div class="row">
                                        <div class="col-md-6 col-12">
                                            <div class="form-group" style="margin-bottom: .8rem;">
                                                <label style="margin-bottom: .2rem; font-weight: 500;">Order Status
                                                    :</label>
                                                <select name="order_status" class="form-control" required>
                                                    <option value="">Change Status</option>
                                                    <option value="0"
                                                        @if ($order->order_status == 0) selected @endif
                                                        @if ($order->order_status == 1 || $order->order_status == 2 || $order->order_status == 3 || $order->order_status == 4) disabled @endif>Pending</option>
                                                    <option value="1"
                                                        @if ($order->order_status == 1) selected @endif
                                                        @if ($order->order_status == 2 || $order->order_status == 3 || $order->order_status == 4) disabled @endif>Approved
                                                    </option>
                                                    <option value="5"
                                                        @if ($order->order_status == 5) selected @endif
                                                        @if ($order->order_status == 2 || $order->order_status == 3 || $order->order_status == 4) disabled @endif>Ready to Ship
                                                    </option>
                                                    <option value="2"
                                                        @if ($order->order_status == 2) selected @endif
                                                        @if ($order->order_status == 0 || $order->order_status == 3 || $order->order_status == 4) disabled @endif>Intransit
                                                    </option>
                                                    <option value="3"
                                                        @if ($order->order_status == 3) selected @endif
                                                        @if ($order->order_status == 1 || $order->order_status == 0 || $order->order_status == 4) disabled @endif>Delivered
                                                    </option>
                                                    <option value="4"
                                                        @if ($order->order_status == 4) selected @endif
                                                        @if ($order->order_status == 2 || $order->order_status == 3) disabled @endif>Cancel</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-12">
                                            <div class="form-group" style="margin-bottom: .8rem;">
                                                <label style="margin-bottom: .2rem; font-weight: 500;">Payment Status
                                                    :</label>
                                                <select name="payment_status" class="form-control" required>
                                                    <option value="">Change Status</option>
                                                    <option value="0"
                                                        @if ($order->payment_status == 0) selected @endif>Unpaid</option>
                                                    <option value="1"
                                                        @if ($order->payment_status == 1) selected @endif>Paid</option>
                                                    <option value="2"
                                                        @if ($order->payment_status == 2) selected @endif>Failed</option>
                                                    <option value="3"
                                                        @if ($order->payment_status == 3) selected @endif>Partial</option>
                                                    <option value="4"
                                                        @if ($order->payment_status == 4) selected @endif>Cancel</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="form-group" style="margin-bottom: .8rem;">
                                                <label style="margin-bottom: .2rem; font-weight: 500;">Est. Delivery Date
                                                    :</label>
                                                <input type="date" class="form-control" name="estimated_dd"
                                                    value="{{ $order->estimated_dd }}" required>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="form-group" style="margin-bottom: 0px">
                                                <label style="margin-bottom: .2rem; font-weight: 500;">Special Note For
                                                    Order (Visible by
                                                    Admin Only) :</label>
                                                <textarea name="order_remarks" class="form-control" style="height: 149px !important;"
                                                    placeholder="Special Note By Admin">{{ $order->order_remarks }}</textarea>
                                            </div>
                                            <button type="submit" class="btn btn-primary rounded mt-2">Save
                                                Changes</button>

                                            @if ($order->order_status != 0 && $order->order_status != 4)
                                                @if (!($order->tracking_id == null && ($order->order_status == 2 || $order->order_status == 3)))
                                                    @if ($order->tracking_id != null)
                                                        <a href="https://steadfast.com.bd/t/{{ $order->tracking_id }}"
                                                            target="_blank" title="Tracking the Order"
                                                            class="btn btn-warning rounded mt-2">Track Order</a>
                                                    @else
                                                        <a href="{{ url('add/order/' . $order->id . '/courier') }}"
                                                            onclick="return confirm('Are you sure to placed the order in courier?')"
                                                            title="Place To Courier"
                                                            class="btn btn-info rounded mt-2">Send To Courier</a>
                                                    @endif
                                                @endif
                                            @endif
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-header" id="headingTwo">
                            <h2 class="mb-0">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse"
                                    data-target="#payment" aria-expanded="false" aria-controls="payment">

                                    <span><i class="fa fa-dollar-sign"></i>
                                        Payment
                                    </span>

                                    <div class="arrow"><i class="fas fa-chevron-right"></i></div>
                                </button>
                            </h2>
                        </div>
                        <div id="payment" class="collapse" aria-labelledby="headingTwo"
                            data-parent="#accordionExample">
                            <div class="card-body">

                                <form action="{{ url('add/order/payment') }}" method="POST"
                                    {{ in_array($order->order_status, [3, 4]) ? 'onsubmit="return false;"' : '' }}>
                                    @csrf
                                    <input type="hidden" name="order_id" value="{{ $order->id }}">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group" style="margin-bottom: .5rem;">
                                                <label style="margin-bottom: .2rem; font-weight: 500;">Payment
                                                    Method</label>
                                                <select name="payment_through" class="form-control" required>
                                                    <option value="bKash">BKash</option>
                                                    <option value="Rocket">Rocket</option>
                                                    <option value="Nagad">Nagad</option>
                                                    <option value="Upay">Upay</option>
                                                    <option value="COD">COD</option>
                                                    <option value="Other">Others</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="form-group ">
                                                <label for="tran_id">bKash / Rocket / Nagad / Upay TrxID or Note <sup
                                                        style="color:red;">*</sup></label>
                                                <input class="form-control" type="text" value="" name="tran_id"
                                                    id="tran_id" required="" placeholder="Enter TrxID">
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="form-group ">
                                                <label for="amount">Amount (Due:
                                                    {{ number_format($order->total - $payments['total'], 2) }})<sup
                                                        style="color:red;">*</sup></label>
                                                <input class="form-control" type="number" value="" step="0.01"
                                                    name="amount" id="amount" required=""
                                                    max="{{ number_format($order->total - $payments['total'], 2) }}"
                                                    placeholder="Enter Amount">
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="form-group" style="margin-bottom: .8rem;">
                                                <label style="margin-bottom: .2rem; font-weight: 500;">Payment Date
                                                    :</label>
                                                <input type="datetime-local" class="form-control" name="payment_date"
                                                    value="{{ date('Y-m-d\TH:i') }}" step="1">
                                            </div>
                                        </div>

                                        <!-- <div class="col-lg-6 col-12">
                                                        <div class="form-group ">
                                                            <label for="shipping">Shipping <sup style="color:red;">*</sup></label>
                                                            <input class="form-control" type="number" value="49.00" step="0.01"
                                                                name="shipping" id="shipping" required=""
                                                                placeholder="Enter Shipping">
                                                        </div>
                                                    </div> -->
                                    </div>
                                    <button type="submit"
                                        class="btn btn-primary rounded mt-1 {{ in_array($order->order_status, [3, 4]) ? 'opacity-50' : '' }}"
                                        {{ in_array($order->order_status, [3, 4]) ? 'disabled' : '' }}> Add
                                        Payment</button>

                                </form>
                                <div class="payment-history mt-4">
                                    <h5>Payment History</h5>
                                    <ul class="mb-0">
                                        @forelse ($payments['payments'] as $pay)
                                            <li>
                                                payment via {{ $pay->payment_through }} @if ($pay->tran_id)
                                                    (TrxID: {{ $pay->tran_id }})
                                                @endif amount: {{ $pay->amount }} At
                                                {{ date('d M Y', strtotime($pay->tran_date)) }}
                                                <button type="button" class="btn btn-sm btn-warning openPaymentModal"
                                                    data-id="{{ $pay->id }}">Edit</button>
                                                <!-- data-target="#editModal" -->
                                            </li>
                                        @empty
                                            <p>No History Found</p>
                                        @endforelse
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- <div class="card">
                                    <div class="card-header" id="headingThree">
                                        <h2 class="mb-0">
                                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse"
                                                data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">

                                                <span> <i class="fa fa-sticky-note"></i>
                                                Courier Performance Data
                                                </span>


                                                <div class="arrow"><i class="fas fa-chevron-right"></i></div>
                                            </button>
                                        </h2>
                                    </div>
                                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree"
                                        data-parent="#accordionExample">
                                        <div class="card-body">

                                        </div>
                                    </div>
                                </div> -->
                    <div class="card">
                        <div class="card-header">
                            <b>
                                Courier Performance Data
                            </b>
                        </div>
                        <div class="card-body">
                            <div id="courier-ratio-container"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editModalLabel">Update Payment</h5>
                            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"><i
                                    class="fas fa-times"></i></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <input type="hidden" class="form-control" id="paymentId">
                                <label for="numberField" class="form-label">Enter amount</label>
                                <input type="number" class="form-control" id="numberField">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="button" class="btn btn-primary" id="updatePaymentBtn">Update</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('footer_js')
    <script>
        function printPageArea(areaID) {
            var printContent = document.getElementById(areaID).innerHTML;
            var originalContent = document.body.innerHTML;
            document.body.innerHTML = printContent;
            window.print();
            document.body.innerHTML = originalContent;
        }
    </script>

    <script>
        $(document).ready(function() {
            // Toggle arrow direction on show/hide
            $('.accordion').on('hide.bs.collapse', function(e) {
                $(e.target).prev('.card-header').find(".arrow i").removeClass("fa-chevron-down").addClass(
                    "fa-chevron-right");
            });

            $('.accordion').on('show.bs.collapse', function(e) {
                $(e.target).prev('.card-header').find(".arrow i").removeClass("fa-chevron-right").addClass(
                    "fa-chevron-down");
            });
        });
        // const modalButtons = document.querySelectorAll('.openPaymentModal');
        $(".openPaymentModal").on('click', function() {
            const paymentId = this.getAttribute('data-id');
            document.getElementById('paymentId').value = paymentId;
            $("#editModal").modal().show()
        });

        $("#updatePaymentBtn").on("click", function() {
            const id = $("#paymentId").val()
            const amount = $("#numberField").val()
            const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
            if (confirm(`Are you sure you want to update the amount to ${amount}?`)) {
                fetch('/update/payment', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': csrfToken,
                            'Accept': 'application/json'
                        },
                        body: JSON.stringify({
                            id: id,
                            amount: amount
                        })
                    })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok');
                        }
                        return response.json();
                    })
                    .then(data => {
                        if (data.success) {
                            alert(data.message || 'Payment updated successfully!');
                        } else {
                            alert(data.message || 'Error updating payment.');
                        }
                        $("#editModal").modal().hide();
                        window.location.href = window.location.href;
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        alert('An error occurred while updating the payment.');
                    });
            }
        })

        document.addEventListener('DOMContentLoaded', function() {
            const customerPhoneElement = document.getElementById('customer-phone');
            if (!customerPhoneElement) {
                console.error('Customer phone element not found on the page');
                return;
            }

            const customerPhone = customerPhoneElement.innerText;
            if (!customerPhone) {
                console.error('Customer phone value is empty');
                return;
            }

            fetchCourierRatio(customerPhone);
        });

        function fetchCourierRatio(phone) {
            const formattedPhone = phone.replace(/\s+/g, '');
            const apiUrl = `/findout-customer-courier-ratio/${formattedPhone}`;

            fetch(apiUrl)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    if (data.status === 'success') {
                        createSuccessRateVisualization(data.courierData);
                    } else {
                        console.error('API returned error status:', data);
                    }
                })
                .catch(error => {
                    console.error('Error fetching courier ratio data:', error);
                });
        }

        function createSuccessRateVisualization(courierData) {
            const summaryData = courierData.summary;
            const successRatio = summaryData.success_ratio;

            // Create container if it doesn't exist
            let container = document.getElementById('courier-ratio-container');
            if (!container) {
                container = document.createElement('div');
                container.id = 'courier-ratio-container';
                container.className = 'mt-4';

                // Add it after the shipping info section
                const shippingInfo = document.getElementById('customer-phone').closest('address').parentElement;
                if (shippingInfo) {
                    shippingInfo.after(container);
                } else {
                    document.body.appendChild(container);
                }
            }

            // Create progress circle and rating
            const progressHTML = `
        <div class="text-center mb-4">
            <div style="--progress: ${successRatio}%" class="circle-progress mx-auto">
                <div class="circle-progress-value">${successRatio}%</div>
            </div>
            <div class="rating-text mt-3">${getRatingText(successRatio)}</div>
            <div class="summary-text mb-4">This number has ${successRatio}% overall success rate</div>
        </div>
    `;

            // Create table with courier logos
            const tableHTML = `
        <table class="table table-bordered">
            <thead>
                <tr class="bg-light">
                    <th>Courier</th>
                    <th>Total Orders</th>
                    <th>Successful</th>
                    <th>Canceled</th>
                    <th>Success Rate</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="align-middle">
                        <div class="courier-logo pathao-logo">Pathao</div>
                    </td>
                    <td class="text-center">${courierData.pathao.total_parcel}</td>
                    <td class="text-center">${courierData.pathao.success_parcel}</td>
                    <td class="text-center">${courierData.pathao.cancelled_parcel}</td>
                    <td class="text-center">${courierData.pathao.success_ratio}%</td>
                </tr>
                <tr>
                    <td class="align-middle">
                        <div class="courier-logo steadfast-logo">SteadFast</div>
                    </td>
                    <td class="text-center">${courierData.steadfast.total_parcel}</td>
                    <td class="text-center">${courierData.steadfast.success_parcel}</td>
                    <td class="text-center">${courierData.steadfast.cancelled_parcel}</td>
                    <td class="text-center">${courierData.steadfast.success_ratio}%</td>
                </tr>
                <tr>
                    <td class="align-middle">
                        <div class="courier-logo redx-logo">RedX</div>
                    </td>
                    <td class="text-center">${courierData.redx.total_parcel}</td>
                    <td class="text-center">${courierData.redx.success_parcel}</td>
                    <td class="text-center">${courierData.redx.cancelled_parcel}</td>
                    <td class="text-center">${courierData.redx.success_ratio}%</td>
                </tr>
                <tr>
                    <td class="align-middle">
                        <div class="courier-logo paperfly-logo">Paperfly</div>
                    </td>
                    <td class="text-center">${courierData.paperfly.total_parcel}</td>
                    <td class="text-center">${courierData.paperfly.success_parcel}</td>
                    <td class="text-center">${courierData.paperfly.cancelled_parcel}</td>
                    <td class="text-center">${courierData.paperfly.success_ratio}%</td>
                </tr>
                <tr class="bg-info bg-opacity-25 fw-bold">
                    <td>Overall Summary</td>
                    <td class="text-center">${summaryData.total_parcel}</td>
                    <td class="text-center">${summaryData.success_parcel}</td>
                    <td class="text-center">${summaryData.cancelled_parcel}</td>
                    <td class="text-center">${summaryData.success_ratio}%</td>
                </tr>
            </tbody>
        </table>
    `;

            // Add CSS for the circle and logos
            const styleElement = document.createElement('style');
            styleElement.textContent = `
        .circle-progress {
            width: 180px;
            height: 180px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            background: conic-gradient(#4CAF50 0% var(--progress), #f3f3f3 var(--progress) 100%);
            box-shadow: 0 0 0 12px white inset;
        }

        .circle-progress-value {
            position: absolute;
            font-size: 42px;
            font-weight: 700;
            color: #1a2d40;
        }

        .rating-text {
            font-size: 24px;
            font-weight: 600;
            color: #1a2d40;
        }

        .summary-text {
            color: #505a68;
            font-size: 16px;
        }

        .courier-logo {
            font-weight: bold;
            font-size: 16px;
        }

        .pathao-logo {
            color: #ff5c38;
        }

        .steadfast-logo {
            color: #0f7ac5;
        }

        .redx-logo {
            color: #e2001a;
        }

        .paperfly-logo {
            color: #00b3e3;
        }
    `;

            // Add everything to the container
            container.innerHTML = '';
            container.appendChild(styleElement);
            const wrapperDiv = document.createElement('div');
            wrapperDiv.innerHTML = progressHTML + tableHTML;
            container.appendChild(wrapperDiv);
        }

        function getRatingText(ratio) {
            if (ratio >= 90) return "Excellent";
            if (ratio >= 75) return "Good";
            if (ratio >= 50) return "Average";
            return "Poor";
        }

        function capitalizeFirstLetter(string) {
            return string.charAt(0).toUpperCase() + string.slice(1);
        }
    </script>
@endsection
