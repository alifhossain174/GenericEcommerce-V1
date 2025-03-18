<?php

namespace App\Http\Controllers;

use App\Models\BillingAddress;
use App\Models\Order;
use App\Models\OrderDetails;
use App\Models\OrderPayment;
use App\Models\OrderProgress;
use App\Models\Product;
use App\Models\ShippingInfo;
use App\Models\User;
use Carbon\Carbon;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\DB;
use Brian2694\Toastr\Facades\Toastr;
use App\Http\CustomHelper;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;

class OrderController extends Controller
{
    public function viewAllOrders(Request $request)
    {
        if ($request->ajax()) {

            $query = DB::table('orders')
                ->leftJoin('order_details', 'orders.id', '=', 'order_details.order_id')
                ->leftJoin('shipping_infos', 'shipping_infos.order_id', '=', 'orders.id')
                ->leftJoin('products', 'order_details.product_id', '=', 'products.id')
                ->select(
                    'orders.*',
                    'shipping_infos.full_name as customer_name',
                    'shipping_infos.phone as customer_phone',
                    'shipping_infos.address as customer_address',
                    'shipping_infos.thana as customer_thana',
                    'shipping_infos.city as customer_city',
                    'shipping_infos.post_code as customer_post_code',
                    DB::raw('GROUP_CONCAT(DISTINCT products.name SEPARATOR ", ") as product_names')
                )
                ->groupBy('orders.id')
                ->orderBy('id', 'desc');

            // Filter based on status if it's not empty
            if (!empty($request->status)) {
                if ($request->status == 'pending') {
                    $query->where('order_status', 0);
                } elseif ($request->status == 'approved') {
                    $query->where('order_status', 1);
                } elseif ($request->status == 'ready-to-ship') {
                    $query->where('order_status', 5);
                } elseif ($request->status == 'intransit') {
                    $query->where('order_status', 2);
                } elseif ($request->status == 'delivered') {
                    $query->where('order_status', 3);
                } elseif ($request->status == 'cancelled') {
                    $query->where('order_status', 4);
                }
            }

            // Continue with filtering
            if (!empty($request->order_no)) {
                $query->where('order_no', 'LIKE', '%' . $request->order_no . '%');
            }
            if ($request->order_from) {
                $query->where('order_from', $request->order_from);
            }
            if ($request->payment_status != '') {
                $query->where('payment_status', $request->payment_status);
            }
            if ($request->customer_phone != '') {
                $query->where('shipping_infos.phone', 'LIKE', '%' . $request->customer_phone . '%');
            }
            if ($request->customer_name != '') {
                $query->where('shipping_infos.full_name', 'LIKE', '%' . $request->customer_name . '%');
            }
            if ($request->purchase_date_range != '') {
                $dateRange = $request->purchase_date_range;
                list($startDateStr, $endDateStr) = explode(" - ", $dateRange);
                $startDate = DateTime::createFromFormat("M j, Y", trim($startDateStr));
                $endDate = DateTime::createFromFormat("M j, Y", trim($endDateStr));
                $formattedStartDate = $startDate ? $startDate->format("Y-m-d") . " 00:00:00" : null;
                $formattedEndDate = $endDate ? $endDate->format("Y-m-d") . " 23:59:59" : null;
                $query->whereBetween('order_date', [$formattedStartDate, $formattedEndDate]);
            }
            if ($request->status == "" && $request->order_status != "") {
                $query->where('order_status', $request->order_status);
            }
            if ($request->delivery_method != "") {
                $query->where('delivery_method', $request->delivery_method);
            }
            if ($request->coupon_code != "") {
                $query->where('coupon_code', 'LIKE', '%' . $request->coupon_code . '%');
            }
            if ($request->product_id != "") {
                $query->where('order_details.product_id', $request->product_id);
            }

            $data = $query->get();

            return Datatables::of($data)
                ->editColumn('customer_name', function ($data) {
                    $html = '<div style="font-size: 16px;">' . $data->customer_name . '</div>';
                    if (!empty($data->customer_address)) {
                        $html .= '<div class="small text-muted" style="font-size: 12px;">(' . $data->customer_address . ', ' . $data->customer_thana . ', ' . $data->customer_city . ' - ' . $data->customer_post_code . ')</div>';
                    }
                    return $html;
                })
                ->editColumn('product_info', function ($data) {
                    // Get product details for this order
                    $orderItems = DB::table('order_details')
                        ->leftJoin('products', 'order_details.product_id', '=', 'products.id')
                        ->leftJoin('colors', 'order_details.color_id', '=', 'colors.id')
                        ->leftJoin('storage_types', 'order_details.storage_id', '=', 'storage_types.id')
                        ->leftJoin('sims', 'order_details.sim_id', '=', 'sims.id')
                        ->leftJoin('product_sizes', 'order_details.size_id', '=', 'product_sizes.id')
                        ->select(
                            'products.name as product_name',
                            'colors.name as color',
                            'storage_types.ram',
                            'storage_types.rom',
                            'sims.name as sim',
                            'product_sizes.name as size',
                            'order_details.region_id',
                            'order_details.warrenty_id',
                            'order_details.device_condition_id'
                        )
                        ->where('order_details.order_id', $data->id)
                        ->get();

                    // Get config setup if available
                    $configSetup = [];
                    try {
                        $configSetup = DB::table('configuration_setups')->get();
                    } catch (\Exception $e) {
                        // Fallback labels if configuration_setups table doesn't exist
                        $configSetup = [
                            (object)['name' => 'Size'],
                            (object)['name' => 'Storage'],
                            (object)['name' => 'SIM'],
                            (object)['name' => 'Device Condition'],
                            (object)['name' => 'Product Warranty'],
                            (object)['name' => 'Region'],
                            (object)['name' => 'Color']
                        ];
                    }

                    $html = '';
                    foreach ($orderItems as $index => $item) {
                        // Add separator between items
                        if ($index > 0) {
                            $html .= '<hr style="margin: 5px 0;">';
                        }

                        // Product name
                        $html .= '<div><strong>' . $item->product_name . '</strong></div>';

                        // First row of variants
                        $variantInfo1 = [];

                        // Color
                        if (isset($item->color) && !empty($item->color)) {
                            $variantInfo1[] = (isset($configSetup[6]) ? $configSetup[6]->name : 'Color') . ': ' . $item->color;
                        }

                        // Storage (RAM/ROM)
                        if ((isset($item->ram) && !empty($item->ram)) || (isset($item->rom) && !empty($item->rom))) {
                            $storage = (isset($configSetup[1]) ? $configSetup[1]->name : 'Storage') . ': ';
                            $storage .= (isset($item->ram) ? $item->ram : '') . '/' . (isset($item->rom) ? $item->rom : '');
                            $variantInfo1[] = $storage;
                        }

                        // SIM
                        if (isset($item->sim) && !empty($item->sim)) {
                            $variantInfo1[] = (isset($configSetup[2]) ? $configSetup[2]->name : 'SIM') . ': ' . $item->sim;
                        }

                        // Size
                        if (isset($item->size) && !empty($item->size)) {
                            $variantInfo1[] = (isset($configSetup[0]) ? $configSetup[0]->name : 'Size') . ': ' . $item->size;
                        }

                        // Display first row of variants
                        if (!empty($variantInfo1)) {
                            $html .= '<div style="color: #6c757d; font-size: 12px; margin-top: 3px;">' . implode(' | ', $variantInfo1) . '</div>';
                        }

                        // Second row of variants
                        $variantInfo2 = [];

                        // Region
                        if (isset($item->region_id) && !empty($item->region_id)) {
                            $regionInfo = DB::table('country')->where('id', $item->region_id)->first();
                            if ($regionInfo && isset($regionInfo->name)) {
                                $variantInfo2[] = (isset($configSetup[5]) ? $configSetup[5]->name : 'Region') . ': ' . $regionInfo->name;
                            }
                        }

                        // Warranty
                        if (isset($item->warrenty_id) && !empty($item->warrenty_id)) {
                            $warrantyInfo = DB::table('product_warrenties')->where('id', $item->warrenty_id)->first();
                            if ($warrantyInfo && isset($warrantyInfo->name)) {
                                $variantInfo2[] = (isset($configSetup[4]) ? $configSetup[4]->name : 'Product Warranty') . ': ' . $warrantyInfo->name;
                            }
                        }

                        // Device Condition
                        if (isset($item->device_condition_id) && !empty($item->device_condition_id)) {
                            $conditionInfo = DB::table('device_conditions')->where('id', $item->device_condition_id)->first();
                            if ($conditionInfo && isset($conditionInfo->name)) {
                                $variantInfo2[] = (isset($configSetup[3]) ? $configSetup[3]->name : 'Device Condition') . ': ' . $conditionInfo->name;
                            }
                        }

                        // Display second row of variants
                        if (!empty($variantInfo2)) {
                            $html .= '<div style="color: #6c757d; font-size: 12px; margin-top: 3px;">' . implode(' | ', $variantInfo2) . '</div>';
                        }
                    }

                    return $html;
                })
                ->editColumn('order_status', function ($data) {
                    if ($data->order_status == 0) {
                        return '<span class="alert alert-warning" style="padding: 2px 10px !important;">Pending</span>';
                    } elseif ($data->order_status == 1) {
                        return '<span class="alert alert-info" style="padding: 2px 10px !important;">Approved</span>';
                    } elseif ($data->order_status == 5) {
                        return '<span class="alert alert-info" style="padding: 2px 10px !important;">Ready to ship</span>';
                    } elseif ($data->order_status == 2) {
                        return '<span class="alert alert-primary" style="padding: 2px 12px !important;">InTransit ' . ($data->delivery_method == 3 ? '(SteadFast)' : '') . '</span>';
                    } elseif ($data->order_status == 3) {
                        return '<span class="alert alert-success" style="padding: 2px 10px !important;">Delivered</span>';
                    } else {
                        return '<span class="alert alert-danger" style="padding: 2px 10px !important;">Cancelled</span>';
                    }
                })
                ->editColumn('payment_method', function ($data) {
                    if ($data->payment_method == NULL) {
                        return '<span class="alert alert-danger" style="padding: 2px 10px !important;">Unpaid</span>';
                    } elseif ($data->payment_method == 1) {
                        return '<span class="alert alert-info" style="padding: 2px 10px !important;">COD</span>';
                    } elseif ($data->payment_method == 2) {
                        return '<span class="alert alert-success" style="padding: 2px 10px !important;">bKash</span>';
                    } elseif ($data->payment_method == 3) {
                        return '<span class="alert alert-success" style="padding: 2px 10px !important;">Nagad</span>';
                    } else {
                        return '<span class="alert alert-success" style="padding: 2px 10px !important;">Card</span>';
                    }
                })
                ->editColumn('payment_status', function ($data) {
                    if ($data->payment_status == 0) {
                        return '<span class="alert alert-warning" style="padding: 2px 10px !important;">Unpaid</span>';
                    } elseif ($data->payment_status == 1) {
                        return '<span class="alert alert-success" style="padding: 2px 10px !important;">Paid</span>';
                    } elseif ($data->payment_status == 2) {
                        return '<span class="alert alert-primary" style="padding: 2px 10px !important;">Failed</span>';
                    } elseif ($data->payment_status == 3) {
                        return '<span class="alert alert-info" style="padding: 2px 10px !important;">Partial</span>';
                    } else {
                        return '<span class="alert alert-danger" style="padding: 2px 10px !important;">Cancel</span>';
                    }
                })
                ->addIndexColumn()
                ->addColumn('action', function ($data) {
                    $btn = ' <a href="' . url('order/details') . '/' . $data->slug . '" title="Order Details" class="d-inline-block btn-sm btn-info rounded mb-1"><i class="fas fa-list-ul"></i></a>';

                    if ($data->order_status != 0) {
                        if (!($data->tracking_id == null && ($data->order_status == 2 || $data->order_status == 3 && $data->order_status != 4))) {
                            if ($data->tracking_id != null) {
                                $btn .= ' <a href="https://steadfast.com.bd/t/' . $data->tracking_id . '" target="_blank" title="Tracking the Order" class="mb-1 d-inline-block btn-sm btn-secondary rounded"><i class="fas fa-truck"></i></a>';
                            } else {
                                $btn .= ' <a href="' . url('add/order/' . $data->id . '/courier') . '" onclick="javascript:return confirm(\'Are you sure to placed the order in courier?\')" title="Place To Courier" class="mb-1 d-inline-block btn-sm btn-primary rounded"><i class="fas fa-truck"></i></a>';
                            }
                        }
                    }

                    if ($data->order_status == 0) {
                        $btn .= ' <a href="' . url('order/edit') . '/' . $data->slug . '" onclick="return orderEditWarning()" title="Order Edit" class="mb-1 d-inline-block btn-sm btn-warning rounded"><i class="fas fa-edit"></i></a>';
                        $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" title="Cancel" data-id="' . $data->slug . '" data-original-title="Cancel" class="d-inline-block mb-1 btn-sm btn-danger rounded cancelBtn"><i class="fa fa-times"></i></a>';
                        $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" title="Approve" data-id="' . $data->slug . '" data-original-title="Check" class="d-inline-block mb-1 btn-sm btn-success rounded approveBtn"><i class="fas fa-check"></i></a>';
                    }

                    if ($data->order_status == 1) {
                        $btn .= ' <a href="' . url('order/edit') . '/' . $data->slug . '" onclick="return orderEditWarning()" title="Order Edit" class="mb-1 d-inline-block btn-sm btn-warning rounded"><i class="fas fa-edit"></i></a>';
                        $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" title="Cancel" data-id="' . $data->slug . '" data-original-title="Cancel" class="d-inline-block mb-1 btn-sm btn-danger rounded cancelBtn"><i class="fa fa-times"></i></a>';
                        $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" title="In Transit" data-id="' . $data->slug . '" data-original-title="Check" class="d-inline-block mb-1 btn-sm btn-success rounded intransitBtn"><i class="fas fa-check"></i></a>';
                    }

                    if ($data->order_status == 2) {
                        $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" title="Deliver" data-id="' . $data->slug . '" data-original-title="Delivery" class="d-inline-block mb-1 btn-sm btn-success rounded deliveryBtn"><i class="fas fa-truck"></i></a>';
                    }

                    if (Auth::user()->user_type == 1) {
                        $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" title="Delete" data-id="' . $data->slug . '" data-original-title="Delete" class="d-inline-block mb-1 btn-sm btn-danger rounded deleteBtn"><i class="fas fa-trash-alt"></i></a>';
                    }

                    return $btn;
                })
                ->rawColumns(['action', 'order_status', 'payment_method', 'payment_status', 'product_info', 'customer_name'])
                ->make(true);
        }

        $products = DB::table('products')->orderBy('name', 'asc')->get();
        return view('backend.orders.orders', compact('request', 'products'));
    }
    public function orderDetails($slug)
    {
        $order = Order::where('slug', $slug)->first();
        $userInfo = User::where('id', $order->user_id)->first();
        $shippingInfo = ShippingInfo::where('order_id', $order->id)->first();
        $billingAddress = BillingAddress::where('order_id', $order->id)->first();
        $payments = OrderPayment::getOrderPaymentsWithTotal($order->id, 'amount');
        $orderDetails = DB::table('order_details')
            ->leftJoin('stores', 'order_details.store_id', 'stores.id')
            ->leftJoin('products', 'order_details.product_id', 'products.id')
            ->leftJoin('categories', 'products.category_id', 'categories.id')
            ->leftJoin('units', 'order_details.unit_id', 'units.id')
            ->select('order_details.*', 'stores.store_name', 'products.has_variant as product_has_variant', 'products.image as product_image', 'products.name as product_name', 'products.code as product_code', 'units.name as unit_name', 'categories.name as category_name')
            ->where('order_id', $order->id)
            ->get();
        $generalInfo = DB::table('general_infos')->select('logo', 'logo_dark', 'company_name')->first();

        return view('backend.orders.details', compact('order', 'shippingInfo', 'billingAddress', 'orderDetails', 'userInfo', 'generalInfo', 'payments'));
    }

