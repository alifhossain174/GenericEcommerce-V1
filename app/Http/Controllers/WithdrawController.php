<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class WithdrawController extends Controller
{
    public function createWithdrawRequest(){
        $vendors = DB::table('vendors')
                ->leftJoin('stores', 'vendors.id', '=', 'stores.vendor_id')
                ->leftJoin('users', 'vendors.user_id', '=', 'users.id')
                ->select('vendors.id', 'vendors.business_name', 'stores.store_name', 'users.name')
                ->orderBy('vendors.id', 'desc')
                ->get();

        return view('backend.withdraw.create', compact('vendors'));
    }
}
