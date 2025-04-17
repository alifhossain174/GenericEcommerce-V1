@extends('backend.master')

@section('page_title')
    Orders
@endsection

@section('page_heading')
    Edit Order Information
@endsection

@section('header_css')
    <link href="{{ url('assets') }}/plugins/select2/select2.min.css" rel="stylesheet" type="text/css" />
    <style>
        .shipping_input {
            font-size: 13px;
            height: 32px;
            box-shadow: inset 1px 1px 2px #b9b9b9;
            display: inline-block;
        }

        table tbody tr td {
            padding: 5px 10px !important
        }

        table thead tr th {
            padding: 5px 10px !important
        }

        .select2-selection {
            height: 34px !important;
            border: 1px solid #ced4da !important;
        }

        .select2 {
            width: 100% !important;
        }

        /* Chrome, Safari, Edge, Opera */
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        /* Firefox */
        input[type=number] {
            -moz-appearance: textfield;
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
            <form action="{{ url('order/update') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <input type="hidden" name="order_id" value="{{ $order->id }}">
                <input type="hidden" id="delivery_charge_amount" name="delivery_fee" value="{{ $order->delivery_fee }}">
                <div class="card">
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
                                <h4 class="m-0">Voucher</h4>
                            </div>
                        </div>


                        <div class="row mt-4">
                            <div class="col-6">
                                @if ($shippingInfo)
                                    <div class="card border-0 shadow-sm">
                                        <div
                                            class="card-header bg-light d-flex justify-content-between align-items-center py-2">
                                            <h6 class="mb-0 fw-bold">Shipping Information</h6>
                                            @php
                                                $orderCount = DB::table('orders')
                                                    ->join(
                                                        'shipping_infos',
                                                        'shipping_infos.order_id',
                                                        '=',
                                                        'orders.id',
                                                    )
                                                    ->where('shipping_infos.phone', $shippingInfo->phone)
                                                    ->count();
                                                $customerType = $orderCount > 1 ? 'Old' : 'New';
                                            @endphp
                                            <span
                                                class="badge bg-{{ $customerType == 'Old' ? 'info' : 'success' }}">{{ $customerType }}
                                                Customer</span>
                                        </div>
                                        <div class="card-body p-3">
                                            <div class="d-flex align-items-center mb-2">
                                                <div class="fw-bold">{{ $shippingInfo->full_name }}</div>
                                                <a target="_blank" href="{{ url('/customer/details/' . $order->user_id) }}"
                                                    class="btn btn-sm btn-light ms-2" title="View Customer">
                                                    <i class="fas fa-eye"></i>
                                                </a>
                                            </div>

                                            <div class="mb-1" id="customer-phone">{{ $shippingInfo->phone }}</div>

                                            @if ($shippingInfo->email)
                                                <div class="mb-1">{{ $shippingInfo->email }}</div>
                                            @endif

                                            <div class="mb-1">{{ $shippingInfo->address }}</div>

                                            @if ($shippingInfo->thana)
                                                <div class="mb-1">Thana: {{ $shippingInfo->thana }}</div>
                                            @endif

                                            <div>{{ $shippingInfo->city }} {{ $shippingInfo->post_code }},
                                                {{ $shippingInfo->country }}</div>
                                        </div>
                                    </div>
                                @endif
                            </div>

                            <!-- end col -->
                            <div class="col-lg-6">
                                <div class="mt-3 float-right">
                                    <p>
                                    <div class="d-flex justify-content-end">
                                        <a href="{{ url('order/details/' . $order->slug) }}"
                                            class="btn btn-sm btn-warning rounded" title="View Order">
                                            <i class="fas fa-eye"></i> View Order
                                        </a>
                                    </div>
                                    </p>
                                    <p class="mb-2"><strong>Order NO: </strong> #{{ $order->order_no }}</p>
                                    <p class="mb-2"><strong>Tran. ID: </strong> #{{ $order->trx_id }}</p>
                                    <p class="mb-2"><strong>Order Date: </strong>
                                        {{ date('jS F, Y', strtotime($order->order_date)) }}
                                    </p>
                                    <p class="mb-1">
                                        <strong>Order From: </strong>
                                        @if ($order->order_from == 1)
                                            Website
                                        @elseif($order->order_from == 2)
                                            Mobile App
                                        @elseif($order->order_from == 3)
                                            POS
                                        @else
                                            Lending Page
                                        @endif
                                    </p>
                                    <p class="mb-1"><strong>Order Status: </strong>
                                        @php
                                            if ($order->order_status == 0) {
                                                echo '<span class="badge badge-soft-warning" style="padding: 2px 10px !important;">Pending</span>';
                                            } elseif ($order->order_status == 1) {
                                                echo '<span class="badge badge-soft-info" style="padding: 2px 10px !important;">Approved</span>';
                                            } elseif ($order->order_status == 5) {
                                                echo '<span class="badge badge-soft-info" style="padding: 2px 10px !important;">Ready to Ship' .
                                                    ($order->delivery_method == 3
                                                        ? ' (Courier: ' . $order->courier_status . ')'
                                                        : '') .
                                                    '</span>';
                                            } elseif ($order->order_status == 2) {
                                                echo '<span class="badge badge-soft-info" style="padding: 2px 10px !important;">Intransit' .
                                                    ($order->delivery_method == 3
                                                        ? ' (Courier: ' . $order->courier_status . ')'
                                                        : '') .
                                                    '</span>';
                                            } elseif ($order->order_status == 3) {
                                                echo '<span class="badge badge-soft-success" style="padding: 2px 10px !important;">Delivered' .
                                                    ($order->delivery_method == 3
                                                        ? ' (Courier: ' . $order->courier_status . ')'
                                                        : '') .
                                                    '</span>';
                                            } elseif ($order->order_status == 4) {
                                                echo '<span class="badge badge-soft-danger" style="padding: 2px 10px !important;">Cancelled' .
                                                    ($order->delivery_method == 3
                                                        ? ' (Courier: ' . $order->courier_status . ')'
                                                        : '') .
                                                    '</span>';
                                            } elseif ($order->order_status == 6) {
                                                echo '<span class="badge badge-soft-primary" style="padding: 2px 10px !important;">Courier Assigned' .
                                                    ($order->delivery_method == 3
                                                        ? ' (Courier: ' . $order->courier_status . ')'
                                                        : '') .
                                                    '</span>';
                                            } elseif ($order->order_status == 7) {
                                                echo '<span class="badge badge-soft-warning" style="padding: 2px 10px !important;">Return Request</span>';
                                            } elseif ($order->order_status == 8) {
                                                echo '<span class="badge badge-soft-secondary" style="padding: 2px 10px !important;">Returned</span>';
                                            } elseif ($order->order_status == 9) {
                                                echo '<span class="badge badge-soft-success" style="padding: 2px 10px !important;">Completed</span>';
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
                                            if ($order->delivery_method == 3) {
                                                echo '<span class="badge badge-soft-success" style="padding: 3px 5px !important;">SteadFast</span>';
                                            }
                                        @endphp
                                    </p>

                                    <p class="mb-2"><strong>Payment Method: </strong>
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
                                                <span class="badge badge-soft-success"
                                                    style="padding: 2px 10px !important;">Paid</span>
                                            @break

                                            @case(2)
                                                <span class="badge badge-soft-primary"
                                                    style="padding: 2px 10px !important;">Failed</span>
                                            @break

                                            @case(3)
                                                <span class="badge badge-soft-info"
                                                    style="padding: 2px 10px !important;">Partial</span>
                                            @break

                                            @default
                                                <span class="badge badge-soft-danger"
                                                    style="padding: 2px 10px !important;">Cancel</span>
                                        @endswitch
                                    </p>

                                    @if ($order->payment_method == null)
                                        <p class="m-b-10">
                                            <select class="form-control" name="payment_method"
                                                style="cursor: pointer; border: 1px solid #a60000b2;">
                                                <option value="">Change Payment Method</option>
                                                <option value="1">Cash On Delivery</option>
                                            </select>
                                        </p>
                                    @endif

                                </div>
                            </div><!-- end col -->
                        </div>
                        <!-- end row -->

                        <!-- order item details -->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table class="table mt-4 table-sm table-bordered" id="orderDetailsTable">
                                        <thead>
                                            <tr>
                                                <th class="text-center" style="width: 60px;">SL</th>
                                                <th>Item</th>
                                                <th class="text-center">Variant</th>
                                                <th class="text-center" style="width: 180px;">Quantity</th>
                                                <th class="text-center" style="width: 150px;">Unit Cost</th>
                                                <th class="text-right" style="width: 150px;">Total</th>
                                                <th class="text-center" style="width: 75px;">Action</th>
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
                                                    if ($details->size_id) {
                                                        $sizeInfo = App\Models\ProductSize::where(
                                                            'id',
                                                            $details->size_id,
                                                        )->first();
                                                    }
                                                    if ($details->storage_id) {
                                                        $storageInfo = App\Models\StorageType::where(
                                                            'id',
                                                            $details->storage_id,
                                                        )->first();
                                                    }
                                                    if ($details->sim_id) {
                                                        $simInfo = App\Models\Sim::where(
                                                            'id',
                                                            $details->sim_id,
                                                        )->first();
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
                                                @endphp
                                                <tr>
                                                    <td class="text-center" style="vertical-align: middle;">
                                                        <strong>{{ $sl }}</strong>
                                                        <input type="hidden" name="order_details_id[]"
                                                            value="{{ $details->id }}">
                                                    </td>
                                                    <td style="vertical-align: middle;">
                                                        <b>{{ $details->product_name }}</b>
                                                        <input type="hidden" name="product_id[]"
                                                            value="{{ $details->product_id }}">
                                                    </td>

                                                    <td class="text-center" style="vertical-align: middle;">
                                                        @if ($details->color_id)
                                                            {{ $configSetup[6]->name }}: {{ $colorInfo->name }} |
                                                        @endif
                                                        @if ($details->size_id)
                                                            {{ $configSetup[0]->name }}: {{ $sizeInfo->name }} |
                                                        @endif
                                                        @if ($details->storage_id)
                                                            {{ $configSetup[1]->name }}:
                                                            {{ $storageInfo->ram }}/{{ $storageInfo->rom }} |
                                                        @endif
                                                        @if ($details->sim_id)
                                                            {{ $configSetup[2]->name }}: {{ $simInfo->name }}
                                                        @endif

                                                        <br>
                                                        @if ($details->region_id && $regionInfo?->name)
                                                            {{ $configSetup[5]->name }}: {{ $regionInfo?->name }} |
                                                        @endif
                                                        @if ($details->warrenty_id)
                                                            {{ $configSetup[4]->name }}: {{ $warrentyInfo->name }} |
                                                        @endif
                                                        @if ($details->device_condition_id)
                                                            {{ $configSetup[3]->name }}: {{ $deviceCondition->name }}
                                                        @endif

                                                        <input type="hidden" id="color_id_{{ $sl }}"
                                                            name="color_id[]" value="{{ $details->color_id }}">
                                                        <input type="hidden" id="size_id_{{ $sl }}"
                                                            name="size_id[]" value="{{ $details->size_id }}">
                                                        <input type="hidden" id="storage_id_{{ $sl }}"
                                                            name="storage_id[]" value="{{ $details->storage_id }}">
                                                        <input type="hidden" id="sim_id_{{ $sl }}"
                                                            name="sim_id[]" value="{{ $details->sim_id }}">
                                                        <input type="hidden" id="region_id_{{ $sl }}"
                                                            name="region_id[]" value="{{ $details->region_id }}">
                                                        <input type="hidden" id="warrenty_id_{{ $sl }}"
                                                            name="warrenty_id[]" value="{{ $details->warrenty_id }}">
                                                        <input type="hidden"
                                                            id="device_condition_id_{{ $sl }}"
                                                            name="device_condition_id[]"
                                                            value="{{ $details->device_condition_id }}">
                                                    </td>

                                                    <td class="text-center" style="vertical-align: middle;">
                                                        <input class="form-control d-inline-block w-50" type="number"
                                                            onwheel="this.blur()"
                                                            onkeyup="changeTotalPrice({{ $sl }})"
                                                            min="1" name="qty[]" id="qty_{{ $sl }}"
                                                            value="{{ $details->qty }}" required>
                                                        {{ $details->unit_name }}
                                                        <input type="hidden" name="unit_id[]"
                                                            value="{{ $details->unit_id }}">
                                                    </td>
                                                    <td class="text-center" style="vertical-align: middle;">
                                                        {{ $currencySymbol }} <input
                                                            class="form-control d-inline-block w-75" type="text"
                                                            name="unit_price[]" id="unit_price_{{ $sl }}"
                                                            value="{{ $details->unit_price }}" readonly required>
                                                    </td>
                                                    <td class="text-right" style="vertical-align: middle;">
                                                        {{ $currencySymbol }} <input
                                                            class="form-control d-inline-block w-75 orderT" type="text"
                                                            name="total_price[]" id="total_price_{{ $sl }}"
                                                            value="{{ $details->total_price }}" readonly required>
                                                    </td>
                                                    <td class="text-center" style="vertical-align: middle;">
                                                        <a href="javascript:void(0)" onclick="removeRow(this)"
                                                            class="btn btn-danger rounded btn-sm d-inline text-white"><i
                                                                class="feather-trash-2"
                                                                style="font-size: 14px; line-height: 2"></i></a>
                                                    </td>
                                                </tr>
                                                @php
                                                    $sl++;
                                                @endphp
                                            @endforeach
                                        </tbody>
                                    </table>
                                    <div class="row pb-3">
                                        <div class="col-lg-12 text-right">
                                            <button type="button" class="btn btn-success btn-sm rounded addAnotherItem"
                                                onclick="addAnotherProduct()"><strong>+ Add More Product</strong></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6">

                                <!-- Coupon Box -->
                                <div class="card shadow-sm mb-3">
                                    <div class="card-header bg-light py-2">
                                        <h6 class="card-title mb-0 fw-bold">Apply Coupon</h6>
                                    </div>
                                    <div class="card-body py-2">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="coupon_code"
                                                placeholder="Enter coupon code" value="{{ $order->coupon_code }}">
                                            <button type="button"
                                                class="btn {{ $order->coupon_code ? 'btn-danger' : 'btn-success' }} rounded"
                                                id="couponBtn" style="margin-top: -3px; line-height: 22px;">
                                                {{ $order->coupon_code ? 'Remove' : 'Apply Coupon' }}
                                            </button>
                                        </div>
                                        <div id="coupon_message" class="mt-2"></div>
                                    </div>
                                </div>

                                <!-- Manual Discount Box -->
                                <div class="card shadow-sm">
                                    <div class="card-header bg-light py-2">
                                        <h6 class="card-title mb-0 fw-bold">Manual Discount</h6>
                                    </div>
                                    <div class="card-body py-2">
                                        <div class="input-group">
                                            <span class="input-group-text">{{ $currencySymbol }}</span>
                                            <input type="number" min="0" class="form-control" id="discount"
                                                name="discount" placeholder="Enter discount amount"
                                                value="{{ $order->discount }}">
                                        </div>
                                    </div>
                                </div>


                            </div>
                            <div class="col-lg-6 pt-3 text-right">
                                <div class="float-right">
                                    <p><b>Sub-total :</b> {{ $currencySymbol }}
                                        <span>{{ number_format($order->sub_total, 0) }}</span>
                                    </p>

                                    <p><b>Discount @if ($order->coupon_code)
                                                ({{ $order->coupon_code }})
                                            @endif:</b> {{ $currencySymbol }}
                                        {{ number_format($order->discount, 0) }}
                                    </p>

                                    <!-- <p><b>Reward Points Used :</b> {{ $order->reward_points_used }}</p> -->
                                    @if ($order->vat + $order->tax > 0)
                                        <p><b>VAT/TAX :</b> {{ $currencySymbol }}
                                            {{ number_format($order->vat + $order->tax, 0) }}</p>
                                    @endif
                                    <p><b>Delivery Charge :</b> {{ $currencySymbol }}
                                        {{ number_format($order->delivery_fee, 0) }}</p>
                                    <p><b>Total Order Amount :</b> {{ $currencySymbol }}
                                        {{ number_format($order->total, 0) }}</p>
                                    <p><b>Paid Amount :</b><span id="order_delivery_charge">
                                            {{ number_format($order->total - $payments['total'], 2) == 0 ? 'Full Paid' : $currencySymbol . ' ' . $payments['total'] }}
                                        </span>
                                    </p>
                                    @if (number_format($order->total - $payments['total'], 2) > 0)
                                        <p><b>Due Amount :</b> {{ $currencySymbol }} <span
                                                id="order_delivery_charge">{{ number_format($order->total - $payments['total'], 2) }}


                                            </span>
                                        </p>
                                    @endif
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <!-- end order item details -->
                        {{-- update billing address and shipping address --}}
                        <div class="row">
                            <!-- Shipping Information Column -->
                            <div class="col-lg-6">
                                <div class="card shadow-sm">
                                    <div class="card-header bg-light py-2">
                                        <h6 class="card-title mb-0 fw-bold">Shipping Information</h6>
                                    </div>
                                    <div class="card-body py-2">
                                        <form class="shipping_address_fields">
                                            <!-- Customer Name -->
                                            <input type="text" name="shipping_name" id="shipping_name"
                                                value="@if ($shippingInfo) {{ $shippingInfo->full_name }} @endif"
                                                @if ((isset($shippingInfo) && $shippingInfo->full_name == '') || !isset($shippingInfo)) class="form-control is-invalid mb-2" @else class="form-control mb-2" @endif
                                                placeholder="Customer Name" required>

                                            <!-- Customer Phone -->
                                            <input type="text" name="shipping_phone" id="shipping_phone"
                                                value="@if ($shippingInfo) {{ $shippingInfo->phone }} @endif"
                                                @if ((isset($shippingInfo) && $shippingInfo->phone == '') || !isset($shippingInfo)) class="form-control is-invalid mb-2" @else class="form-control mb-2" @endif
                                                placeholder="Customer Phone" required>

                                            <!-- Customer Email -->
                                            <input type="email" name="shipping_email" id="shipping_email"
                                                value="@if ($shippingInfo) {{ $shippingInfo->email }} @endif"
                                                class="form-control mb-2" placeholder="Customer Email (Optional)">

                                            <!-- Customer Address -->
                                            <input type="text" name="shipping_address" id="shipping_address"
                                                value="@if ($shippingInfo) {{ $shippingInfo->address }} @endif"
                                                @if ((isset($shippingInfo) && $shippingInfo->address == '') || !isset($shippingInfo)) class="form-control is-invalid mb-2" @else class="form-control mb-2" @endif
                                                placeholder="Customer Address" required>

                                            @if ((isset($shippingInfo) && $shippingInfo->city == '') || !isset($shippingInfo))
                                                <style>
                                                    .shipping_address_fields .select2-container {
                                                        border: 1px solid #dc3545 !important;
                                                        border-radius: 0.25rem;
                                                        margin-bottom: 0.5rem;
                                                    }
                                                </style>
                                            @else
                                                <style>
                                                    .shipping_address_fields .select2-container {
                                                        margin-bottom: 0.5rem;
                                                    }
                                                </style>
                                            @endif

                                            <div class="row mb-2">
                                                <!-- District Selection -->
                                                <div class="col-md-6">
                                                    <select class="form-select" id="shipping_district_id"
                                                        name="shipping_district_id" data-toggle="select2" required>
                                                        <option value="">Select District</option>
                                                        @foreach ($districts as $district)
                                                            <option value="{{ $district->id }}"
                                                                data-delivery-charge="{{ $district->delivery_charge }}"
                                                                @if ($shippingInfo && $shippingInfo->city == $district->name) selected @endif>
                                                                {{ $district->name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <!-- Thana Selection -->
                                                <div class="col-md-6">
                                                    <select class="form-select" id="shipping_thana_id"
                                                        name="shipping_thana_id" data-toggle="select2" required>
                                                        <option value="">Select Thana</option>
                                                        <!-- Options will be loaded dynamically -->
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <!-- Post Code -->
                                                <div class="col-md-6">
                                                    <input type="text" name="shipping_post_code"
                                                        id="shipping_post_code"
                                                        value="@if ($shippingInfo) {{ $shippingInfo->post_code }} @endif"
                                                        class="form-control mb-2" placeholder="Post Code (Optional)">
                                                </div>

                                                <!-- Country -->
                                                <div class="col-md-6">
                                                    <input type="text" name="shipping_country" id="shipping_country"
                                                        value="@if ($shippingInfo) {{ $shippingInfo->country }} @endif"
                                                        @if ((isset($shippingInfo) && $shippingInfo->country == '') || !isset($shippingInfo)) class="form-control is-invalid" @else class="form-control" @endif
                                                        placeholder="Country Name" required>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <!-- Billing & User Info Column -->
                            <div class="col-lg-6">
                                <div class="card shadow-sm">
                                    <div class="card-header bg-light py-2">
                                        <h6 class="card-title mb-0 fw-bold">Billing Address</h6>
                                        <div class="form-check mt-1">
                                            <input class="form-check-input" type="checkbox" id="different_billing"
                                                name="different_billing">
                                            <label class="form-check-label" for="different_billing">
                                                Different from shipping address
                                            </label>
                                        </div>
                                    </div>
                                    <div class="card-body py-2">
                                        <div id="billing_form_container" class="billing_address_fields"
                                            style="display: none;">
                                            <!-- Billing Address -->
                                            <input type="text" name="billing_address" id="billing_address"
                                                value="@if ($billingAddress) {{ $billingAddress->address }} @endif"
                                                @if ((isset($billingAddress) && $billingAddress->address == '') || !isset($billingAddress)) style="border: 1px solid #b500008c;" @endif
                                                placeholder="Billing Address" class="form-control shipping_input mb-2">

                                            @if ((isset($billingAddress) && $billingAddress->city == '') || !isset($billingAddress))
                                                <style>
                                                    .billing_address_fields .select2-container {
                                                        border: 1px solid #b500008c !important;
                                                        border-radius: 6px;
                                                        margin-bottom: 8px;
                                                    }
                                                </style>
                                            @else
                                                <style>
                                                    .billing_address_fields .select2-container {
                                                        margin-bottom: 8px;
                                                    }
                                                </style>
                                            @endif

                                            <div class="row mb-2">
                                                <!-- District Selection -->
                                                <div class="col-12">
                                                    <select class="form-select" id="billing_district_id"
                                                        name="billing_district_id" data-toggle="select2" required>
                                                        <option value="">Select Billing District</option>
                                                        @foreach ($districts as $district)
                                                            <option value="{{ $district->id }}"
                                                                @if ($billingAddress && $billingAddress->city == $district->name) selected @endif>
                                                                {{ $district->name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <!-- Thana Selection -->
                                                <div class="col-12">
                                                    <select class="form-select" id="billing_thana_id"
                                                        name="billing_thana_id" data-toggle="select2" required>
                                                        <option value="">Select Billing Thana</option>
                                                        <!-- Options will be loaded dynamically -->
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <!-- Post Code -->
                                                <div class="col-md-6">
                                                    <input type="text" name="billing_post_code" id="billing_post_code"
                                                        value="@if ($billingAddress) {{ $billingAddress->post_code }} @endif"
                                                        placeholder="Post Code (Optional)"
                                                        class="form-control shipping_input mb-2">
                                                </div>

                                                <!-- Country -->
                                                <div class="col-md-6">
                                                    <input type="text" name="billing_country" id="billing_country"
                                                        value="@if ($billingAddress) {{ $billingAddress->country }} @endif"
                                                        @if ((isset($billingAddress) && $billingAddress->country == '') || !isset($billingAddress)) style="border: 1px solid #b500008c;" @endif
                                                        placeholder="Country Name" class="form-control shipping_input">
                                                </div>
                                            </div>
                                        </div>
                                        <div id="same_billing_message" class="text-muted">
                                            <small><i class="fas fa-info-circle me-1"></i> Billing address will be the same
                                                as shipping address</small>
                                        </div>
                                    </div>
                                </div>

                                @if ($userInfo)
                                    <div class="card shadow-sm mt-3">
                                        <div class="card-header bg-light py-2">
                                            <h6 class="mb-0 fw-bold">User Account Info</h6>
                                        </div>
                                        <div class="card-body py-2">
                                            <p class="mb-1">{{ $userInfo->name }}</p>
                                            @if ($userInfo->email)
                                                <p class="mb-1">{{ $userInfo->email }}</p>
                                            @endif
                                            @if ($userInfo->phone)
                                                <p class="mb-1">{{ $userInfo->phone }}</p>
                                            @endif
                                            @if ($userInfo->address)
                                                <p class="mb-0">{{ $userInfo->address }}</p>
                                            @endif
                                        </div>
                                    </div>
                                @endif
                                {{-- delivery method --}}
                                <p class="mb-1"><strong>Delivery Method: </strong>
                                    <select name="delivery_method" class="form-control" required>
                                        <option value="">Select Delivery Method</option>
                                        <option value="1" @if ($order->delivery_method == 1) selected @endif>Home
                                            Delivery</option>
                                        <option value="2" @if ($order->delivery_method == 2) selected @endif>Store
                                            Pickup</option>
                                    </select>
                                </p>
                            </div>
                        </div>

                        <script>
                            document.addEventListener('DOMContentLoaded', function() {
                                const differentBillingCheckbox = document.getElementById('different_billing');
                                const billingFormContainer = document.getElementById('billing_form_container');
                                const sameBillingMessage = document.getElementById('same_billing_message');

                                // Get district and thana elements
                                const shippingDistrictSelect = document.getElementById('shipping_district_id');
                                const shippingThanaSelect = document.getElementById('shipping_thana_id');
                                const billingDistrictSelect = document.getElementById('billing_district_id');
                                const billingThanaSelect = document.getElementById('billing_thana_id');

                                // Add event listener for the checkbox
                                differentBillingCheckbox.addEventListener('change', function() {
                                    if (this.checked) {
                                        // Show billing form when "Different from shipping address" is checked
                                        billingFormContainer.style.display = 'block';
                                        sameBillingMessage.style.display = 'none';

                                        // Initialize billing fields with shipping values on first show
                                        copyShippingToBilling();
                                    } else {
                                        // Hide billing form when unchecked
                                        billingFormContainer.style.display = 'none';
                                        sameBillingMessage.style.display = 'block';
                                    }
                                });

                                // When shipping district changes, update billing district if using same address
                                shippingDistrictSelect.addEventListener('change', function() {
                                    // Update billing district if "Different from shipping" is checked and billing form is visible
                                    if (differentBillingCheckbox.checked && billingFormContainer.style.display === 'block') {
                                        // Set billing district to match shipping district
                                        billingDistrictSelect.value = this.value;

                                        // Trigger change event for Select2 and thana loading
                                        if (window.jQuery && window.jQuery.fn.select2) {
                                            jQuery(billingDistrictSelect).trigger('change');
                                        }

                                        // Wait for thanas to load before copying shipping thana to billing thana
                                        setTimeout(function() {
                                            if (shippingThanaSelect.selectedIndex >= 0 && billingThanaSelect.options
                                                .length > 1) {
                                                billingThanaSelect.value = shippingThanaSelect.value;

                                                if (window.jQuery && window.jQuery.fn.select2) {
                                                    jQuery(billingThanaSelect).trigger('change');
                                                }
                                            }
                                        }, 500); // 500ms delay to allow thanas to load
                                    }
                                });

                                // When shipping thana changes, update billing thana if using same address
                                shippingThanaSelect.addEventListener('change', function() {
                                    // Update billing thana if "Different from shipping" is checked and billing form is visible
                                    if (differentBillingCheckbox.checked && billingFormContainer.style.display === 'block') {
                                        if (billingThanaSelect.options.length > 1) {
                                            billingThanaSelect.value = this.value;

                                            if (window.jQuery && window.jQuery.fn.select2) {
                                                jQuery(billingThanaSelect).trigger('change');
                                            }
                                        }
                                    }
                                });

                                // Function to copy shipping values to billing
                                function copyShippingToBilling() {
                                    // Address
                                    document.getElementById('billing_address').value = document.getElementById('shipping_address')
                                        .value;

                                    // District
                                    if (shippingDistrictSelect.selectedIndex >= 0) {
                                        billingDistrictSelect.value = shippingDistrictSelect.value;

                                        // If using Select2, update the UI
                                        if (window.jQuery && window.jQuery.fn.select2) {
                                            jQuery(billingDistrictSelect).trigger('change');
                                        }

                                        // Wait for thanas to load before setting thana value
                                        setTimeout(function() {
                                            if (shippingThanaSelect.selectedIndex >= 0 && billingThanaSelect.options.length >
                                                1) {
                                                billingThanaSelect.value = shippingThanaSelect.value;

                                                if (window.jQuery && window.jQuery.fn.select2) {
                                                    jQuery(billingThanaSelect).trigger('change');
                                                }
                                            }
                                        }, 500); // 500ms delay to allow thanas to load
                                    }

                                    // Post Code
                                    document.getElementById('billing_post_code').value = document.getElementById('shipping_post_code')
                                        .value;

                                    // Country
                                    document.getElementById('billing_country').value = document.getElementById('shipping_country')
                                        .value;
                                }

                                // Create hidden inputs to store shipping info for billing when form is submitted
                                const form = document.querySelector('form');
                                form.addEventListener('submit', function(e) {
                                    if (!differentBillingCheckbox.checked) {
                                        // If billing is same as shipping, create hidden inputs with shipping values
                                        const shippingAddress = document.getElementById('shipping_address').value;
                                        const shippingDistrict = document.getElementById('shipping_district_id').value;
                                        const shippingThana = document.getElementById('shipping_thana_id').value;
                                        const shippingPostCode = document.getElementById('shipping_post_code').value;
                                        const shippingCountry = document.getElementById('shipping_country').value;

                                        // Create or update hidden fields
                                        createOrUpdateHidden('billing_address_hidden', 'billing_address', shippingAddress);
                                        createOrUpdateHidden('billing_district_id_hidden', 'billing_district_id',
                                            shippingDistrict);
                                        createOrUpdateHidden('billing_thana_id_hidden', 'billing_thana_id', shippingThana);
                                        createOrUpdateHidden('billing_post_code_hidden', 'billing_post_code', shippingPostCode);
                                        createOrUpdateHidden('billing_country_hidden', 'billing_country', shippingCountry);
                                    }
                                });

                                function createOrUpdateHidden(id, name, value) {
                                    let hiddenField = document.getElementById(id);
                                    if (!hiddenField) {
                                        hiddenField = document.createElement('input');
                                        hiddenField.type = 'hidden';
                                        hiddenField.id = id;
                                        hiddenField.name = name;
                                        form.appendChild(hiddenField);
                                    }
                                    hiddenField.value = value;
                                }
                            });
                        </script>
                        {{-- end update billing address and shipping address --}}

                        <div class="mt-4 mb-4">
                            <div class="text-right">
                                <button type="submit" class="btn btn-primary waves-effect waves-light"><i
                                        class="fas fa-save"></i> Update Order</button>
                                <a href="{{ url('/order/details') }}/{{ $order->slug }}"
                                    class="btn btn-danger waves-effect waves-light"><i class="mdi mdi-cancel"></i>
                                    Cancel</a>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
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
                                                    <option value="6"
                                                        @if ($order->order_status == 6) selected @endif
                                                        @if ($order->order_status == 3 || $order->order_status == 4) disabled @endif>Courier Assigned
                                                    </option>
                                                    <option value="7"
                                                        @if ($order->order_status == 7) selected @endif
                                                        @if ($order->order_status == 0 || $order->order_status == 1 || $order->order_status == 5) disabled @endif>Return Request
                                                    </option>
                                                    <option value="8"
                                                        @if ($order->order_status == 8) selected @endif
                                                        @if ($order->order_status == 0 || $order->order_status == 1 || $order->order_status == 5) disabled @endif>Returned
                                                    </option>
                                                    <option value="9"
                                                        @if ($order->order_status == 9) selected @endif
                                                        @if ($order->order_status == 0 || $order->order_status == 1 || $order->order_status == 2 || $order->order_status == 4) disabled @endif>Completed
                                                    </option>
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
                    @if (!in_array($order->order_status, [2, 3, 4, 5]))
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
                                    <form action="{{ url('add/order/payment') }}" method="POST">
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
                                                    <input class="form-control" type="text" value=""
                                                        name="tran_id" id="tran_id" required=""
                                                        placeholder="Enter TrxID">
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="form-group ">
                                                    <label for="amount">Amount (Due:
                                                        {{ number_format($order->total - $payments['total'], 2) }})<sup
                                                            style="color:red;">*</sup></label>
                                                    <input class="form-control" type="number" value=""
                                                        step="0.01" name="amount" id="amount" required=""
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

                                        <button type="submit" class="btn btn-primary rounded mt-1">Add
                                            Payment</button>
                                    </form>
                                    <div class="payment-history mt-4">
                                        <h5>Payment History</h5>
                                        <ul class="mb-0">
                                            @forelse ($payments['payments'] as $pay)
                                                <li>payment via {{ $pay->payment_through }} @if ($pay->tran_id)
                                                        (TrxID: {{ $pay->tran_id }})
                                                    @endif amount: {{ $pay->amount }} At
                                                    {{ date('d M Y', strtotime($pay->tran_date)) }}</li>
                                            @empty
                                                <p>No History Found</p>
                                            @endforelse
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endif

                    {{-- sms send --}}
                    <div class="card">
                        <div class="card-header" id="headingThree">
                            <h2 class="mb-0">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse"
                                    data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">

                                    <span> <i class="fa fa-sticky-note"></i>
                                        Send SMS
                                    </span>

                                    <div class="arrow"><i class="fas fa-chevron-right"></i></div>
                                </button>
                            </h2>
                        </div>
                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree"
                            data-parent="#accordionExample">
                            <div class="card-body">
                                <form class="needs-validation" method="POST" action="{{ url('send/sms/order') }}"
                                    enctype="multipart/form-data">
                                    @csrf
                                    <div class="form-group" style="margin-bottom: .8rem;">
                                        <label style="margin-bottom: .2rem; font-weight: 500;">Number(0171xxxxxxx)
                                            :</label>

                                        <input type="number" class="form-control" name="sms_receivers"
                                            value="{{ $shippingInfo->phone }}">
                                    </div>
                                    <div class="form-group">
                                        <label for="template_id">Select SMS Template</label>
                                        <select name="template_id" onchange="fetchTemplateDescription(this.value)"
                                            class="form-control" id="template_id">
                                            @php
                                                echo App\Models\SmsTemplate::getDropDownList('title');
                                            @endphp
                                        </select>
                                        <div class="invalid-feedback" style="display: block;">
                                            @error('template_id')
                                                {{ $message }}
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="template_description">SMS Template Description <span
                                                class="text-danger">*</span></label>
                                        <textarea id="template_description" name="template_description" class="form-control" style="height: 217px;"
                                            placeholder="Write SMS Here" required></textarea>
                                        <div class="invalid-feedback" style="display: block;">
                                            @error('template_description')
                                                {{ $message }}
                                            @enderror
                                        </div>
                                        <div class="d-flex justify-content-between mt-1">
                                            <small id="charCount" class="text-muted">0 characters</small>
                                            <small id="smsCount" class="text-muted">0 SMS (160 chars per SMS)</small>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary rounded mt-2">Send SMS</button>
                                </form>
                            </div>
                        </div>
                    </div>

                    <script>
                        document.addEventListener('DOMContentLoaded', function() {
                            const smsText = document.getElementById('template_description');
                            const charCount = document.getElementById('charCount');
                            const smsCount = document.getElementById('smsCount');

                            // Standard SMS length is 160 characters
                            const SMS_LENGTH = 160;
                            // For multipart SMS, each part can hold slightly less due to overhead
                            const MULTIPART_SMS_LENGTH = 153;

                            function updateCounter() {
                                const length = smsText.value.length;

                                // Update character count
                                charCount.textContent = length + ' characters';

                                // Calculate SMS count
                                let smsRequired;
                                if (length <= SMS_LENGTH) {
                                    smsRequired = length > 0 ? 1 : 0;
                                    smsCount.textContent = smsRequired + ' SMS (' + SMS_LENGTH + ' chars per SMS)';
                                } else {
                                    // For multipart SMS
                                    smsRequired = Math.ceil(length / MULTIPART_SMS_LENGTH);
                                    smsCount.textContent = smsRequired + ' SMS (' + MULTIPART_SMS_LENGTH + ' chars per SMS part)';
                                }

                                // Change color based on length
                                if (length > SMS_LENGTH) {
                                    charCount.classList.add('text-warning');
                                } else {
                                    charCount.classList.remove('text-warning');
                                }

                                if (smsRequired > 1) {
                                    smsCount.classList.add('text-warning');
                                } else {
                                    smsCount.classList.remove('text-warning');
                                }
                            }

                            // Add event listeners
                            smsText.addEventListener('input', updateCounter);
                            smsText.addEventListener('keyup', updateCounter);

                            // Initialize counter
                            updateCounter();
                        });
                    </script>

                    <script>
                        function fetchTemplateDescription(value) {
                            var templateId = value;

                            $.ajax({
                                url: "{{ url('/get/template/description') }}",
                                type: "POST",
                                data: {
                                    template_id: templateId,
                                    _token: '{{ csrf_token() }}'
                                },
                                dataType: 'json',
                                success: function(result) {
                                    // console.log(result.description);
                                    $("#template_description").html(result.description)
                                }
                            });
                        }
                    </script>
                    {{-- end sms send --}}

                </div>
            </div>
        </div>
    </div>
    </div>
@endsection

@section('footer_js')
    <script src="{{ url('assets') }}/plugins/select2/select2.min.js"></script>
    {{-- <script>
        $('[data-toggle="select2"]').select2();

        function fixRowNo(params) {
            var renum = 1;
            $("tr td strong").each(function() {
                $(this).text(renum);
                renum++;
            });
        }

        function removeRow(btndel) {
            if (typeof(btndel) == "object") {
                $(btndel).closest("tr").remove();
            } else {
                return false;
            }
            fixRowNo();
            orderAmountCalculation();
        }

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        function addAnotherProduct() {
            $(".addAnotherItem").html("Adding...");
            var renum = 1;
            $("tr td strong").each(function() {
                renum++;
            });

            $.ajax({
                data: {
                    rowno: renum,
                    _token: '{{ csrf_token() }}'
                },
                url: "{{ url('/add/more/product') }}",
                type: "POST",
                dataType: 'json',
                success: function(data) {
                    $(".addAnotherItem").html("Added");
                    $("#orderDetailsTable tbody").append(data.more);
                    fixRowNo();
                    $(".addAnotherItem").html("<strong>+ Add More Product</strong>");
                    $('[data-toggle="select2"]').select2(); // initiate select2 for newly added row
                    orderAmountCalculation(); // Calculate totals after adding product
                },
                error: function(data) {
                    console.log('Error:', data);
                    $(".addAnotherItem").html("Something Went Wrong");
                }
            });
        }

        function getProductVariants(value) {
            var productId = value;
            var renum = 0;
            $("tr td strong").each(function() {
                renum++;
            });
            $("#product_variant_id_" + renum).html('');

            $.ajax({
                url: "{{ url('/get/product/variants') }}",
                type: "POST",
                data: {
                    product_id: productId,
                    _token: '{{ csrf_token() }}'
                },
                dataType: 'json',
                success: function(result) {

                    $('#product_variant_id_' + renum).html('<option value="">Select Variant</option>');

                    if (Array.isArray(result)) {
                        console.log("Has Variant");

                        $.each(result, function(key, value) {
                            $optionStr = "(" + value.variant_stock + ") ";
                            if (value.color_name)
                                $optionStr += value.color_name;
                            if (value.size_name)
                                $optionStr += " | " + value.size_name;
                            if (value.ram && value.rom)
                                $optionStr += " | " + value.ram + '/' + value.rom;
                            if (value.region_name)
                                $optionStr += " | " + value.region_name;
                            if (value.sim_name)
                                $optionStr += " | " + value.sim_name;
                            if (value.device_condition)
                                $optionStr += " | " + value.device_condition;
                            if (value.warrrenty)
                                $optionStr += " | " + value.warrrenty;

                            var price = 0;
                            if (value.discounted_price > 0)
                                price = Number(value.discounted_price);
                            else
                                price = Number(value.price);

                            $("#product_variant_id_" + renum).append('<option value="' + value.id +
                                '" color_id="' + value.color_id + '" size_id="' + value.size_id +
                                '" storage_id="' + value.storage_type_id + '" region_id="' + value
                                .region_id + '" sim_id="' + value.sim_id + '" warrenty_id="' + value
                                .warrenty_id + '" device_condition_id="' + value
                                .device_condition_id + '" price="' + price + '" unit_name="' + value
                                .unit_name + '" unit_id="' + value.unit_id + '" stock="' + value
                                .variant_stock + '">' + $optionStr + '</option>');
                        });

                        orderAmountCalculation();

                    } else {
                        console.log("Dont Have any Variant");
                        $('#product_variant_id_' + renum).html(
                            '<option value="">Dont Have Any Variant</option>');

                        if (result.stock <= 0) {
                            toastr.error("Stock Out");
                            $("#unit_text_" + renum).html(result.unit_name);
                            $("#unit_" + renum).val(result.unit_id);
                            $("#qty_" + renum).attr("max", result.stock);
                            $("#qty_" + renum).val("");
                            $("#unit_price_" + renum).val("");
                            $("#total_price_" + renum).val("");
                            return false;
                        }

                        var price = 0;
                        if (result.discount_price > 0)
                            price = Number(result.discount_price);
                        else
                            price = Number(result.price);

                        $("#unit_text_" + renum).html(result.unit_name);
                        $("#unit_" + renum).val(result.unit_id);
                        $("#qty_" + renum).attr("max", result.stock);
                        $("#qty_" + renum).val(1);
                        $("#unit_price_" + renum).val(price);
                        $("#total_price_" + renum).val(price);

                        // variant attributes will be null
                        $("#color_id_" + renum).val("");
                        $("#storage_id_" + renum).val("");
                        $("#region_id_" + renum).val("");
                        $("#sim_id_" + renum).val("");
                        $("#warrenty_id_" + renum).val("");
                        $("#device_condition_id_" + renum).val("");

                        orderAmountCalculation();
                    }
                }
            });
        }

        function productVariantInfo(id) {
            var price = $('#product_variant_id_' + id + ' option:selected').attr('price');
            var unit_name = $('#product_variant_id_' + id + ' option:selected').attr('unit_name');
            var unit_id = $('#product_variant_id_' + id + ' option:selected').attr('unit_id');
            var stock = $('#product_variant_id_' + id + ' option:selected').attr('stock');

            $("#unit_text_" + id).html(unit_name);
            $("#unit_" + id).val(unit_id);
            $("#qty_" + id).attr("max", stock);
            $("#qty_" + id).val(1);
            $("#unit_price_" + id).val(price);
            $("#total_price_" + id).val(price);

            var color_id = $('#product_variant_id_' + id + ' option:selected').attr('color_id');
            var size_id = $('#product_variant_id_' + id + ' option:selected').attr('size_id');
            var storage_id = $('#product_variant_id_' + id + ' option:selected').attr('storage_id');
            var region_id = $('#product_variant_id_' + id + ' option:selected').attr('region_id');
            var sim_id = $('#product_variant_id_' + id + ' option:selected').attr('sim_id');
            var warrenty_id = $('#product_variant_id_' + id + ' option:selected').attr('warrenty_id');
            var device_condition_id = $('#product_variant_id_' + id + ' option:selected').attr('device_condition_id');

            $("#color_id_" + id).val(color_id);
            $("#size_id_" + id).val(size_id);
            $("#storage_id_" + id).val(storage_id);
            $("#region_id_" + id).val(region_id);
            $("#sim_id_" + id).val(sim_id);
            $("#warrenty_id_" + id).val(warrenty_id);
            $("#device_condition_id_" + id).val(device_condition_id);

            orderAmountCalculation();
        }

        function changeTotalPrice(id) {
            var unitPrice = $("#unit_price_" + id).val();
            var qty = $("#qty_" + id).val();
            $("#total_price_" + id).val(unitPrice * qty);
            orderAmountCalculation();
        }

        function orderAmountCalculation() {
            // Calculate subtotal from all product totals
            var orderSubtotal = 0;
            $(".orderT").each(function() {
                orderSubtotal = Number(orderSubtotal) + Number($(this).val() || 0);
            });

            // Get values for discount, VAT/tax, and delivery charge from your HTML
            var orderDiscount = 0;
            if ($("#order_discount").length) {
                orderDiscount = Number($("#order_discount").html() || 0);
            } else {
                // Try to get from the discount display in the HTML
                var discountText = $("p:contains('Discount')").text();
                if (discountText) {
                    var discountMatch = discountText.match(/[\d,.]+/);
                    if (discountMatch) {
                        orderDiscount = Number(discountMatch[0].replace(/,/g, '') || 0);
                    }
                }
            }

            var orderVatTax = 0;
            if ($("#vat_tax_amount").length) {
                orderVatTax = Number($("#vat_tax_amount").val() || 0);
            } else {
                // Try to get from the VAT/TAX display in the HTML
                var vatTaxText = $("p:contains('VAT/TAX')").text();
                if (vatTaxText) {
                    var vatTaxMatch = vatTaxText.match(/[\d,.]+/);
                    if (vatTaxMatch) {
                        orderVatTax = Number(vatTaxMatch[0].replace(/,/g, '') || 0);
                    }
                }
            }

            var orderDeliveryCharge = 0;
            if ($("#delivery_charge_amount").length) {
                orderDeliveryCharge = Number($("#delivery_charge_amount").val() || 0);
            } else {
                // Try to get from the Delivery Charge display in the HTML
                var deliveryText = $("p:contains('Delivery Charge')").text();
                if (deliveryText) {
                    var deliveryMatch = deliveryText.match(/[\d,.]+/);
                    if (deliveryMatch) {
                        orderDeliveryCharge = Number(deliveryMatch[0].replace(/,/g, '') || 0);
                    }
                }
            }

            // Format for display (add commas for thousands)
            var formattedSubtotal = orderSubtotal.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ",");

            // Update subtotal display - try different selectors
            if ($("#order_sub_total").length) {
                $("#order_sub_total").html(formattedSubtotal);
            } else {
                // Find the subtotal element in the page and update it
                $("p:contains('Sub-total')").each(function() {
                    // Get the currency symbol
                    var currencySymbol = $(this).text().match(/[^\w\s.,]/)[0] || '';
                    // Replace only the number part
                    $(this).html('<b>Sub-total :</b> ' + currencySymbol + ' ' + formattedSubtotal);
                });
            }

            // Calculate total
            var totalAmount = Number(orderSubtotal) - Number(orderDiscount) + Number(orderVatTax) + Number(
                orderDeliveryCharge);
            var formattedTotal = totalAmount.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ",");

            // Update total display - try different selectors
            if ($("#order_total").length) {
                $("#order_total").html(formattedTotal);
            } else {
                // Find the total element in the page and update it
                $("p:contains('Total Order Amount')").each(function() {
                    // Get the currency symbol
                    var currencySymbol = $(this).text().match(/[^\w\s.,]/)[0] || '';
                    // Replace only the number part
                    $(this).html('<b>Total Order Amount :</b> ' + currencySymbol + ' ' + formattedTotal);
                });
            }

            // Update due amount if it exists
            var paidAmount = 0;
            var paidText = $("p:contains('Paid Amount')").text();
            if (paidText && !paidText.includes('Full Paid')) {
                var paidMatch = paidText.match(/[\d,.]+/);
                if (paidMatch) {
                    paidAmount = Number(paidMatch[0].replace(/,/g, '') || 0);
                }
            }

            var dueAmount = totalAmount - paidAmount;

            if (dueAmount > 0) {
                var formattedDueAmount = dueAmount.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                var currencySymbol = $("p:contains('Due Amount')").text().match(/[^\w\s.,]/)[0] || '';

                $("p:contains('Due Amount')").find("span").html(formattedDueAmount);
            }

            // Store values for form submission if needed
            if ($("#sub_total_field").length) {
                $("#sub_total_field").val(orderSubtotal.toFixed(2));
            }

            if ($("#total_field").length) {
                $("#total_field").val(totalAmount.toFixed(2));
            }
        }

        // Make sure totals are calculated when the page loads
        $(document).ready(function() {
            // Calculate initial totals
            setTimeout(orderAmountCalculation, 500);

            // Add event listener for quantity changes
            $(document).on('change', 'input[name="qty[]"]', function() {
                var id = $(this).attr('id').split('_')[1];
                changeTotalPrice(id);
            });
        });
    </script> --}}
    <script>
        $('[data-toggle="select2"]').select2();

        function fixRowNo(params) {
            var renum = 1;
            $("tr td strong").each(function() {
                $(this).text(renum);
                renum++;
            });
        }

        function removeRow(btndel) {
            if (typeof(btndel) == "object") {
                $(btndel).closest("tr").remove();
            } else {
                return false;
            }
            fixRowNo();
            orderAmountCalculation();
        }

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        function addAnotherProduct() {
            $(".addAnotherItem").html("Adding...");
            var renum = 1;
            $("tr td strong").each(function() {
                renum++;
            });

            $.ajax({
                data: {
                    rowno: renum,
                    _token: '{{ csrf_token() }}'
                },
                url: "{{ url('/add/more/product') }}",
                type: "POST",
                dataType: 'json',
                success: function(data) {
                    $(".addAnotherItem").html("Added");
                    $("#orderDetailsTable tbody").append(data.more);
                    fixRowNo();
                    $(".addAnotherItem").html("<strong>+ Add More Product</strong>");
                    $('[data-toggle="select2"]').select2(); // initiate select2 for newly added row
                    orderAmountCalculation(); // Calculate totals after adding product
                },
                error: function(data) {
                    console.log('Error:', data);
                    $(".addAnotherItem").html("Something Went Wrong");
                }
            });
        }

        function getProductVariants(value) {
            var productId = value;
            var renum = 0;
            $("tr td strong").each(function() {
                renum++;
            });
            $("#product_variant_id_" + renum).html('');

            $.ajax({
                url: "{{ url('/get/product/variants') }}",
                type: "POST",
                data: {
                    product_id: productId,
                    _token: '{{ csrf_token() }}'
                },
                dataType: 'json',
                success: function(result) {

                    $('#product_variant_id_' + renum).html('<option value="">Select Variant</option>');

                    if (Array.isArray(result)) {
                        console.log("Has Variant");

                        $.each(result, function(key, value) {
                            $optionStr = "(" + value.variant_stock + ") ";
                            if (value.color_name)
                                $optionStr += value.color_name;
                            if (value.size_name)
                                $optionStr += " | " + value.size_name;
                            if (value.ram && value.rom)
                                $optionStr += " | " + value.ram + '/' + value.rom;
                            if (value.region_name)
                                $optionStr += " | " + value.region_name;
                            if (value.sim_name)
                                $optionStr += " | " + value.sim_name;
                            if (value.device_condition)
                                $optionStr += " | " + value.device_condition;
                            if (value.warrrenty)
                                $optionStr += " | " + value.warrrenty;

                            var price = 0;
                            if (value.discounted_price > 0)
                                price = Number(value.discounted_price);
                            else
                                price = Number(value.price);

                            $("#product_variant_id_" + renum).append('<option value="' + value.id +
                                '" color_id="' + value.color_id + '" size_id="' + value.size_id +
                                '" storage_id="' + value.storage_type_id + '" region_id="' + value
                                .region_id + '" sim_id="' + value.sim_id + '" warrenty_id="' + value
                                .warrenty_id + '" device_condition_id="' + value
                                .device_condition_id + '" price="' + price + '" unit_name="' + value
                                .unit_name + '" unit_id="' + value.unit_id + '" stock="' + value
                                .variant_stock + '">' + $optionStr + '</option>');
                        });

                        orderAmountCalculation();

                    } else {
                        console.log("Dont Have any Variant");
                        $('#product_variant_id_' + renum).html(
                            '<option value="">Dont Have Any Variant</option>');

                        if (result.stock <= 0) {
                            toastr.error("Stock Out");
                            $("#unit_text_" + renum).html(result.unit_name);
                            $("#unit_" + renum).val(result.unit_id);
                            $("#qty_" + renum).attr("max", result.stock);
                            $("#qty_" + renum).val("");
                            $("#unit_price_" + renum).val("");
                            $("#total_price_" + renum).val("");
                            return false;
                        }

                        var price = 0;
                        if (result.discount_price > 0)
                            price = Number(result.discount_price);
                        else
                            price = Number(result.price);

                        $("#unit_text_" + renum).html(result.unit_name);
                        $("#unit_" + renum).val(result.unit_id);
                        $("#qty_" + renum).attr("max", result.stock);
                        $("#qty_" + renum).val(1);
                        $("#unit_price_" + renum).val(price);
                        $("#total_price_" + renum).val(price);

                        // variant attributes will be null
                        $("#color_id_" + renum).val("");
                        $("#storage_id_" + renum).val("");
                        $("#region_id_" + renum).val("");
                        $("#sim_id_" + renum).val("");
                        $("#warrenty_id_" + renum).val("");
                        $("#device_condition_id_" + renum).val("");

                        orderAmountCalculation();
                    }
                }
            });
        }

        function productVariantInfo(id) {
            var price = $('#product_variant_id_' + id + ' option:selected').attr('price');
            var unit_name = $('#product_variant_id_' + id + ' option:selected').attr('unit_name');
            var unit_id = $('#product_variant_id_' + id + ' option:selected').attr('unit_id');
            var stock = $('#product_variant_id_' + id + ' option:selected').attr('stock');

            $("#unit_text_" + id).html(unit_name);
            $("#unit_" + id).val(unit_id);
            $("#qty_" + id).attr("max", stock);
            $("#qty_" + id).val(1);
            $("#unit_price_" + id).val(price);
            $("#total_price_" + id).val(price);

            var color_id = $('#product_variant_id_' + id + ' option:selected').attr('color_id');
            var size_id = $('#product_variant_id_' + id + ' option:selected').attr('size_id');
            var storage_id = $('#product_variant_id_' + id + ' option:selected').attr('storage_id');
            var region_id = $('#product_variant_id_' + id + ' option:selected').attr('region_id');
            var sim_id = $('#product_variant_id_' + id + ' option:selected').attr('sim_id');
            var warrenty_id = $('#product_variant_id_' + id + ' option:selected').attr('warrenty_id');
            var device_condition_id = $('#product_variant_id_' + id + ' option:selected').attr('device_condition_id');

            $("#color_id_" + id).val(color_id);
            $("#size_id_" + id).val(size_id);
            $("#storage_id_" + id).val(storage_id);
            $("#region_id_" + id).val(region_id);
            $("#sim_id_" + id).val(sim_id);
            $("#warrenty_id_" + id).val(warrenty_id);
            $("#device_condition_id_" + id).val(device_condition_id);

            orderAmountCalculation();
        }

        function changeTotalPrice(id) {
            var unitPrice = $("#unit_price_" + id).val();
            var qty = $("#qty_" + id).val();
            $("#total_price_" + id).val(unitPrice * qty);
            orderAmountCalculation();
        }

        function updateDeliveryCharge() {
            var deliveryMethod = $("select[name='delivery_method']").val();
            var currencySymbol = $("p:contains('Delivery Charge')").text().match(/[^\w\s.,]/)[0] || '';

            // Set delivery charge based on delivery method
            var deliveryCharge = 0;

            if (deliveryMethod == "2") {
                // Store Pickup - always zero
                deliveryCharge = 0;
            } else {
                // For other methods, use district-based or default charge
                if ($("#shipping_district_id").length && $("#shipping_district_id").val()) {
                    var selectedDistrict = $("#shipping_district_id option:selected");
                    if (selectedDistrict.length && selectedDistrict.data('delivery-charge')) {
                        deliveryCharge = parseFloat(selectedDistrict.data('delivery-charge'));
                    } else {
                        deliveryCharge = 100; // Default delivery charge
                    }
                } else {
                    // Get from existing display if available
                    var deliveryText = $("p:contains('Delivery Charge')").text();
                    if (deliveryText) {
                        var deliveryMatch = deliveryText.match(/[\d,.]+/);
                        if (deliveryMatch) {
                            deliveryCharge = Number(deliveryMatch[0].replace(/,/g, '') || 100);
                        } else {
                            deliveryCharge = 100; // Default if can't extract
                        }
                    } else {
                        deliveryCharge = 100; // Default
                    }
                }
            }

            // Update the display
            var formattedCharge = deliveryCharge.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            $("p:contains('Delivery Charge')").each(function() {
                $(this).html('<b>Delivery Charge :</b> ' + currencySymbol + ' ' + formattedCharge);
            });

            // Add/update hidden input for delivery_fee
            if ($("input[name='delivery_fee']").length === 0) {
                $("form[action*='order/update']").append('<input type="hidden" name="delivery_fee" value="' +
                    deliveryCharge + '">');
            } else {
                $("input[name='delivery_fee']").val(deliveryCharge);
            }

            // Recalculate order totals
            orderAmountCalculation();

            return deliveryCharge;
        }

        function orderAmountCalculation() {
            // Calculate subtotal from all product totals
            var orderSubtotal = 0;
            $(".orderT").each(function() {
                orderSubtotal = Number(orderSubtotal) + Number($(this).val() || 0);
            });

            // Get values for discount, VAT/tax, and delivery charge from your HTML
            var orderDiscount = 0;
            if ($("#order_discount").length) {
                orderDiscount = Number($("#order_discount").html() || 0);
            } else {
                // Try to get from the discount display in the HTML
                var discountText = $("p:contains('Discount')").text();
                if (discountText) {
                    var discountMatch = discountText.match(/[\d,.]+/);
                    if (discountMatch) {
                        orderDiscount = Number(discountMatch[0].replace(/,/g, '') || 0);
                    }
                }
            }

            var orderVatTax = 0;
            if ($("#vat_tax_amount").length) {
                orderVatTax = Number($("#vat_tax_amount").val() || 0);
            } else {
                // Try to get from the VAT/TAX display in the HTML
                var vatTaxText = $("p:contains('VAT/TAX')").text();
                if (vatTaxText) {
                    var vatTaxMatch = vatTaxText.match(/[\d,.]+/);
                    if (vatTaxMatch) {
                        orderVatTax = Number(vatTaxMatch[0].replace(/,/g, '') || 0);
                    }
                }
            }

            // Check current delivery method and set charge
            var deliveryMethod = $("select[name='delivery_method']").val();
            var orderDeliveryCharge = 0;

            if (deliveryMethod == "2") { // Store Pickup
                orderDeliveryCharge = 0;
            } else {
                // For other methods, get the current displayed value
                var deliveryText = $("p:contains('Delivery Charge')").text();
                if (deliveryText) {
                    var deliveryMatch = deliveryText.match(/[\d,.]+/);
                    if (deliveryMatch) {
                        orderDeliveryCharge = Number(deliveryMatch[0].replace(/,/g, '') || 0);
                    }
                }

                // If there's a delivery fee input, use that
                if ($("input[name='delivery_fee']").length) {
                    orderDeliveryCharge = Number($("input[name='delivery_fee']").val() || 0);
                }
            }

            // Format for display (add commas for thousands)
            var formattedSubtotal = orderSubtotal.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ",");

            // Update subtotal display - try different selectors
            if ($("#order_sub_total").length) {
                $("#order_sub_total").html(formattedSubtotal);
            } else {
                // Find the subtotal element in the page and update it
                $("p:contains('Sub-total')").each(function() {
                    // Get the currency symbol
                    var currencySymbol = $(this).text().match(/[^\w\s.,]/)[0] || '';
                    // Replace only the number part
                    $(this).html('<b>Sub-total :</b> ' + currencySymbol + ' ' + formattedSubtotal);
                });
            }

            // Calculate total
            var totalAmount = Number(orderSubtotal) - Number(orderDiscount) + Number(orderVatTax) + Number(
                orderDeliveryCharge);
            var formattedTotal = totalAmount.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ",");

            // Update total display - try different selectors
            if ($("#order_total").length) {
                $("#order_total").html(formattedTotal);
            } else {
                // Find the total element in the page and update it
                $("p:contains('Total Order Amount')").each(function() {
                    // Get the currency symbol
                    var currencySymbol = $(this).text().match(/[^\w\s.,]/)[0] || '';
                    // Replace only the number part
                    $(this).html('<b>Total Order Amount :</b> ' + currencySymbol + ' ' + formattedTotal);
                });
            }

            // Update due amount if it exists
            var paidAmount = 0;
            var paidText = $("p:contains('Paid Amount')").text();
            if (paidText && !paidText.includes('Full Paid')) {
                var paidMatch = paidText.match(/[\d,.]+/);
                if (paidMatch) {
                    paidAmount = Number(paidMatch[0].replace(/,/g, '') || 0);
                }
            }

            var dueAmount = totalAmount - paidAmount;

            if (dueAmount > 0) {
                var formattedDueAmount = dueAmount.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                var currencySymbol = $("p:contains('Due Amount')").text().match(/[^\w\s.,]/)[0] || '';

                $("p:contains('Due Amount')").find("span").html(formattedDueAmount);
            }

            // Store values for form submission if needed
            if ($("#sub_total_field").length) {
                $("#sub_total_field").val(orderSubtotal.toFixed(2));
            }

            if ($("#total_field").length) {
                $("#total_field").val(totalAmount.toFixed(2));
            }

            // Make sure delivery_fee is updated in the form
            if ($("input[name='delivery_fee']").length === 0) {
                $("form[action*='order/update']").append('<input type="hidden" name="delivery_fee" value="' +
                    orderDeliveryCharge + '">');
            } else {
                $("input[name='delivery_fee']").val(orderDeliveryCharge);
            }
        }

        // Make sure totals are calculated when the page loads
        $(document).ready(function() {
            // Add event listener for delivery method change
            $("select[name='delivery_method']").on('change', function() {
                updateDeliveryCharge();
            });

            // Trigger updateDeliveryCharge on district change
            $("#shipping_district_id").on('change', function() {
                updateDeliveryCharge();
            });

            // Calculate initial totals with a delay to ensure DOM is ready
            setTimeout(function() {
                // First update delivery charge based on selected method
                updateDeliveryCharge();
                // Then calculate all order amounts
                orderAmountCalculation();
            }, 500);

            // Add event listener for quantity changes
            $(document).on('change', 'input[name="qty[]"]', function() {
                var id = $(this).attr('id').split('_')[1];
                changeTotalPrice(id);
            });
        });
    </script>
    <script>
        $(document).ready(function() {
            // Auto-update discount when the value changes
            // Manual discount handling - just updates the discount amount without affecting coupon
            // Apply coupon
            function applyCoupon() {
                var couponCode = $("#coupon_code").val();
                if (!couponCode) {
                    toastr.error("Please enter a coupon code");
                    return false;
                }

                // Change button state to loading
                var couponBtn = $("#couponBtn");
                var originalText = couponBtn.text();
                couponBtn.text("Applying...").prop("disabled", true);

                $.ajax({
                    url: "{{ route('validate.coupon') }}",
                    type: "POST",
                    data: {
                        coupon_code: couponCode,
                        order_id: $("input[name='order_id']").val(),
                        _token: "{{ csrf_token() }}"
                    },
                    dataType: 'json',
                    success: function(data) {
                        if (!data.valid) {
                            toastr.error(data.message);
                            couponBtn.text(originalText).prop("disabled", false);
                        } else {
                            toastr.success(data.message);

                            // Update discount display
                            var discountAmount = data.discount_amount;
                            var currencySymbol = $("p:contains('Discount')").text().match(/[^\w\s.,]/)[
                                0] || '';
                            var formattedDiscount = parseFloat(discountAmount).toFixed(0).replace(
                                /\B(?=(\d{3})+(?!\d))/g, ",");

                            // Update the display with the new discount and coupon code
                            if ($("p:contains('Discount')").length) {
                                $("p:contains('Discount')").html('<b>Discount (' + couponCode +
                                    '):</b> ' + currencySymbol + ' ' + formattedDiscount);
                            } else {
                                $("p:contains('Sub-total')").after('<p><b>Discount (' + couponCode +
                                    '):</b> ' + currencySymbol + ' ' + formattedDiscount + '</p>');
                            }

                            // Update discount input field to match
                            $("#discount").val(discountAmount);

                            // Recalculate total and due amount
                            orderAmountCalculation();

                            // Change button to Remove
                            couponBtn.text("Remove").removeClass("btn-success").addClass("btn-danger");
                            couponBtn.prop("onclick", null).off("click");
                            couponBtn.on("click", removeCoupon);
                            couponBtn.prop("disabled", false);
                        }
                    },
                    error: function(data) {
                        console.log('Error:', data);
                        couponBtn.text(originalText).prop("disabled", false);
                        toastr.error("Something went wrong. Please try again.");
                    }
                });
            }

            // Remove coupon
            function removeCoupon() {
                // Get any manual discount that might be set
                var manualDiscount = $("#discount").val() || 0;

                // Change button state to loading
                var couponBtn = $("#couponBtn");
                couponBtn.text("Removing...").prop("disabled", true);

                $.ajax({
                    url: "{{ route('remove.coupon') }}",
                    type: "POST",
                    data: {
                        order_id: $("input[name='order_id']").val(),
                        manual_discount: manualDiscount,
                        _token: "{{ csrf_token() }}"
                    },
                    dataType: 'json',
                    success: function(data) {
                        toastr.success(data.message);

                        // Update discount display - keep manual discount if any
                        var currencySymbol = $("p:contains('Discount')").text().match(/[^\w\s.,]/)[0] ||
                            '';
                        var formattedDiscount = parseFloat(manualDiscount).toFixed(0).replace(
                            /\B(?=(\d{3})+(?!\d))/g, ",");

                        // Update the display text without coupon code
                        $("p:contains('Discount')").html('<b>Discount:</b> ' + currencySymbol + ' ' +
                            formattedDiscount);

                        // Recalculate totals based on the manual discount
                        orderAmountCalculation();

                        // Clear coupon input
                        $("#coupon_code").val("");

                        // Change button back to Apply
                        couponBtn.text("Apply Coupon").removeClass("btn-danger").addClass(
                            "btn-success");
                        couponBtn.prop("onclick", null).off("click");
                        couponBtn.on("click", applyCoupon);
                        couponBtn.prop("disabled", false);
                    },
                    error: function(data) {
                        console.log('Error:', data);
                        couponBtn.text("Remove").prop("disabled", false);
                        toastr.error("Failed to remove coupon. Please try again.");
                    }
                });
            }

            // Handle manual discount input
            $("#discount").on('input', function() {
                var discountAmount = Number($(this).val()) || 0;

                // Only update if there's no coupon applied (check button text)
                if ($("#couponBtn").text() !== "Remove") {
                    // Update the display - find the currency symbol first
                    var currencySymbol = $("p:contains('Discount')").text().match(/[^\w\s.,]/)[0] || '';
                    var formattedDiscount = discountAmount.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ",");

                    // Update the display text
                    if ($("p:contains('Discount')").length) {
                        $("p:contains('Discount')").html('<b>Discount:</b> ' + currencySymbol + ' ' +
                            formattedDiscount);
                    } else {
                        $("p:contains('Sub-total')").after('<p><b>Discount:</b> ' + currencySymbol + ' ' +
                            formattedDiscount + '</p>');
                    }

                    // Recalculate totals
                    orderAmountCalculation();
                } else {
                    // Reset to previous value if coupon is applied
                    $(this).val($(this).data('previous-value') || 0);
                    toastr.warning("Please remove the coupon before changing the discount manually");
                }
            }).on('focus', function() {
                // Store the previous value when focusing
                $(this).data('previous-value', $(this).val());
            });

            // Initialize on document ready
            $(document).ready(function() {
                // Set up coupon button based on existing coupon
                if ($("#coupon_code").val()) {
                    $("#couponBtn").text("Remove").removeClass("btn-success").addClass("btn-danger");
                    $("#couponBtn").off("click").on("click", removeCoupon);
                } else {
                    $("#couponBtn").text("Apply Coupon").removeClass("btn-danger").addClass("btn-success");
                    $("#couponBtn").off("click").on("click", applyCoupon);
                }
            });
        });
    </script>

    <script>
        // Function to load thanas based on district selection
        function loadThanas(districtId, targetElementId, selectedThanaName = '') {
            if (!districtId) {
                $('#' + targetElementId).html('<option value="">Select Thana</option>');
                return;
            }

            $.ajax({
                url: "{{ url('/district/wise/thana') }}",
                type: "POST",
                data: {
                    district_id: districtId,
                    _token: '{{ csrf_token() }}'
                },
                dataType: 'json',
                success: function(result) {
                    $('#' + targetElementId).html('<option value="">Select Thana</option>');

                    if (result.data && result.data.length > 0) {
                        $.each(result.data, function(key, value) {
                            // Check if we need to select this option
                            var selected = '';
                            if (selectedThanaName && selectedThanaName === value.name) {
                                selected = 'selected';
                            }

                            $('#' + targetElementId).append('<option value="' + value.id + '" ' +
                                selected + '>' + value.name + '</option>');
                        });
                    }

                    // Refresh Select2
                    $('#' + targetElementId).trigger('change.select2');
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error:', error);
                    console.log('Response:', xhr.responseText);
                }
            });
        }

        // Document ready handler
        $(document).ready(function() {
            // Load current thana for shipping address if district is selected
            if ($("#shipping_district_id").val()) {
                loadThanas($("#shipping_district_id").val(), 'shipping_thana_id',
                    '{{ $shippingInfo->thana ?? '' }}');
            }

            // Load current thana for billing address if district is selected
            if ($("#billing_district_id").val()) {
                loadThanas($("#billing_district_id").val(), 'billing_thana_id',
                    '{{ $billingAddress->thana ?? '' }}');
            }

            // District change for shipping address
            $("#shipping_district_id").change(function() {
                var districtId = $(this).val();
                if (districtId) {
                    loadThanas(districtId, 'shipping_thana_id');

                    // Update delivery charge if available
                    var deliveryCharge = $(this).find('option:selected').data('delivery-charge') || 0;
                    $("#order_delivery_charge").text('{{ $currencySymbol }} ' + parseFloat(deliveryCharge)
                        .toFixed(2));

                    // Recalculate total
                    orderAmountCalculation();
                } else {
                    $('#shipping_thana_id').html('<option value="">Select Thana</option>');
                    $('#shipping_thana_id').trigger('change.select2');
                }
            });

            // District change for billing address
            $("#billing_district_id").change(function() {
                var districtId = $(this).val();
                if (districtId) {
                    loadThanas(districtId, 'billing_thana_id');
                } else {
                    $('#billing_thana_id').html('<option value="">Select Thana</option>');
                    $('#billing_thana_id').trigger('change.select2');
                }
            });
        });
    </script>
@endsection