    public function cancelOrder($slug)
    {

        $orderInfo = Order::where('slug', $slug)->first();
        $orderInfo->order_status = 4;
        $orderInfo->updated_at = Carbon::now();
        $orderInfo->save();

        OrderProgress::insert([
            'order_id' => $orderInfo->id,
            'order_status' => 4,
            'created_at' => Carbon::now()
        ]);

        $orderSmsString = "Dear Customer, Your Order #" . $orderInfo->order_no . " has been cancelled at " . env('APP_NAME') . ". Total amount: " . $orderInfo->total . "TK.\n\nTrack your order at \n" . env('APP_URL') . "/track/order/" . $orderInfo->order_no;
        $shippingInfo = DB::table('shipping_infos')->where('order_id', $orderInfo->id)->first();
        $this->sendOrderSms($shippingInfo->phone, $orderSmsString);

        return response()->json(['success' => 'Order Cancelled successfully.']);
    }

    public function approveOrder($slug)
    {

        $orderInfo = Order::where('slug', $slug)->first();
        $orderInfo->order_status = 1;
        $orderInfo->updated_at = Carbon::now();
        $orderInfo->save();

        OrderProgress::insert([
            'order_id' => $orderInfo->id,
            'order_status' => 1,
            'created_at' => Carbon::now()
        ]);

        $orderSmsString = "Dear Customer, Your Order #" . $orderInfo->order_no . " has been approved at " . env('APP_NAME') . ". Total amount: " . $orderInfo->total . "TK.\n\nTrack your order at \n" . env('APP_URL') . "/track/order/" . $orderInfo->order_no;
        $shippingInfo = DB::table('shipping_infos')->where('order_id', $orderInfo->id)->first();
        $this->sendOrderSms($shippingInfo->phone, $orderSmsString);

        return response()->json(['success' => 'Order Approved successfully.']);
    }

