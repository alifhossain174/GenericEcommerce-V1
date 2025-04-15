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
            $countOrdersRatioSuccess[$i] = Order::whereBetween('order_date', [$orderRatioStartDate, $orderRatioEndDate])->where('order_status', 4)->count();
            $countOrdersRatioFailed[$i] = Order::whereBetween('order_date', [$orderRatioStartDate, $orderRatioEndDate])->where('order_status', '!=', 4)->count();
        }
        // success and failed order ratio end

        // Today's Order Statistics
    $todayStart = date('Y-m-d') . ' 00:00:00';
    $todayEnd = date('Y-m-d') . ' 23:59:59';
    $todayOrderAmount = Order::whereBetween('order_date', [$todayStart, $todayEnd])
        ->where('order_status', '!=', 4)  // Excluding cancelled orders
        ->sum('total');

    // Lifetime Statistics
    $lifetimeStats = [
        'totalOrderValue' => Order::where('order_status', '!=', 4)->sum('total'),
        'totalOrders' => Order::where('order_status', '!=', 4)->count(),
        'averageOrderValue' => Order::where('order_status', '!=', 4)->avg('total'),
        'totalCustomers' => User::where('user_type', 3)->count(), // Assuming user_type 3 is for customers
    ];

    // Pending Order Statistics
    $pendingOrderStats = [
        'count' => Order::where('order_status', 0)->count(),
        'value' => Order::where('order_status', 0)->sum('total')
    ];

    // Vendor Statistics
    $totalVendors = User::where('user_type', 2)->count(); // Assuming user_type 2 is for vendors

    // Your existing code remains here...
    $recentCustomers = User::where('user_type', 3)->orderBy('id', 'desc')->skip(0)->limit(5)->get();

    $completedOrderStats = [
        'value' => Order::whereIn('order_status', [3, 9])->sum('total'),
        'count' => Order::whereIn('order_status', [3, 9])->count()
    ];
//recent orders
$recentOrders = DB::table('orders')
->leftJoin('shipping_infos', 'shipping_infos.order_id', '=', 'orders.id')
->select('orders.*')
->orderBy('orders.id', 'desc')
->limit(10)
->get();

//top customers
$topCustomers = DB::table('orders')
->join('users', 'orders.user_id', '=', 'users.id')
->join('shipping_infos', 'orders.id', '=', 'shipping_infos.order_id')
->select(
'users.id as user_id',
'shipping_infos.full_name',
'shipping_infos.phone',
DB::raw('COUNT(orders.id) as total_orders'),
DB::raw('SUM(orders.total) as total_spent')
)
->whereNotIn('orders.order_status', [4, 8])  // Excluding cancelled and returned orders
->groupBy('users.id', 'shipping_infos.full_name', 'shipping_infos.phone')
->orderBy('total_spent', 'desc')
->limit(10)
->get();

//recent tickets
$recentTickets = DB::table('support_tickets')
->select('support_tickets.*')
->orderBy('id', 'desc')
->limit(10)
->get();

// best selling products
$topProducts = DB::table('order_details as od')
   ->join('products as p', 'od.product_id', '=', 'p.id')
   ->join('orders as o', 'od.order_id', '=', 'o.id')
   ->whereIn('o.order_status', [3, 9])
   ->select(
       'p.id',
       'p.name',
       'p.code',
       'p.slug',
       DB::raw('SUM(od.qty) as total_quantity'),
       DB::raw('SUM(od.total_price) as total_sales'),
       DB::raw('COUNT(DISTINCT o.id) as order_count')
   )
   ->groupBy('p.id', 'p.name', 'p.code', 'p.slug')
   ->orderBy('total_quantity', 'desc')
   ->limit(10)
   ->get();  
// top categories
$topCategories = DB::table('order_details as od')
   ->join('products as p', 'od.product_id', '=', 'p.id')
   ->join('categories as c', function($join) {
       $join->whereRaw('FIND_IN_SET(c.id, p.category_id) > 0');
   })
   ->join('orders as o', 'od.order_id', '=', 'o.id')
   ->whereIn('o.order_status', [3, 9])
   ->where('o.payment_status', 1)
   ->select(
       'c.id',
       'c.name',
       'c.slug',
       DB::raw('COUNT(DISTINCT o.id) as total_orders'),
       DB::raw('SUM(od.qty) as total_quantity'),
       DB::raw('SUM(od.total_price) as total_sales')
   )
   ->groupBy('c.id', 'c.name', 'c.slug')
   ->orderBy('total_quantity', 'desc')
   ->limit(10)
   ->get();
   
   //top cities
   $topCities = $this->getTopCities('allTime');

    // Calculate net revenue
