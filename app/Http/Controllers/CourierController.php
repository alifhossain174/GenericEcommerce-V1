<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use App\Models\Order;
use App\Models\OrderPayment;
use App\Models\CourierApiKey;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;

class CourierController extends Controller
{
    protected $baseUrl;
    protected $apiKey;
    protected $secretKey;
    protected $courierCodCharge;

    public function __construct($provider = "steadfast")
    {
        $this->setConfigData($provider);
    }

    public function setConfigData($provider = "steadfast")
    {
        $courierApiKeys = CourierApiKey::where('provider_name', $provider)->first();
        switch ($provider) {
            case 'steadfast':
                $this->baseUrl = "https://portal.steadfast.com.bd/api/v1";
                break;
            case 'pathao':
                $this->baseUrl = "https://api-hermes.pathao.com";
                break;

            default:
                $this->baseUrl = "https://portal.steadfast.com.bd/api/v1";
                break;
        }
        $this->apiKey = $courierApiKeys->app_key;
        $this->secretKey = $courierApiKeys->secret_key;
        $this->courierCodCharge = $courierApiKeys->courier_cod_charge ?? 0;
        return true;
    }

    public function getHeader()
    {
        return [
            'Api-Key' => $this->apiKey,
            'Secret-Key' => $this->secretKey,
            'Content-Type' => 'application/json',
        ];
    }

    public function placeOrder($data)
    {
        $response = Http::withHeaders($this->getHeader())->post($this->baseUrl . '/create_order', $data);
        return $response->json();
    }

    public function bulkCreateOrders($data)
    {
        $response = Http::withHeaders($this->getHeader())
            ->post($this->baseUrl . '/create_order/bulk-order', ['data' => json_encode($data)]);

        return $response->json();
    }

    public function checkDeliveryStatusByConsignmentId($id)
    {
        $response = Http::withHeaders($this->getHeader())->get($this->baseUrl . '/status_by_cid/' . $id);
        return $response->json();
    }


    public function checkDeliveryStatusByInvoiceId($id)
    {
        $response = Http::withHeaders($this->getHeader())->get($this->baseUrl . '/status_by_invoice/' . $id);
        return $response->json();
    }

    public function checkDeliveryStatusByTrackingCode($id)
    {
        $response = Http::withHeaders($this->getHeader())->get($this->baseUrl . '/status_by_trackingcode/' . $id);
        return $response->json();
    }
    public function updataCourierStatus(Request $request)
    {
        try {

            $results = [];
            $processedCount = 0;

            Order::select('id', 'order_no', 'total', 'order_date', 'tracking_id', 'courier_status')
                ->whereBetween('order_date', [$request->startDate, $request->endDate . ' 23:59:59'])
                ->whereNotNull('tracking_id')
                ->where(function ($query) {
                    $query->where('courier_status', '!=', 'delivered')
                        ->where('courier_status', '!=', 'unknown')
                        ->where('courier_status', '!=', 'cancelled');
                })
                ->chunk(50, function ($orders) use (&$results, &$processedCount) {
                    $trackingIds = $orders->pluck('tracking_id', 'id')->toArray();
                    $updateData = [];
                    foreach ($trackingIds as $orderId => $trackingId) {
                        $result = $this->checkDeliveryStatusByTrackingCode($trackingId);
                        if (isset($result['delivery_status'])) {
                            $updateData[] = [
                                'id' => $orderId,
                                'courier_status' => $result['delivery_status']
                            ];
                        }

                        $results[] = $result;
                        $processedCount++;
                    }
                    if (!empty($updateData)) {
                        foreach ($updateData as $item) {
                            DB::table('orders')
                                ->where('id', $item['id'])
                                ->update(['courier_status' => $item['courier_status']]);
                        }
                    }
                });
            // Toastr::success('Courier Status has been Updated successfully.', 'Success');
            return response()->json([
                'success' => true,
                'processed_count' => $processedCount,
                'results' => $results
            ]);

            return back();
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => $th->getMessage()
            ]);
            // Toastr::error('Order has been Placed.', 'Failed');
            // return response()->json(['message' => 'Courier Status has been Updated successfully!']);
            return back();
        }
    }

    public function addOrderToCourier(Request $request, $orderId)
    {
        try {
            $orderInfo = Order::with('shipping_info')->find($orderId);
            if (empty($orderInfo->shipping_info)) {
                Toastr::error('No Shipping Address Found!', 'Failed');
                return back();
            }

            $paidAmount = OrderPayment::getOrderPaymentsWithTotal($orderId, 'amount');
            $due = ($orderInfo->total - $paidAmount['total']);

            if ($due > 0) {
                $due += $due * ($this->courierCodCharge);
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

            $response = $this->placeOrder($orderData);
            // return $response;
            if ($response) {
                $orderInfo->courier_details = json_encode($response['consignment']);
                $orderInfo->tracking_id = $response['consignment']['tracking_code'];
                $orderInfo->courier_status = $response['consignment']['status'];
                $orderInfo->delivery_method = 3;
                $orderInfo->order_status = 2;
                $orderInfo->update();
            }
            Toastr::success('Order has been Placed.', 'Success');
            return back();
        } catch (\Throwable $th) {
            return $th->getMessage();
            Toastr::error('Something went wrong !', 'Failed');
            return back();
        }
    }

    public function addBulkCourier(Request $request)
    {
        try {
            $orderInfo = Order::select('id', 'order_no', 'total')->with('shipping_info')
                ->whereIn('id', $request->orderIds)->whereNull('tracking_id')->get();
            $data = array();
            foreach ($orderInfo as $order) {
                if (empty($order->shipping_info)) {
                    break;
                }
                $paidAmount = OrderPayment::getOrderPaymentsWithTotal($order->id, 'amount');
                $due = ($order->total - $paidAmount['total']);

                if ($due > 0) {
                    $due += $due * ($this->courierCodCharge);
                }
                $makeAddr = $order->shipping_info?->address . ',' . $order->shipping_info?->thana . ',' . $order->shipping_info?->city . ',POC-' . $order->shipping_info?->post_code;
                $orderData = [
                    'invoice' => $order->order_no,
                    'recipient_name' => $order->shipping_info?->full_name ?? 'N/A',
                    'recipient_phone' => $order->shipping_info?->phone ?? 'N/A',
                    'recipient_address' => $makeAddr,
                    'cod_amount' => $due == 0 ? 1 : round($due),
                    'note' => $order->order_note ?? 'Handle with care'
                ];
                array_push($data, ...[$orderData]);
            }
            $result = $this->bulkCreateOrders($data);
            if (is_array($result) && isset($result['data'])) {
                foreach ($result['data'] as $respOrder) {
                    DB::table('orders')
                        ->where('order_no', $respOrder['invoice'])
                        ->update([
                            'courier_details' => json_encode($respOrder),
                            'tracking_id' => $respOrder['tracking_code'],
                            'courier_status' => $respOrder['status'],
                            'delivery_method' => 3,
                            'order_status' => 2
                        ]);
                }
                // return response()->json(['success' => true, 'message' => 'Orders updated successfully']);
                Toastr::success('Orders has been Placed successfully.', 'Success');
            } else {
                Toastr::error('Invalid response format.', 'Failed');
                // return response()->json(['success' => false, 'message' => 'Invalid response format']);
            }
            return back();
        } catch (\Throwable $th) {
            Toastr::error('Order has been Placed.', 'Failed');
            return back();
            // return response()->json(['success' => false, 'message' => $th->getMessage()], 500);
        }
    }
}
