<!DOCTYPE html>
<html>

<head>
    @php
        $isSingleInvoice = count($orders) === 1;
        $titleSuffix =
            $isSingleInvoice && isset($orders[0])
                ? '-invoice-' . App\Models\Order::where('id', $orders[0]->id)->first()->order_no
                : '-invoice';
        $invoiceTitle = (isset($generalInfo->company_name) ? $generalInfo->company_name : '') . $titleSuffix;
    @endphp
    <title>{{ $invoiceTitle }}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 10px;
            color: #333;
            font-size: 11px;
            line-height: 1.2;
            margin: 0;
        }

        .page-break {
            page-break-before: always;
        }

        .invoice-container {
            max-width: 100%;
            margin: 0 auto;
        }

        /* Header Row */
        .header-row {
            display: flex;
            justify-content: space-between;
            border-bottom: 1px solid #ddd;
            padding-bottom: 5px;
            margin-bottom: 10px;
        }

        .company-info {
            flex: 1;
        }

        .logo-container {
            text-align: center;
            flex: 1;
        }

        .logo-container img {
            height: 35px;
        }

        .invoice-details {
            flex: 1;
            text-align: right;
        }

        /* Two Column Layout */
        .two-columns {
            display: flex;
            margin-bottom: 10px;
        }

        .left-column {
            flex: 1;
            padding-right: 10px;
        }

        .right-column {
            flex: 1;
            border-left: 1px solid #ddd;
            padding-left: 10px;
            text-align: right;
        }

        /* Order Meta */
        .order-meta-table {
            width: 100%;
        }

        .order-meta-table th {
            text-align: right;
            padding: 2px;
            font-weight: 600;
            width: 50%;
            font-size: 10px;
        }

        .order-meta-table td {
            padding: 2px;
            font-size: 10px;
            text-align: right;
        }

        /* Shipping Info */
        .shipping-info {
            margin-bottom: 15px;
        }

        /* Order Items Table */
        .order-items {
            width: 100%;
            border-collapse: collapse;
            font-size: 10px;
            margin-bottom: 10px;
        }

        .order-items th {
            background-color: #f5f5f5;
            padding: 4px;
            text-align: center;
            border: 1px solid #ddd;
        }

        .order-items td {
            padding: 4px;
            text-align: center;
            border: 1px solid #ddd;
            vertical-align: middle;
        }

        .product-cell {
            text-align: left;
        }

        .product-name {
            font-weight: bold;
            display: inline-block;
            vertical-align: middle;
        }

        .product-image {
            max-height: 40px;
            margin-right: 5px;
            vertical-align: middle;
        }

        /* Footer and Totals */
        .footer-row {
            display: flex;
            border-top: 1px solid #ddd;
            padding-top: 5px;
        }

        .order-notes {
            flex: 1;
            padding-right: 10px;
        }

        .order-totals {
            flex: 1;
            text-align: right;
        }

        .order-totals p {
            margin: 2px 0;
            line-height: 1.3;
        }

        /* Status Colors */
        .status-pending {
            color: #f0ad4e;
        }

        .status-approved,
        .status-intransit {
            color: #0275d8;
        }

        .status-delivered,
        .status-paid {
            color: #5cb85c;
        }

        .status-cancelled,
        .status-failed {
            color: #d9534f;
        }

        .status-unpaid {
            color: #f0ad4e;
        }

        /* Footer note */
        .footer-note {
            font-size: 9px;
            margin-top: 5px;
            text-align: center;
            border-top: 1px solid #ddd;
            padding-top: 5px;
        }

        @media print {
            .page-break {
                page-break-before: always;
            }
        }
    </style>
</head>

<body>
    @php
        // Fetch general info at the beginning to make sure it's available
