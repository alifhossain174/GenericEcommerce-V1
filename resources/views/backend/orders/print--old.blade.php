<!DOCTYPE html>
<html>
<head>
    <title>Print Order</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            color: #333;
        }
        .page-break {
            page-break-before: always;
        }
        @media print {
            .page-break { page-break-before: always; }
            @page {
                padding-top: 20px;
            }

        }

        /* invoice header css */
        .invoice_header{
            width: 100%;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            margin-bottom: 40px;
        }
        .invoice_header .company_name,
        .invoice_header .company_logo,
        .invoice_header .invoice_name{
            flex: 1;
        }
        .invoice_header .company_logo{
            text-align: center;
        }
        .invoice_header .invoice_name{
            text-align: right;
        }
        .invoice_header h4{
            color: #1e1e1e;
            font-size: 16px;
            font-weight: 600;
            line-height: 0px;
        }
        /* invoice header css end */

        .order{
            width: 100%;
            margin-bottom: 40px;
        }

        .order .order_info{
            width: 100%;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }

        .order .order_info .shipping_info,
        .order .order_info .order_details{
            flex: 1;
        }

        .order .order_info h5{
            color: #1e1e1e;
            font-size: 14px;
            font-weight: 600;
            line-height: 0px;
            margin-bottom: 16px;
        }
        .order .order_info p{
            color: #1e1e1e;
            font-size: 14px;
            font-weight: 500;
            line-height: 20px !important;
            padding: 0px !important;
            margin: 0px !important;
        }

        .order .order_info .order_details table th,
        .order .order_info .order_details table td {
            color: #1e1e1e;
            font-size: 14px;
            font-weight: 500;
            line-height: 20px !important;
            padding: 0px !important;
            margin: 0px !important;
        }
        .order .order_info .order_details table th{
            font-weight: 600;
            text-align: right;
            width: 65%;
        }

        /* order table css start */
        .ordered_products{
            margin-top: 30px;
            margin-bottom: 20px
        }
        .ordered_products table.order_items{
            width: 100%;
            border-collapse: collapse;
        }
        .ordered_products table.order_items thead tr th{
            text-align: center;
            font-size: 14px;
            padding: 4px;
        }
        .ordered_products table.order_items tbody tr td{
            text-align: center;
            font-size: 14px;
            padding: 4px;
        }

    </style>
</head>


