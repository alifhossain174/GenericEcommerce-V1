<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Support\Facades\DB;
use App\Models\OrderPayment;
use App\Models\User;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Hash;
use Yajra\DataTables\DataTables;


class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {

        $recentCustomers = User::where('user_type', 3)->orderBy('id', 'desc')->skip(0)->limit(5)->get();
        $orderPayments = OrderPayment::orderBy('id', 'desc')->skip(0)->limit(5)->get();

        // for upper graph start
        $countOrders = array();
        for($i=0; $i<=8; $i++){
            $orderStartDate = date("Y-m", strtotime("-$i month", strtotime(date("Y-m"))))."-01 00:00:00";
            $orderEndDate = date("Y-m-t", strtotime("-$i month", strtotime(date("Y-m"))))." 23:59:59";
            $countOrders[$i] = Order::whereBetween('order_date', [$orderStartDate, $orderEndDate])->count();
        }

        $totalOrderAmount = array();
        for($i=0; $i<=8; $i++){
            $orderStartDate = date("Y-m", strtotime("-$i month", strtotime(date("Y-m"))))."-01 00:00:00";
            $orderEndDate = date("Y-m-t", strtotime("-$i month", strtotime(date("Y-m"))))." 23:59:59";
            $totalOrderAmount[$i] = Order::whereBetween('order_date', [$orderStartDate, $orderEndDate])->where('order_status', '!=', 4)->sum('total');
        }

        $todaysOrder = array();
        for($i=0; $i<=8; $i++){
            $orderPlaceDate = date("Y-m-d", strtotime("-$i day", strtotime(date("Y-m-d"))));
            $todaysOrder[$i] = Order::where('created_at', 'LIKE', $orderPlaceDate.'%')->count();
        }

        $registeredUsers = array();
        for($i=0; $i<=8; $i++){
            $orderStartDate = date("Y-m", strtotime("-$i month", strtotime(date("Y-m"))))."-01 00:00:00";
            $orderEndDate = date("Y-m-t", strtotime("-$i month", strtotime(date("Y-m"))))." 23:59:59";
            $registeredUsers[$i] = User::whereBetween('created_at', [$orderStartDate, $orderEndDate])->count();
        }
        // for upper graph end


        // all time best product graph start
        $queryStartDate = date("Y-m", strtotime("-6 month", strtotime(date("Y-m"))))."-01 00:00:00";
        $queryEndDate = date("Y-m-d")." 23:59:59";

        $bestSelling = DB::table('order_details')
                        ->join('products', 'order_details.product_id', '=', 'products.id')
                        ->selectRaw('products.name, SUM(order_details.qty) as total_qty')
                        ->whereBetween('order_details.created_at', [$queryStartDate, $queryEndDate])
                        ->groupBy('order_details.product_id')
                        ->orderBy('total_qty', 'desc')
                        ->skip(0)
                        ->limit(3)
                        ->get();
        // all time best product graph end


        // success and failed order ratio start
        $countOrdersRatioSuccess = array();
        $countOrdersRatioFailed = array();
        $countOrdersRatioDate = array();

        for($i=0; $i<=9; $i++){
            $orderRatioStartDate = date("Y-m", strtotime("-$i month", strtotime(date("Y-m"))))."-01 00:00:00";
            $orderRatioEndDate = date("Y-m-t", strtotime("-$i month", strtotime(date("Y-m"))))." 23:59:59";

            $countOrdersRatioDate[$i] = date("M-y", strtotime("-$i month", strtotime(date("Y-m"))));
            $countOrdersRatioSuccess[$i] = Order::whereBetween('order_date', [$orderRatioStartDate, $orderRatioEndDate])->where('payment_status', 0)->count();
            $countOrdersRatioFailed[$i] = Order::whereBetween('order_date', [$orderRatioStartDate, $orderRatioEndDate])->where('payment_status', '!=', 0)->count();
        }
        // success and failed order ratio end

        return view('backend.dashboard', compact('recentCustomers', 'orderPayments', 'countOrders', 'totalOrderAmount', 'todaysOrder', 'registeredUsers', 'bestSelling', 'queryStartDate', 'countOrdersRatioDate', 'countOrdersRatioSuccess', 'countOrdersRatioFailed'));
    }

    public function changePasswordPage(){
        return view('backend.change_password');
    }

    public function changePassword(Request $request){

        $currentPassword = $request->prev_password;
        $newPassword = $request->new_password;
        $userId = $request->user_id;
        $userInfo = User::where('id', $userId)->first();

        if(Hash::check($currentPassword, $userInfo->password)){
            User::where('id', $userId)->update([
                'name' => $request->name,
                'password' => Hash::make($newPassword),
            ]);

            Toastr::success('Password Changed', 'Successfully');
            return back();
        } else {
            Toastr::error('Current Password is Wrong', 'Failed');
            return back();
        }

    }

    public function clearCache(){
        Artisan::call('cache:clear');
        Artisan::call('config:clear');
        Artisan::call('view:clear');
        Artisan::call('route:clear');

        Toastr::success('Cahce Cleared', 'Successfully');
        return back();
    }

    public function viewPaymentHistory(Request $request){
        if ($request->ajax()) {
            $data = OrderPayment::orderBy('id', 'desc')->get();
            return Datatables::of($data)
                    ->addIndexColumn()
                    ->make(true);
        }
        return view('backend.payment_histories');
    }
}