$isMultiVendor = env('MultiVendor') == true;

// First debug the raw numbers
$orderStats = DB::table('orders')
    ->whereIn('order_status', [3, 9])
    ->select(
        DB::raw('COUNT(DISTINCT id) as total_orders'),
        DB::raw('SUM(total) as gross_total'),
        DB::raw('SUM(cost_price) as total_cost_price'),
        DB::raw('SUM(discount) as total_discount'),
        DB::raw('SUM(delivery_fee) as total_delivery'),
        DB::raw('SUM(vat + tax) as total_tax')
    )
    ->first();

\Log::info('Raw Order Stats:', [
    'Orders' => $orderStats->total_orders,
    'Gross' => $orderStats->gross_total,
    'Cost' => $orderStats->total_cost_price,
    'Discount' => $orderStats->total_discount,
    'Delivery' => $orderStats->total_delivery,
    'Tax' => $orderStats->total_tax
]);

// Then calculate revenue with store percentage
$revenue = DB::table('orders as o')
    ->leftJoin('products as p', function($join) {
        $join->on(DB::raw('JSON_CONTAINS(p.category_id, CAST(o.id AS CHAR))'), '=', DB::raw('1'));
    })
    ->leftJoin('stores as s', 'p.store_id', '=', 's.id')
    ->whereIn('o.order_status', [3, 9])
    ->select(
        DB::raw('SUM(o.total) as total_revenue'),
        DB::raw('SUM(CASE 
            WHEN o.cost_price > 0 THEN o.cost_price 
            WHEN ' . ($isMultiVendor ? 'true' : 'false') . ' AND s.store_percentage > 0 
                THEN (o.total * s.store_percentage / 100)
            ELSE 0 
        END) as vendor_cost'),
        DB::raw('SUM(o.discount) as total_discount'),
        DB::raw('SUM(o.delivery_fee) as total_delivery_fee'),
        DB::raw('SUM(o.vat + o.tax) as total_tax')
    )
    ->first();

\Log::info('Revenue Stats:', [
    'Revenue' => $revenue->total_revenue,
    'Vendor Cost' => $revenue->vendor_cost,
    'Discount' => $revenue->total_discount,
    'Delivery' => $revenue->total_delivery_fee,
    'Tax' => $revenue->total_tax
]);

// Calculate net revenue
$netRevenue = ($revenue->total_revenue + $revenue->total_delivery_fee) - 
              ($revenue->total_discount + $revenue->vendor_cost);

\Log::info('Final Calculation:', [
    'Net Revenue' => $netRevenue
]);

// Prepare data for sales statistics
$salesStats = [
        'allTime' => $this->getAllTimeData(),
        'lastMonth' => $this->getLastSixMonthsData(),
        'thisYear' => $this->getThisYearData(),
        'lastYear' => $this->getLastYearData()
    ];
        return view('backend.dashboard', compact('recentOrders','topCustomers','recentCustomers','recentTickets','topProducts','topCategories','topCities','orderPayments', 'countOrders', 'totalOrderAmount', 'todaysOrder', 'registeredUsers', 'bestSelling', 'queryStartDate', 'countOrdersRatioDate', 'countOrdersRatioSuccess', 'countOrdersRatioFailed','todayOrderAmount','completedOrderStats',
        'lifetimeStats',
        'pendingOrderStats',
        'totalVendors','netRevenue','salesStats'));
    }