    public function intransitOrder($slug)
    {

        $orderInfo = Order::where('slug', $slug)->first();
        $orderInfo->order_status = 2;
        $orderInfo->updated_at = Carbon::now();
        $orderInfo->save();


        OrderProgress::insert([
            'order_id' => $orderInfo->id,
            'order_status' => 2,
            'created_at' => Carbon::now()
        ]);

        $orderSmsString = "Dear Customer, Your Order #" . $orderInfo->order_no . " is in Transit at " . env('APP_NAME') . ". Total amount: " . $orderInfo->total . "TK.\n\nTrack your order at \n" . env('APP_URL') . "/track/order/" . $orderInfo->order_no;
        $shippingInfo = DB::table('shipping_infos')->where('order_id', $orderInfo->id)->first();
        $this->sendOrderSms($shippingInfo->phone, $orderSmsString);

        return response()->json(['success' => 'Order In Transit successfully.']);
    }

    public function deliverOrder($slug)
    {

        $data = Order::where('slug', $slug)->first();
        $data->order_status = 3;
        $data->payment_status = 1;
        $data->updated_at = Carbon::now();
        $data->save();

        // give reward points to customer after order delivery start
        if ($data->user_id) {
            $totalRewardPoints = 0;
            $orderedItems = OrderDetails::where('order_id', $data->id)->get();
            foreach ($orderedItems as $item) {
                if (isset($item->reward_points) && $item->reward_points) {
                    $totalRewardPoints = $totalRewardPoints + $item->reward_points;
                }
            }
            if ($totalRewardPoints > 0) {
                User::where('id', $data->user_id)->increment('balance', $totalRewardPoints);
            }
        }
        // give reward points to customer after order delivery end

        OrderProgress::insert([
            'order_id' => $data->id,
            'order_status' => 3,
            'created_at' => Carbon::now()
        ]);

        $orderSmsString = "Dear Customer, Your Order #" . $data->order_no . " has been Delivered at " . env('APP_NAME') . ". Total amount: " . $data->total . "TK.\n\nTrack your order at \n" . env('APP_URL') . "/track/order/" . $data->order_no;
        $shippingInfo = DB::table('shipping_infos')->where('order_id', $data->id)->first();
        $this->sendOrderSms($shippingInfo->phone, $orderSmsString);

        return response()->json(['success' => 'Order Delivered successfully.']);
    }

