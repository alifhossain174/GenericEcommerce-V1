<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use App\Models\Order;
use App\Models\OrderPayment;
use App\Models\CourierApiKey;
use Illuminate\Support\Facades\Http;
use SteadFast\SteadFastCourierLaravelPackage\Facades\SteadfastCourier;

class SteadFastCourierController extends Controller
{
    public function addOrderToCourier(Request $request, $orderId)
    {
        $courierApiKeys = CourierApiKey::first();
        try {
            $orderInfo = Order::with('shipping_info')->find($orderId);
            if (empty($orderInfo->shipping_info)) {
                Toastr::error('No Shipping Address Found!', 'Failed');
                return back();
            }
            // Toastr::error('Testing success!', 'Success');
            // return false;
            $paidAmount = OrderPayment::getOrderPaymentsWithTotal($orderId, 'amount');
            $due = ($orderInfo->total - $paidAmount['total']);

            if ($due > 0) {
                $due += $due * ($courierApiKeys->courier_cod_charge);
            }

            $makeAddr = $orderInfo->shipping_info?->address . ',' . $orderInfo->shipping_info?->thana . ',' . $orderInfo->shipping_info?->city . ',POC-' . $orderInfo->shipping_info?->post_code;
            $orderData = [
                'invoice' => $orderInfo->order_no,
                'recipient_name' => $orderInfo->shipping_info?->full_name ?? 'N/A',
                'recipient_phone' => $orderInfo->shipping_info?->phone ?? 'N/A',
                'recipient_address' => $makeAddr,
                'cod_amount' => $due == 0 ? 1 : round($due),
                'note' => $orderInfo->order_note ?? 'Handle with care'
            ];

            $response = Http::withHeaders([
                'Api-Key' => $courierApiKeys->app_key,
                'Secret-Key' => $courierApiKeys->secret_key,
                'Content-Type' => 'application/json',
            ])->post("https://portal.steadfast.com.bd/api/v1/create_order", $orderData);

            // $response = SteadfastCourier::placeOrder($orderData);
            if ($response) {
                $orderInfo->courier_details = json_encode($response['consignment']);
                $orderInfo->tracking_id = $response['consignment']['tracking_code'];
                $orderInfo->courier_status = $response['consignment']['status'];
                $orderInfo->delivery_method = 3;
                $orderInfo->order_status = 2;
                $orderInfo->update();
                Toastr::success('Order has been Placed.', 'Success');
            }
            // return $response;
            return back();
        } catch (\Throwable $th) {
            return $th;
            Toastr::success('Something went wrong !', 'Failed');
            return back();
        }
    }
}