// best selling products
public function getTopProducts($timeRange = 'allTime')
{
    $query = DB::table('order_details as od')
        ->join('products as p', 'od.product_id', '=', 'p.id')
        ->join('orders as o', 'od.order_id', '=', 'o.id')
        ->whereIn('o.order_status', [3, 9]);

    // Add date range filter with precise dates
    switch($timeRange) {
        case 'thisMonth':
            $query->whereBetween('o.order_date', [
                date('Y-m-01 00:00:00'), // First day of current month
                date('Y-m-t 23:59:59')   // Last day of current month
            ]);
            break;
        case 'lastMonth':
            $firstDayLastMonth = date('Y-m-01 00:00:00', strtotime('-1 month'));
            $lastDayLastMonth = date('Y-m-t 23:59:59', strtotime('-1 month'));
            $query->whereBetween('o.order_date', [$firstDayLastMonth, $lastDayLastMonth]);
            break;
        case 'last6Month':
            $query->where('o.order_date', '>=', now()->subMonths(6));
            break;
        case 'thisYear':
            $query->whereYear('o.order_date', date('Y'));
            break;
        case 'lastYear':
            $query->whereYear('o.order_date', date('Y') - 1);
            break;
    }

    // Get initial products for the time period
    $topProducts = $query->select(
            'p.id',
            'p.name',
            'p.code',
            'p.slug',
            DB::raw('SUM(od.qty) as total_quantity'),
            DB::raw('SUM(od.total_price) as total_sales'),
            DB::raw('COUNT(DISTINCT o.id) as order_count')
        )
        ->groupBy('p.id', 'p.name', 'p.code', 'p.slug')
        ->orderBy('total_quantity', 'desc')
        ->get();  // Remove limit here to check actual count

    // Debug the query
    \Log::info('Top Products Query:', [
        'timeRange' => $timeRange,
        'count' => $topProducts->count(),
        'sql' => $query->toSql(),
        'bindings' => $query->getBindings()
    ]);

    // Only return top 10
    return $topProducts->take(10);
}
// Get top customers
public function getTopCustomers($timeRange = 'allTime')
{
    $query = DB::table('orders as o')
        ->join('users as u', 'u.id', '=', 'o.user_id')
        ->join('shipping_infos as si', 'o.id', '=', 'si.order_id')
        ->where('u.user_type', 3)
        ->whereIn('o.order_status', [3, 9]);

    // Apply date filter to a subquery to maintain top 10 across filtered data
    switch($timeRange) {
        case 'thisMonth':
            $query->whereMonth('o.order_date', date('m'))
                  ->whereYear('o.order_date', date('Y'));
            break;
        case 'lastMonth':
            $query->whereMonth('o.order_date', date('m', strtotime('-1 month')))
                  ->whereYear('o.order_date', date('Y', strtotime('-1 month')));
            break;
        case 'last6Month':
            $query->where('o.order_date', '>=', now()->subMonths(6));
            break;
        case 'thisYear':
            $query->whereYear('o.order_date', date('Y'));
            break;
        case 'lastYear':
            $query->whereYear('o.order_date', date('Y') - 1);
            break;
    }

    // Get customer totals first
    $customerTotals = $query->select(
            'u.id as user_id',
            DB::raw('MAX(si.full_name) as full_name'),
            DB::raw('MAX(si.phone) as phone'),
            DB::raw('COUNT(DISTINCT o.id) as total_orders'),
            DB::raw('SUM(o.total) as total_spent')
        )
        ->groupBy('u.id')
        ->orderBy('total_spent', 'desc')
        ->limit(10);

    // Get all matching customers to ensure we always have data
    $topCustomers = DB::table(DB::raw("({$customerTotals->toSql()}) as sub"))
        ->mergeBindings($customerTotals)
        ->orderBy('total_spent', 'desc')
        ->get();

    // If we still have fewer than 10 customers, supplement with all-time top customers
    if ($topCustomers->count() < 10 && $timeRange !== 'allTime') {
        $remaining = 10 - $topCustomers->count();
        
        // Get additional customers excluding ones we already have
        $additionalCustomers = DB::table('orders as o')
            ->join('users as u', 'u.id', '=', 'o.user_id')
            ->join('shipping_infos as si', 'o.id', '=', 'si.order_id')
            ->where('u.user_type', 3)
            ->whereIn('o.order_status', [3, 9])
            ->whereNotIn('u.id', $topCustomers->pluck('user_id')->toArray())
            ->select(
                'u.id as user_id',
                DB::raw('MAX(si.full_name) as full_name'),
                DB::raw('MAX(si.phone) as phone'),
                DB::raw('COUNT(DISTINCT o.id) as total_orders'),
                DB::raw('SUM(o.total) as total_spent')
            )
            ->groupBy('u.id')
            ->orderBy('total_spent', 'desc')
            ->limit($remaining)
            ->get();

        // Combine the results
        $topCustomers = $topCustomers->concat($additionalCustomers);
    }

    // Debug output
    \Log::info('Top Customers Query:', [
        'timeRange' => $timeRange,
        'count' => $topCustomers->count(),
        'customers' => $topCustomers
    ]);

    return $topCustomers;
}

