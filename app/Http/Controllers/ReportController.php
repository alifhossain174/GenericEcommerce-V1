<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\Request;

class ReportController extends Controller
{
    public function salesReport(){
        return view('backend.report.sales_report');
    }

    public function generateSalesReport(Request $request){

        $startDate = date("Y-m-d", strtotime(str_replace("/","-",$request->start_date)))." 00:00:00";
        $endDate = date("Y-m-d", strtotime(str_replace("/","-",$request->end_date)))." 23:59:59";
        $orderStatus = $request->order_status;
        $paymentStatus = $request->payment_status;
        $paymentMethod = $request->payment_method;

        $query = Order::query();
        $query->whereBetween('order_date', [$startDate, $endDate]);

        if ($orderStatus != '') {
            $query->where('order_status', $orderStatus);
        }
        if ($paymentStatus != '') {
            $query->where('payment_status', $paymentStatus);
        }
        if ($paymentMethod != '') {
            $query->where('payment_method', $paymentMethod);
        }
        $data = $query->orderBy('id', 'desc')->get();

        $returnHTML = view('backend.report.sales_report_view', compact('startDate', 'endDate', 'data'))->render();
        return response()->json(['variant' => $returnHTML]);

    }

    public function stockReport(){
        return view('backend.report.stock_report');
    }

    public function generateStockReport(Request $request){

        $category_id = $request->category_id;
        $product_code = $request->product_code;
        $product_status = $request->product_status;
        $min_stock = $request->min_stock;
        $max_stock = $request->max_stock;

        $query = Product::query();
        if ($category_id != '') {
            $query->where('category_id', $category_id);
        }
        if ($product_code != '') {
            $query->where('code', $product_code);
        }
        if ($product_status != '') {
            $query->where('status', $product_status);
        }
        $data = $query->orderBy('id', 'desc')->get();

        $returnHTML = view('backend.report.stock_report_view', compact('data', 'min_stock', 'max_stock'))->render();
        return response()->json(['report' => $returnHTML]);

    }
}