<body>

    @foreach($orders as $order)

        @php
            $order = App\Models\Order::where('id', $order->id)->first();
            $userInfo = App\Models\User::where('id', $order->user_id)->first();
            $shippingInfo = App\Models\ShippingInfo::where('order_id', $order->id)->first();
            $billingAddress = App\Models\BillingAddress::where('order_id', $order->id)->first();
            $orderDetails = DB::table('order_details')
                                ->leftJoin('stores', 'order_details.store_id', 'stores.id')
                                ->leftJoin('products', 'order_details.product_id', 'products.id')
                                ->leftJoin('units', 'order_details.unit_id', 'units.id')
                                ->select('order_details.*', 'stores.store_name', 'products.name as product_name', 'products.code as product_code', 'units.name as unit_name')
                                ->where('order_id', $order->id)
                                ->get();
        @endphp

        <div class="invoice_header">
            <div class="company_name">
                <h4>{{$generalInfo->company_name}}</h4>
            </div>
            <div class="company_logo">
                @if(file_exists(public_path($generalInfo->logo_dark)))
                <img src="{{url($generalInfo->logo_dark)}}" alt="" height="40">
                @endif
            </div>
            <div class="invoice_name">
                <h4>Invoice</h4>
            </div>
        </div>

        <div class="order">

            <div class="order_info">
                <div class="shipping_info">
                    @if($shippingInfo)
                        <h5>Shipping Info:</h5>
                        <p>{{$shippingInfo->full_name}}</p>
                        <p>{{$shippingInfo->phone}}</p>
                        <p>{{$shippingInfo->email}}</p>
                        <p>{{$shippingInfo->address}}</p>
                        @if($shippingInfo->thana)<p>Thana : {{$shippingInfo->thana}}</p>@endif
                        <p>{{$shippingInfo->city}} {{$shippingInfo->post_code}}, {{$shippingInfo->country}}</p>
                    @endif
                </div>
                <div class="order_details">
                    <table border="0" style="width: 100%; margin-top: 12px;">
                        <tr>
                            <th>Order No:</th>
                            <td> #{{ $order->order_no }}</td>
                        </tr>
                        <tr>
                            <th>Tran. ID:</th>
                            <td> #{{ $order->trx_id }}</td>
                        </tr>
                        <tr>
                            <th>Order Date:</th>
                            <td> {{date("jS F, Y",strtotime($order->order_date))}}</td>
                        </tr>
                        <tr>
                            <th>Order From:</th>
                            <td>
                                @if($order->order_from == 1)
                                 Website
                                @elseif($order->order_from == 2)
                                 Mobile App
                                @else
                                 POS
                                @endif
                            </td>
                        </tr>
                        <tr>
                            <th>Order Status:</th>
                            <td>
                                @php
                                    if($order->order_status == 0){
                                        echo ' <span style="color: gold">Pending</span>';
                                    } elseif($order->order_status == 1) {
                                        echo ' <span style="color: blue">Approved</span>';
                                    } elseif($order->order_status == 2) {
                                        echo ' <span style="color: blue">Intransit</span>';
                                    } elseif($order->order_status == 3) {
                                        echo ' <span style="color: green">Delivered</span>';
                                    } else {
                                        echo ' <span style="color: red">Cancelled</span>';
                                    }
                                @endphp
                            </td>
                        </tr>
                        <tr>
                            <th>Delivery Method:</th>
                            <td>
                                @php
                                    if($order->delivery_method == 1){
                                        echo '<span style="color: green">Home Delivery</span>';
                                    }
                                    if($order->delivery_method == 2){
                                        echo '<span style="color: green">Store Pickup</span>';
                                    }
                                @endphp
                            </td>
                        </tr>
                        <tr>
                            <th>Payment Method:</th>
                            <td>
                                @php
                                    if($order->payment_method == NULL){
                                        echo '<span style="color: red">Unpaid</span>';
                                    } elseif($order->payment_method == 1) {
                                        echo '<span style="color: blue">COD</span>';
                                    } elseif($order->payment_method == 2) {
                                        echo '<span style="color: green">bKash</span>';
                                    } elseif($order->payment_method == 3) {
                                        echo '<span style="color: green">Nagad</span>';
                                    } else {
                                        echo '<span style="color: green">Card</span>';
                                    }
                                @endphp
                            </td>
                        </tr>
                        <tr>
                            <th>Payment Status:</th>
                            <td>
                                @php
                                    if($order->payment_status == 0){
                                        echo '<span style="color: gold">Unpaid</span>';
                                    } elseif($order->payment_status == 1) {
                                        echo '<span style="color: green">Paid</span>';
                                    } else {
                                        echo '<span style="color: red">Failed</span>';
                                    }
                                @endphp
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="ordered_products">
                <table class="order_items" border="1">
                    <thead>
                        <tr>
                            <th>SL</th>
                            <th>Item</th>
                            <th>Variant</th>
                            @if(env('MultiVendor') == true)
                            <th>Store</th>
                            @endif
                            <th>Reward Points</th>
                            <th>Quantity</th>
                            <th>Unit Cost</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php
                            $sl = 1;
                        @endphp
                        @foreach ($orderDetails as $details)

                        @php
                            if($details->color_id)
                                $colorInfo = App\Models\Color::where('id', $details->color_id)->first();
                            if($details->storage_id)
                                $storageInfo = App\Models\StorageType::where('id', $details->storage_id)->first();
                            if($details->sim_id)
                                $simInfo = App\Models\Sim::where('id', $details->sim_id)->first();
                            if($details->region_id)
                                $regionInfo = DB::table('country')->where('id', $details->region_id)->first();
                            if($details->warrenty_id)
                                $warrentyInfo = App\Models\ProductWarrenty::where('id', $details->warrenty_id)->first();
                            if($details->device_condition_id)
                                $deviceCondition = App\Models\DeviceCondition::where('id', $details->device_condition_id)->first();
                            if($details->size_id)
                                $productSize = App\Models\ProductSize::where('id', $details->size_id)->first();
                        @endphp

                        <tr>
                            <td >{{$sl++}}</td>
                            <td style="text-align: left">
                                <b>{{$details->product_name}}</b><br/>
                                SKU : {{$details->product_code}}
                            </td>
                            <td >
                                @if($details->color_id) Color: {{$colorInfo ? $colorInfo->name : ''}} | @endif
                                @if($details->storage_id) Storage: {{$storageInfo ? $storageInfo->ram : ''}}/{{$storageInfo ? $storageInfo->rom : ''}} | @endif
                                @if($details->sim_id) SIM: {{$simInfo ? $simInfo->name : ''}} @endif
                                @if($details->size_id) Size: {{$productSize ? $productSize->name : ''}} @endif

                                <br>
                                @if($details->region_id) Region: {{$regionInfo ? $regionInfo->name : ''}} | @endif
                                @if($details->warrenty_id) Warrenty: {{$warrentyInfo ? $warrentyInfo->name : ''}} | @endif
                                @if($details->device_condition_id) Condition: {{$deviceCondition ? $deviceCondition->name : ''}} @endif
                            </td>
                            @if(env('MultiVendor') == true)
                            <td>{{$details->store_name}}</td>
                            @endif
                            <td>{{$details->reward_points}}</td>
                            <td>{{$details->qty}}</td>
                            <td>{{ $currencySymbol }} {{number_format($details->unit_price, 2)}}</td>
                            <td>{{ $currencySymbol }} {{number_format($details->total_price, 2)}}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>

            <div class="order_info">
                <div class="shipping_info">
                    @if($billingAddress)
                        <h5>Billing Address:</h5>
                        <p>{{$billingAddress->address}}</p>
                        <p>{{$billingAddress->city}} {{$billingAddress->post_code}}, {{$billingAddress->country}}</p>
                        <br>
                    @endif

                    @if($userInfo)
                    <h5>User Account Info:</h5>
                    <p>{{$userInfo->name}}</p>
                    @if($userInfo->email)<p>{{$userInfo->email}}</p>@endif
                    @if($userInfo->phone)<p>{{$userInfo->phone}}</p>@endif
                    @if($userInfo->address)<p>{{$userInfo->address}}</p>@endif
                    <br>
                    @endif

                    @if($order->order_note)
                    <h5>Order note by Customer:</h5>
                    <p>
                        {{$order->order_note}}
                    </p>
                    @endif
                </div>
                <div class="order_details">
                    <table border="0" style="width: 100%; margin-top: 12px;">
                        <tr>
                            <th>Sub-total : </th>
                            <td> {{ $currencySymbol }} {{number_format($order->sub_total, 2)}}</td>
                        </tr>
                        <tr>
                            <th>Discount @if($order->coupon_code)({{$order->coupon_code}})@endif: </th>
                            <td> {{ $currencySymbol }} {{number_format($order->discount, 2)}}</td>
                        </tr>
                        <tr>
                            <th>Reward Points Used : </th>
                            <td> {{$order->reward_points_used}}</td>
                        </tr>
                        <tr>
                            <th>VAT/TAX : </th>
                            <td> {{ $currencySymbol }} {{number_format($order->vat+$order->tax, 2)}}</td>
                        </tr>
                        <tr>
                            <th>Delivery Charge : </th>
                            <td> {{ $currencySymbol }} {{number_format($order->delivery_fee, 2)}}</td>
                        </tr>
                    </table>

                    <h5 style="text-align: center; font-size: 22px;">Total Order Amount : {{ $currencySymbol }} {{number_format($order->total, 2)}}</h5>
                </div>
            </div>

            @if(!$loop->last)
                <div class="page-break"></div>
            @endif
        </div>
    @endforeach

    <script>
        window.onload = function() {
            window.print();
        };
    </script>
</body>
</html>