// Get top cities
public function getTopCities($timeRange = 'allTime')
{
    $query = DB::table('orders as o')
        ->join('shipping_infos as si', 'o.id', '=', 'si.order_id')
        ->whereIn('o.order_status', [3, 9])  // Completed orders
        ->whereNotNull('si.city')
        ->where('si.city', '!=', '');

    // Add date range filter
    switch($timeRange) {
        case 'thisMonth':
            $query->whereMonth('o.order_date', date('m'))
                  ->whereYear('o.order_date', date('Y'));
            break;
        case 'lastMonth':
            $query->whereMonth('o.order_date', date('m', strtotime('-1 month')))
                  ->whereYear('o.order_date', date('Y', strtotime('-1 month')));
            break;
        case 'last6Month':
            $query->where('o.order_date', '>=', now()->subMonths(6));
            break;
        case 'thisYear':
            $query->whereYear('o.order_date', date('Y'));
            break;
        case 'lastYear':
            $query->whereYear('o.order_date', date('Y') - 1);
            break;
    }

    return $query->select(
            'si.city',
            DB::raw('COUNT(DISTINCT o.id) as total_orders'),
            DB::raw('SUM(o.total) as total_sales'),
            DB::raw('COUNT(DISTINCT o.user_id) as total_customers')
        )
        ->groupBy('si.city')
        ->orderBy('total_sales', 'desc')
        ->limit(20)
        ->get();
}

// Get monthly data for sales statistics
 private function getLastSixMonthsData()
{
    $data = [];
    $isMultiVendor = env('MultiVendor') == true;

    for($i = 5; $i >= 0; $i--) {
        $month = date('M', strtotime("-$i month"));
        $startDate = date('Y-m-01', strtotime("-$i month"));
        $endDate = date('Y-m-t', strtotime("-$i month"));

        $orderStats = DB::table('orders as o')
            ->leftJoin('products as p', function($join) {
                $join->on(DB::raw('JSON_CONTAINS(p.category_id, CAST(o.id AS CHAR))'), '=', DB::raw('1'));
            })
            ->leftJoin('stores as s', 'p.store_id', '=', 's.id')
            ->whereBetween('o.order_date', [$startDate, $endDate])
            ->whereIn('o.order_status', [3, 9])
            ->select(
                DB::raw('COUNT(DISTINCT o.id) as total_orders'),
                DB::raw('SUM(o.total) as total_sales'),
                DB::raw('SUM(CASE 
                    WHEN o.cost_price > 0 THEN o.cost_price 
                    WHEN ' . ($isMultiVendor ? 'true' : 'false') . ' AND s.store_percentage > 0 
                        THEN (o.total * s.store_percentage / 100)
                    ELSE 0 
                END) as vendor_cost'),
                DB::raw('SUM(o.discount) as total_discount'),
                DB::raw('SUM(o.delivery_fee) as total_delivery_fee')
            )
            ->first();

        $revenue = ($orderStats->total_sales + $orderStats->total_delivery_fee) - 
                  ($orderStats->total_discount + $orderStats->vendor_cost);

        $data['categories'][] = $month;
        $data['totalSales'][] = round($orderStats->total_sales ?? 0, 0);
        $data['revenue'][] = round($revenue ?? 0, 0);
        $data['numberOfOrders'][] = $orderStats->total_orders ?? 0;
    }
    return $data;
}

private function getThisYearData()
{
    $data = [];
    $currentYear = date('Y');
    $isMultiVendor = env('MultiVendor') == true;
    
    for($month = 1; $month <= 12; $month++) {
        $startDate = date("$currentYear-$month-01");
        $endDate = date("$currentYear-$month-t");
        
        $orderStats = DB::table('orders as o')
            ->leftJoin('products as p', function($join) {
                $join->on(DB::raw('JSON_CONTAINS(p.category_id, CAST(o.id AS CHAR))'), '=', DB::raw('1'));
            })
            ->leftJoin('stores as s', 'p.store_id', '=', 's.id')
            ->whereBetween('o.order_date', [$startDate, $endDate])
            ->whereIn('o.order_status', [3, 9])
            ->select(
                DB::raw('COUNT(DISTINCT o.id) as total_orders'),
                DB::raw('SUM(o.total) as total_sales'),
                DB::raw('SUM(CASE 
                    WHEN o.cost_price > 0 THEN o.cost_price 
                    WHEN ' . ($isMultiVendor ? 'true' : 'false') . ' AND s.store_percentage > 0 
                        THEN (o.total * s.store_percentage / 100)
                    ELSE 0 
                END) as vendor_cost'),
                DB::raw('SUM(o.discount) as total_discount'),
                DB::raw('SUM(o.delivery_fee) as total_delivery_fee')
            )
            ->first();

        $revenue = ($orderStats->total_sales + $orderStats->total_delivery_fee) - 
                  ($orderStats->total_discount + $orderStats->vendor_cost);

        $data['categories'][] = date('M', strtotime($startDate));
        $data['totalSales'][] = round($orderStats->total_sales ?? 0, 0);
        $data['revenue'][] = round($revenue ?? 0, 0);
        $data['numberOfOrders'][] = $orderStats->total_orders ?? 0;
    }
    return $data;
}