    public static function sendOrderSms($phone, $orderSmsString)
    {
        if ($phone) {

            $smsGateway = DB::table('sms_gateways')->where('status', 1)->first();
            if ($smsGateway && $smsGateway->provider_name == 'Reve') {
                Http::get($smsGateway->api_endpoint, [
                    'apikey' => $smsGateway->api_key,
                    'secretkey' => $smsGateway->secret_key,
                    "callerID" => $smsGateway->sender_id,
                    "toUser" => $phone,
                    "messageContent" => $orderSmsString
                ]);
            }
            if ($smsGateway && $smsGateway->provider_name == 'KhudeBarta') {
                Http::get($smsGateway->api_endpoint, [
                    'apikey' => $smsGateway->api_key,
                    'secretkey' => $smsGateway->secret_key,
                    "callerID" => $smsGateway->sender_id,
                    "toUser" => OrderController::formatBangladeshiPhoneNumber($phone),
                    "messageContent" => $orderSmsString
                ]);
            }
            if ($smsGateway && $smsGateway->provider_name == 'ElitBuzz') {
                Http::get($smsGateway->api_endpoint, [
                    'api_key' => $smsGateway->api_key,
                    "type" => "text",
                    "contacts" => $phone,
                    "senderid" => $smsGateway->sender_id,
                    "msg" => $orderSmsString
                ]);
            }
        }
    }