$generalInfo = DB::table('general_infos')->first();
    @endphp

    @foreach ($orders as $order)
        @php
            // Get order and related details
            $orderInfo = App\Models\Order::where('id', $order->id)->first();
            $shippingInfo = App\Models\ShippingInfo::where('order_id', $order->id)->first();

            $configSetup = DB::table('config_setups')->get();

            // Get order details with products
            $orderDetails = DB::table('order_details')
                ->leftJoin('stores', 'order_details.store_id', 'stores.id')
                ->leftJoin('products', 'order_details.product_id', 'products.id')
                ->leftJoin('units', 'order_details.unit_id', 'units.id')
                ->select(
                    'order_details.*',
                    'stores.store_name',
                    'products.name as product_name',
                    'products.code as product_code',
                    'products.image as product_image',
                    'units.name as unit_name',
                )
                ->where('order_id', $order->id)
                ->get();

            // Calculate payments from the order_payments table - try without status filter
            $paymentTotal = DB::table('order_payments')->where('order_id', $order->id)->sum('amount');

            // Also get all payment records to check values
            $paymentRecords = DB::table('order_payments')->where('order_id', $order->id)->get();

            // For debugging, we'll check the actual sum
$manualSum = 0;
foreach ($paymentRecords as $record) {
    $manualSum += (float) $record->amount;
}