private function getLastYearData()
{
    $data = [];
    $lastYear = date('Y') - 1;
    $isMultiVendor = env('MultiVendor') == true;
    
    for($month = 1; $month <= 12; $month++) {
        $startDate = date("$lastYear-$month-01");
        $endDate = date("$lastYear-$month-t");
        
        $orderStats = DB::table('orders as o')
            ->leftJoin('products as p', function($join) {
                $join->on(DB::raw('JSON_CONTAINS(p.category_id, CAST(o.id AS CHAR))'), '=', DB::raw('1'));
            })
            ->leftJoin('stores as s', 'p.store_id', '=', 's.id')
            ->whereBetween('o.order_date', [$startDate, $endDate])
            ->whereIn('o.order_status', [3, 9])
            ->select(
                DB::raw('COUNT(DISTINCT o.id) as total_orders'),
                DB::raw('SUM(o.total) as total_sales'),
                DB::raw('SUM(CASE 
                    WHEN o.cost_price > 0 THEN o.cost_price 
                    WHEN ' . ($isMultiVendor ? 'true' : 'false') . ' AND s.store_percentage > 0 
                        THEN (o.total * s.store_percentage / 100)
                    ELSE 0 
                END) as vendor_cost'),
                DB::raw('SUM(o.discount) as total_discount'),
                DB::raw('SUM(o.delivery_fee) as total_delivery_fee')
            )
            ->first();

        $revenue = ($orderStats->total_sales + $orderStats->total_delivery_fee) - 
                  ($orderStats->total_discount + $orderStats->vendor_cost);

        $data['categories'][] = date('M', strtotime($startDate));
        $data['totalSales'][] = round($orderStats->total_sales ?? 0, 0);
        $data['revenue'][] = round($revenue ?? 0, 0);
        $data['numberOfOrders'][] = $orderStats->total_orders ?? 0;
    }
    return $data;
}
private function getAllTimeData()
{
    // Get year range
    $startYear = DB::table('orders')
        ->whereIn('order_status', [3, 9])
        ->min(DB::raw('YEAR(order_date)')) ?? date('Y');
    $currentYear = date('Y');
    
    $data = [];
    $isMultiVendor = env('MultiVendor') == true;

    for($year = $startYear; $year <= $currentYear; $year++) {
        $orderStats = DB::table('orders as o')
            ->leftJoin('products as p', function($join) {
                $join->on(DB::raw('JSON_CONTAINS(p.category_id, CAST(o.id AS CHAR))'), '=', DB::raw('1'));
            })
            ->leftJoin('stores as s', 'p.store_id', '=', 's.id')
            ->whereYear('o.order_date', $year)
            ->whereIn('o.order_status', [3, 9])
            ->select(
                DB::raw('COUNT(DISTINCT o.id) as total_orders'),
                DB::raw('SUM(o.total) as total_sales'),
                DB::raw('SUM(CASE 
                    WHEN o.cost_price > 0 THEN o.cost_price 
                    WHEN ' . ($isMultiVendor ? 'true' : 'false') . ' AND s.store_percentage > 0 
                        THEN (o.total * s.store_percentage / 100)
                    ELSE 0 
                END) as vendor_cost'),
                DB::raw('SUM(o.discount) as total_discount'),
                DB::raw('SUM(o.delivery_fee) as total_delivery_fee')
            )
            ->first();

        $revenue = ($orderStats->total_sales + $orderStats->total_delivery_fee) - 
                  ($orderStats->total_discount + $orderStats->vendor_cost);

        $data['categories'][] = $year;
        $data['totalSales'][] = round($orderStats->total_sales ?? 0, 0);
        $data['revenue'][] = round($revenue ?? 0, 0);
        $data['numberOfOrders'][] = $orderStats->total_orders ?? 0;
    }

    return $data;
}
    // Get monthly data for sales statistics

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

    public function updataPaymentAmount(Request $request)
    {
        try {
            $payment = OrderPayment::find($request->id);
            $payment->store_amount = $request->amount;
            $payment->amount = $request->amount;
            $payment->updated_at = now();
            $payment->update();
            return response()->json(['status' => 'success','message' => 'Payment Amount Updated successfully.']);
        } catch (\Throwable $th) {
            return response()->json(['status' => 'success','message' => $th->getMessage()]);
        }
    }
}