    public function smsTest($message)
    {
        $sms = urlencode($message);
        try {
            $curl = curl_init();
            $url = "http://portal.khudebarta.com:3775/sendtext";
            $apikey = "a7e2a22612a65c4a";
            $secretkey = "81c17503";
            $callerID = "getupltd";
            $toUser = "8801568099321";
            $messageContent = $sms;
            curl_setopt_array($curl, [
                CURLOPT_URL => $url,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_CUSTOMREQUEST => "GET",
                CURLOPT_HTTPGET => true,
                CURLOPT_HTTPHEADER => [
                    "Content-Type: application/json",
                ],
            ]);
            $queryParams = http_build_query([
                'apikey' => $apikey,
                'secretkey' => $secretkey,
                'callerID' => $callerID,
                'toUser' => $toUser,
                'messageContent' => $messageContent
            ]);
            curl_setopt($curl, CURLOPT_URL, $url . '?' . $queryParams);

            $response = curl_exec($curl);
            if (curl_errno($curl)) {
                $error = curl_error($curl);
                curl_close($curl);
                return "Curl Error: " . $error;
            }
            curl_close($curl);
            return $response;

            // $resp = Http::get("http://portal.khudebarta.com:3775/sendtext", [
            //     'apikey' => "a7e2a22612a65c4a",
            //     'secretkey' => "81c17503",
            //     "callerID" => "getupltd",
            //     "toUser" => "8801568099321",
            //     "messageContent" => $sms
            // ]);
            // return $resp;
        } catch (\Throwable $th) {
            return $th;
        }
    }