// Use the manual calculation if the query result is 0 but we have payments
$payments = [
    'total' => $paymentTotal > 0 ? $paymentTotal : $manualSum,
    'payments' => $paymentRecords,
            ];

        @endphp
        <div class="invoice-container">
            <!-- Header Row -->
            <div class="header-row">
                <div class="company-info">

                </div>
                <div class="logo-container">
                    @if (isset($generalInfo->logo) && file_exists(public_path($generalInfo->logo)))
                        <img src="{{ url($generalInfo->logo_dark) }}" alt="">
                    @endif
                </div>
                <div class="invoice-details">
                    <strong>Invoice #{{ $orderInfo->order_no }}</strong><br>
                    @if (isset($orderInfo->tracking_id) && !empty($orderInfo->tracking_id))
                        @php
                            // Parse the courier_details JSON if available
                            $courierDetails = null;
                            if (isset($orderInfo->courier_details) && !empty($orderInfo->courier_details)) {
                                $courierDetails = json_decode($orderInfo->courier_details, true);
                            }
                        @endphp

                        @if ($courierDetails && isset($courierDetails['consignment_id']))
                            <strong>SteadFast Parcel ID # {{ $courierDetails['consignment_id'] }}</strong><br>
                        @endif
                        <strong>SteadFast Tracking ID # {{ $orderInfo->tracking_id }}</strong><br>
                    @endif

                    @if ($orderInfo->total - $payments['total'] > 0)
                        <strong>DUE: {{ $currencySymbol }}
                            {{ number_format($orderInfo->total - $payments['total'], 0) }}</strong><br>
                    @endif

                    {{-- Payment Method:
                    @if ($orderInfo->payment_method == null)
                        Unpaid
                    @elseif($orderInfo->payment_method == 1)
                        COD
                    @elseif($orderInfo->payment_method == 2)
                        bKash
                    @elseif($orderInfo->payment_method == 3)
                        Nagad
                    @else
                        Card
                    @endif --}}
                </div>
            </div>

            <!-- Customer and Order Info -->
            <div class="two-columns">
                <!-- Left Column - Customer Info -->
                <div class="left-column">
                    @if (isset($shippingInfo))
                        <div class="shipping-info">
                            <strong>{{ $shippingInfo->full_name }}</strong><br>
                            @if (isset($shippingInfo->phone))
                                {{ $shippingInfo->phone }}<br>
                            @endif
                            @if (isset($shippingInfo->email))
                                {{ $shippingInfo->email }}<br>
                            @endif
                            {{ $shippingInfo->address }},
                            @if (isset($shippingInfo->thana))
                                , {{ $shippingInfo->thana }}
                            @endif,
                            {{ $shippingInfo->city }}@if (isset($shippingInfo->post_code))
                                -{{ $shippingInfo->post_code }}
                            @endif, {{ $shippingInfo->country }}
                        </div>
                    @endif
                </div>

                <!-- Right Column - Order Details -->
                <div class="right-column">
                    <table class="order-meta-table">
                        <tr>
                            <th>Invoice Created:</th>
                            <td>{{ date('M d Y, h:i A', strtotime($orderInfo->order_date)) }}</td>
                        </tr>
                        <tr>
                            <th>Preferred Delivery:</th>
                            <td>
                                @if (isset($orderInfo->delivery_date))
                                    {{ date('D M d, Y', strtotime($orderInfo->delivery_date)) }}
                                    @if (isset($orderInfo->time_slot))
                                        <br>{{ $orderInfo->time_slot }}
                                    @endif
                                @else
                                    Standard Delivery
                                @endif
                            </td>
                        </tr>

                        <tr>
                            <th>Payment Status:</th>
                            <td>
                                @if ($orderInfo->payment_status == 0)
                                    <span class="status-unpaid">Unpaid</span>
                                @elseif($orderInfo->payment_status == 1)
                                    <span class="status-paid">Paid</span>
                                @elseif($orderInfo->payment_status == 3)
                                    <span class="status-partial">Partial</span>
                                @else
                                    <span class="status-failed">Failed</span>
                                @endif
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <!-- Order Items -->
            <table class="order-items">
                <thead>
                    <tr>
                        <th>SL</th>
                        <th>NAME</th>
                        @if (env('MultiVendor') == true)
                            <th>STORE</th>
                        @endif
                        <th>PRICE</th>
                        <th>QTY</th>
                        <th>TOTAL</th>
                    </tr>
                </thead>
                <tbody>
                    @php $sl = 1; @endphp
                    @foreach ($orderDetails as $details)
                        @php
                            if ($details->color_id) {
                                $colorInfo = App\Models\Color::where('id', $details->color_id)->first();
                            }
                            if ($details->storage_id) {
                                $storageInfo = App\Models\StorageType::where('id', $details->storage_id)->first();
                            }
                            if ($details->sim_id) {
                                $simInfo = App\Models\Sim::where('id', $details->sim_id)->first();
                            }
                            if ($details->region_id) {
                                $regionInfo = DB::table('country')->where('id', $details->region_id)->first();
                            }
                            if ($details->warrenty_id) {
                                $warrentyInfo = App\Models\ProductWarrenty::where('id', $details->warrenty_id)->first();
                            }
                            if ($details->device_condition_id) {
                                $deviceCondition = App\Models\DeviceCondition::where(
                                    'id',
                                    $details->device_condition_id,
                                )->first();
                            }
                            if ($details->size_id) {
                                $productSize = App\Models\ProductSize::where('id', $details->size_id)->first();
                            }
                        @endphp

                        @if ($details->total_price > 0)
                            <tr>
                                <td>{{ $sl++ }}</td>
                                <td class="product-cell left-column" style="text-align: left">
                                    @if (isset($details->product_image) && file_exists(public_path($details->product_image)))
                                        <img src="{{ url($details->product_image) }}" class="product-image"
                                            alt="product-image">
                                    @endif
                                    <span class="product-name">{{ $details->product_name }} <br>
                                        @if (isset($productSize))
                                            {{ $configSetup[0]->name }}: {{ $productSize->name }}
                                        @endif
                                        @if (isset($colorInfo))
                                            | {{ $configSetup[6]->name }}: {{ $colorInfo->name }}
                                        @endif
                                        @if (isset($storageInfo))
                                            | {{ $configSetup[1]->name }}: {{ $storageInfo->name }}
                                        @endif
                                        @if (isset($simInfo))
                                            | {{ $configSetup[2]->name }}: {{ $simInfo->name }}
                                        @endif
                                        @if (isset($regionInfo))
                                            | {{ $configSetup[5]->name }}: {{ $regionInfo->name }}
                                        @endif
                                        @if (isset($warrentyInfo))
                                            | {{ $configSetup[4]->name }}: {{ $warrentyInfo->name }}
                                        @endif
                                        @if (isset($deviceCondition))
                                            | {{ $configSetup[3]->name }}: {{ $deviceCondition->name }}
                                        @endif
                                        <br>SKU: {{ $details->product_code }}
                                    </span>
                                    </span>
                                </td>

                                @if (env('MultiVendor') == true)
                                    <td>{{ $details->store_name }}</td>
                                @endif
                                <td>{{ $currencySymbol }} {{ number_format($details->unit_price, 0) }}</td>
                                <td>{{ $details->qty }}</td>
                                <td>{{ $currencySymbol }} {{ number_format($details->total_price, 0) }}</td>
                            </tr>
                        @endif
                    @endforeach
                </tbody>
            </table>

            <!-- Footer Section -->
            <div class="footer-row">
                <!-- Notes Section -->
                <div class="order-notes">
                    @if (isset($orderInfo->order_note) && !empty($orderInfo->order_note))
                        <strong>Order Note:</strong>
                        <p>{{ $orderInfo->order_note }}</p>
                    @endif
                </div>

                <!-- Order Totals -->
                <div class="order-totals">
                    <p><b>Sub-total:</b> {{ $currencySymbol }} {{ number_format($orderInfo->sub_total, 0) }}</p>

                    @if (isset($orderInfo->discount) && $orderInfo->discount > 0)
                        <p><b>Discount @if (isset($orderInfo->coupon_code) && !empty($orderInfo->coupon_code))
                                    ({{ $orderInfo->coupon_code }})
                                @endif:</b> {{ $currencySymbol }}
                            {{ number_format($orderInfo->discount, 0) }}</p>
                    @endif

                    @if (isset($orderInfo->reward_points_used) && $orderInfo->reward_points_used > 0)
                        <p><b>Reward Points Used:</b> {{ $orderInfo->reward_points_used }}</p>
                    @endif

                    @if (isset($orderInfo->vat) && isset($orderInfo->tax) && $orderInfo->vat + $orderInfo->tax > 0)
                        <p><b>VAT/TAX:</b> {{ $currencySymbol }}
                            {{ number_format($orderInfo->vat + $orderInfo->tax, 0) }}</p>
                    @endif

                    @if (isset($orderInfo->delivery_fee) && $orderInfo->delivery_fee > 0)
                        <p><b>Delivery Charge:</b> {{ $currencySymbol }}
                            {{ number_format($orderInfo->delivery_fee, 0) }}</p>
                    @endif

                    <p><b>Total Order Amount:</b> {{ $currencySymbol }} {{ number_format($orderInfo->total, 0) }}</p>

                    @if ($payments['total'] > 0)
                        <p><b>Paid Amount:</b>
                            {{ $orderInfo->total - $payments['total'] == 0 ? 'Full Paid' : $currencySymbol . ' ' . number_format($payments['total'], 0) }}
                        </p>
                    @endif

                    @if ($orderInfo->total - $payments['total'] > 0)
                        <p><b>Due Amount:</b> {{ $currencySymbol }}
                            {{ number_format($orderInfo->total - $payments['total'], 0) }}</p>
                    @endif
                </div>
            </div>

            <!-- Footer note -->
            <div class="footer-note">
                Thanks for shopping at @if (isset($generalInfo->company_name))
                    {{ $generalInfo->company_name }}
                @endif. This system-generated invoice requires no signature or seal. For queries,
                contact
                @if (isset($generalInfo->contact))
                    <strong>{{ $generalInfo->contact }}</strong>
                    @endif or @if (isset($generalInfo->email))
                        <strong>{{ $generalInfo->email }}</strong>
                    @endif.
            </div>
        </div>

        @if (!$loop->last)
            <div class="page-break"></div>
        @endif
    @endforeach

    <script>
        window.onload = function() {
            window.print();
        };
    </script>
</body>

</html>