    public static function formatBangladeshiPhoneNumber($phoneNumber)
    {
        // Remove any non-numeric characters from the phone number
        $phoneNumber = preg_replace('/\D/', '', $phoneNumber);

        // Check if the number starts with '88'
        if (substr($phoneNumber, 0, 2) !== '88') {
            // If not, prepend '88' to the number
            $phoneNumber = '88' . $phoneNumber;
        }

        return $phoneNumber;
    }

    public function orderInfoUpdate(Request $request)
    {

        $data = Order::where('id', $request->order_id)->first();
        if ($data->order_status != $request->order_status) {

            $data->order_remarks = $request->order_remarks;
            $data->order_status = $request->order_status;
            $data->estimated_dd = $request->estimated_dd;
            $data->updated_at = Carbon::now();
            $data->save();

            OrderProgress::insert([
                'order_id' => $request->order_id,
                'order_status' => $request->order_status,
                'created_at' => Carbon::now()
            ]);
        } else {
            $data->payment_status = $request->payment_status;
            // $data->order_note = $request->order_note;
            $data->order_remarks = $request->order_remarks;
            $data->estimated_dd = $request->estimated_dd;
            $data->updated_at = Carbon::now();
            $data->save();
        }

        Toastr::success('Order Information Updated', 'Success');
        return back();
    }

    public function orderEdit($slug)
    {
        $order = Order::where('slug', $slug)->first();
        $userInfo = User::where('id', $order->user_id)->first();
        $shippingInfo = ShippingInfo::where('order_id', $order->id)->first();
        $billingAddress = BillingAddress::where('order_id', $order->id)->first();
        $payments = OrderPayment::getOrderPaymentsWithTotal($order->id, 'amount');
        // return $payments['total'];

        $orderDetails = DB::table('order_details')
            ->leftJoin('products', 'order_details.product_id', 'products.id')
            ->leftJoin('categories', 'products.category_id', 'categories.id')
            ->leftJoin('units', 'order_details.unit_id', 'units.id')
            ->select('order_details.*', 'products.name as product_name', 'units.name as unit_name', 'categories.name as category_name')
            ->where('order_id', $order->id)
            ->get();

        $generalInfo = DB::table('general_infos')->select('logo', 'logo_dark', 'company_name')->first();
        $districts = DB::table('districts')->get();
        $countries = DB::table('country')->get();
        return view('backend.orders.edit', compact('order', 'shippingInfo', 'billingAddress', 'orderDetails', 'userInfo', 'generalInfo', 'districts', 'countries', 'payments'));
    }

    public function orderUpdate(Request $request)
    {
        $orderInfo = Order::where('id', $request->order_id)->first();

        // order items
        if (isset($request->product_id)) {
            OrderDetails::where('order_id', $request->order_id)->delete();
            $index = 0;
            $totalOrderAmount = 0;
            foreach ($request->product_id as $product_id) {

                $color_id = isset($request->color_id[$index]) ? $request->color_id[$index] : '';
                $size_id = isset($request->size_id[$index]) ? $request->size_id[$index] : '';
                $region_id = isset($request->region_id[$index]) ? $request->region_id[$index] : '';
                $sim_id = isset($request->sim_id[$index]) ? $request->sim_id[$index] : '';
                $storage_id = isset($request->storage_id[$index]) ? $request->storage_id[$index] : '';
                $warrenty_id = isset($request->warrenty_id[$index]) ? $request->warrenty_id[$index] : '';
                $device_condition_id = isset($request->device_condition_id[$index]) ? $request->device_condition_id[$index] : '';

                OrderDetails::insert([
                    'order_id' => $request->order_id,
                    'product_id' => $product_id,
                    'color_id' => $color_id,
                    'size_id' => $size_id,
                    'region_id' => $region_id,
                    'sim_id' => $sim_id,
                    'storage_id' => $storage_id,
                    'warrenty_id' => $warrenty_id,
                    'device_condition_id' => $device_condition_id,
                    'unit_id' => $request->unit_id[$index],
                    'qty' => $request->qty[$index],
                    'unit_price' => $request->unit_price[$index],
                    'total_price' => $request->qty[$index] * $request->unit_price[$index],
                    'updated_at' => Carbon::now()
                ]);
                $totalOrderAmount = $totalOrderAmount + ($request->qty[$index] * $request->unit_price[$index]);
                $index++;
            }

            $orderInfo->sub_total = $totalOrderAmount;
            $orderInfo->total = $totalOrderAmount - $orderInfo->discount;
            $orderInfo->save();
        } else {
            Toastr::error('Sorry No Item Exists', 'Failed');
            return back();
        }

        // shipping info
        $shippingInfo = ShippingInfo::where('order_id', $request->order_id)->first();
        if ($shippingInfo) {

            $deliveryCharge = 100;
            $districtWiseDeliveryCharge = DB::table('districts')->select('delivery_charge')->where('name', strtolower(trim($request->shipping_city)))->first();
            if ($districtWiseDeliveryCharge) {
                $deliveryCharge = $districtWiseDeliveryCharge->delivery_charge;
            }

            $orderInfo->delivery_fee = $deliveryCharge;
            $orderInfo->total = $orderInfo->total + $deliveryCharge;
            $orderInfo->save();


            $shippingInfo->full_name = $request->shipping_name;
            $shippingInfo->phone = $request->shipping_phone;
            $shippingInfo->email = $request->shipping_email;
            $shippingInfo->address = $request->shipping_address;
            $shippingInfo->post_code = $request->shipping_post_code;
            $shippingInfo->city = $request->shipping_city;
            $shippingInfo->country = $request->shipping_country;
            $shippingInfo->updated_at = Carbon::now();
            $shippingInfo->save();
        } else {

            $deliveryCharge = 100;
            $districtWiseDeliveryCharge = DB::table('districts')->select('delivery_charge')->where('name', strtolower(trim($request->shipping_city)))->first();
            if ($districtWiseDeliveryCharge) {
                $deliveryCharge = $districtWiseDeliveryCharge->delivery_charge;
            }

            $orderInfo->delivery_fee = $deliveryCharge;
            $orderInfo->total = $orderInfo->total + $deliveryCharge;
            $orderInfo->save();

            ShippingInfo::insert([
                'order_id' => $orderInfo->id,
                'full_name' => $request->shipping_name,
                'phone' => $request->shipping_phone,
                'email' => $request->shipping_email,
                'address' => $request->shipping_address,
                'post_code' => $request->shipping_post_code,
                'city' => $request->shipping_city,
                'country' => $request->shipping_country,
                'created_at' => Carbon::now()
            ]);
        }

        // billing info
        $billingInfo = BillingAddress::where('order_id', $request->order_id)->first();
        if ($billingInfo) {
            $billingInfo->address = $request->billing_address;
            $billingInfo->post_code = $request->billing_post_code;
            $billingInfo->city = $request->billing_city;
            $billingInfo->country = $request->billing_country;
            $billingInfo->updated_at = Carbon::now();
            $billingInfo->save();
        } else {
            BillingAddress::insert([
                'order_id' => $orderInfo->id,
                'address' => $request->billing_address,
                'post_code' => $request->billing_post_code,
                'city' => $request->billing_city,
                'country' => $request->billing_country,
                'created_at' => Carbon::now()
            ]);
        }

        if (isset($request->payment_method) && $request->payment_method == 1) {
            $orderInfo->bank_tran_id = "Not Available (COD)";
            $orderInfo->payment_method = 1;
            $orderInfo->payment_status = 1; //success
            $orderInfo->save();

            OrderPayment::insert([
                'order_id' => $orderInfo->id,
                'payment_through' => "COD",
                'tran_id' => $orderInfo->tran_id,
                'val_id' => NULL,
                'amount' => $orderInfo->total,
                'card_type' => NULL,
                'store_amount' => $orderInfo->total,
                'card_no' => NULL,
                'status' => "VALID",
                'tran_date' => date("Y-m-d H:i:s"),
                'currency' => "BDT",
                'card_issuer' => NULL,
                'card_brand' => NULL,
                'card_sub_brand' => NULL,
                'card_issuer_country' => NULL,
                'created_at' => Carbon::now()
            ]);
        }

        Toastr::success('Order Information Updated', 'Success');
        return back();
    }

    public function addOrderPayment(Request $request)
    {
        try {
            $request->validate([
                'payment_through' => 'required',
                'amount' => 'nullable',
            ]);
            DB::beginTransaction();
            $payDate = $request->payment_date ? date('Y-m-d H:i:s', strtotime($request->payment_date)) : date('Y-m-d H:i:s');
            $data = OrderPayment::insert([
                'order_id' => $request->order_id,
                'payment_through' => $request->payment_through,
                'tran_id' => $request->tran_id,
                'val_id' => NULL,
                'amount' => $request->amount,
                'card_type' => NULL,
                'store_amount' => $request->amount,
                'card_no' => NULL,
                'status' => "VALID",
                'tran_date' => $payDate,
                'currency' => "BDT",
                'card_issuer' => NULL,
                'card_brand' => NULL,
                'card_sub_brand' => NULL,
                'card_issuer_country' => NULL,
                'created_at' => Carbon::now()
            ]);
            if ($data) {
                $payments = OrderPayment::getOrderPaymentsWithTotal($request->order_id, 'amount');
                $orderData = Order::find($request->order_id);
                $payStatus = $payments['total'] == $orderData->total ? 1 : 3;
                $orderData->payment_status = $payStatus;
                $orderData->order_status = $orderData->order_status <= 1 ? 1 : $orderData->order_status;
                $orderData->updated_at = Carbon::now();
                $orderData->update();
                DB::commit();
                Toastr::success('Payment Information Updated', 'Success');
            } else {
                DB::rollBack();
                Toastr::error('Something Went Wrong!', 'Failed');
            }
            return back();
        } catch (\Throwable $th) {
            return $th;
            DB::rollBack();
            Toastr::error('Something Went Wrong with Server!', 'Failed');
            return back();
        }
    }

    public function addMoreProduct(Request $request)
    {
        $rowNo = $request->rowno;
        $returnHTML = view('backend.orders.add_more', compact('rowNo'))->render();
        return response()->json(['more' => $returnHTML]);
    }

    public function getProductVariants(Request $request)
    {

        $productInfo = Product::where('id', $request->product_id)->first();
        if ($productInfo->has_variant == 1) {
            $data = DB::table('product_variants')
                ->leftJoin('colors', 'product_variants.color_id', '=', 'colors.id')
                ->leftJoin('product_sizes', 'product_variants.size_id', '=', 'product_sizes.id')
                ->leftJoin('country', 'product_variants.region_id', '=', 'country.id')
                ->leftJoin('sims', 'product_variants.sim_id', '=', 'sims.id')
                ->leftJoin('storage_types', 'product_variants.storage_type_id', '=', 'storage_types.id')
                ->leftJoin('product_warrenties', 'product_variants.warrenty_id', '=', 'product_warrenties.id')
                ->leftJoin('device_conditions', 'product_variants.device_condition_id', '=', 'device_conditions.id')
                ->leftJoin('products', 'product_variants.product_id', '=', 'products.id')
                ->leftJoin('units', 'products.unit_id', '=', 'units.id')

                ->select('product_variants.id', 'product_variants.color_id', 'product_variants.size_id', 'product_variants.storage_type_id', 'product_variants.region_id', 'product_variants.sim_id', 'product_variants.warrenty_id', 'product_variants.device_condition_id', 'product_variants.discounted_price', 'product_variants.price', 'product_variants.stock as variant_stock', 'colors.name as color_name', 'product_sizes.name as size_name', 'country.name as region_name', 'sims.name as sim_name', 'storage_types.ram', 'storage_types.rom', 'product_warrenties.name as warrrenty', 'device_conditions.name as device_condition', 'units.name as unit_name', 'units.id as unit_id')

                ->where('product_variants.product_id', $request->product_id)
                ->where('product_variants.stock', '>', 0)
                ->orderBy('product_variants.id', 'asc')
                ->get();

            return response()->json($data);
        } else {

            $productInfo = DB::table('products')
                ->leftJoin('units', 'products.unit_id', '=', 'units.id')
                ->select('products.*', 'units.name as unit_name')
                ->where('products.id', $request->product_id)
                ->first();

            return response()->json($productInfo);
        }
    }

    public function deleteOrder($slug)
    {

        $orderInfo = Order::where('slug', $slug)->first();
        OrderDetails::where('order_id', $orderInfo->id)->delete();
        ShippingInfo::where('order_id', $orderInfo->id)->delete();
        BillingAddress::where('order_id', $orderInfo->id)->delete();
        OrderPayment::where('order_id', $orderInfo->id)->delete();
        OrderProgress::where('order_id', $orderInfo->id)->delete();
        $orderInfo->delete();

        return response()->json(['success' => 'Order Deleted Successfully.']);
    }

    public function bulkOrderStatusUpdate(Request $request)
    {

        $orderIds = $request->ids;
        foreach ($orderIds as $orderId) {
            $order = Order::where('id', $orderId)->first();
            $order->order_status = $request->status;
            $order->updated_at = Carbon::now();
            $order->save();

            OrderProgress::insert([
                'order_id' => $orderId,
                'order_status' => $request->status,
                'created_at' => Carbon::now()
            ]);
        }

        return response()->json(['message' => 'Order Updated Successfully!']);
    }

    public function bulkPrintOrders(Request $request)
    {
        $orderIds = explode(',', $request->orders);
        $orders = Order::whereIn('id', $orderIds)->get();
        $generalInfo = DB::table('general_infos')->select('logo', 'logo_dark', 'company_name')->first();
        return view('backend.orders.print', compact('orders', 'generalInfo'));
    }
}
