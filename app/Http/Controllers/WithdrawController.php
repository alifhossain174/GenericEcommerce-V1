<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Withdraw;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use Brian2694\Toastr\Facades\Toastr;
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

    public function getVendorBalance(Request $request){
        $data = DB::table('vendors')
                ->leftJoin('users', 'vendors.user_id', '=', 'users.id')
                ->leftJoin('stores', 'users.id', '=', 'stores.user_id')
                ->select('users.balance', 'stores.store_percentage')
                ->where('vendors.id', $request->vendor_id)
                ->first();

        return response()->json($data);
    }

    public function saveWithdrawRequest(Request $request){

        $vendor = DB::table('vendors')
                    ->leftJoin('stores', 'stores.vendor_id', '=', 'vendors.id')
                    ->leftJoin('users', 'vendors.user_id', '=', 'users.id')
                    ->select('vendors.id as vendor_id', 'stores.id as store_id', 'users.id as user_id', 'users.balance', 'stores.store_percentage')
                    ->where('vendors.id', $request->vendor_id)
                    ->first();

        if($vendor->balance < $request->withdraw_amount){
            Toastr::error('Not Enough Balance', 'Success');
            return back();
        }

        Withdraw::insert([
            'user_id' => $vendor->user_id,
            'vendor_id' => $vendor->vendor_id,
            'store_id' => $vendor->store_id,
            'payment_method' => $request->payment_method,
            'bank_name' => $request->bank_name,
            'branch_name' => $request->branch_name,
            'routing_no' => $request->routing_no,
            'acc_holder_name' => $request->acc_holder_name,
            'acc_no' => $request->acc_no,
            'mobile_no' => $request->mobile_no,
            'amount_before_withdraw' => $vendor->balance,
            'withdraw_amount' => $request->withdraw_amount,
            'amount_after_withdraw' => $vendor->balance - $request->withdraw_amount,
            'transaction_id' => $request->transaction_id,
            'remarks' => $request->remarks,
            'store_comission' => $vendor->store_percentage,
            'status' => 1,
            'created_at' => Carbon::now()
        ]);

        User::where('id', $vendor->user_id)->update([
            'balance' => $vendor->balance - $request->withdraw_amount,
            'updated_at' => Carbon::now(),
        ]);

        Toastr::success('Approved Withdraw Request Submitted', 'Success');
        return back();
    }

    public function viewAllWithdraws(Request $request){
        if ($request->ajax()) {

            $data = DB::table('withdraws')
                        ->leftJoin('vendors', 'withdraws.vendor_id', '=', 'vendors.id')
                        ->leftJoin('stores', 'withdraws.store_id', '=', 'stores.id')
                        ->select('withdraws.*', 'vendors.business_name', 'stores.store_name')
                        ->orderBy('withdraws.id', 'desc')
                        ->get();

            return Datatables::of($data)
                    ->editColumn('status', function($data) {
                        if($data->status == 0){
                            return '<span class="btn btn-sm btn-info d-inline-block pt-0 pb-0">Pending</span>';
                        } elseif($data->status == 1) {
                            return '<span class="btn btn-sm btn-success d-inline-block pt-0 pb-0">Approved</span>';
                        } else {
                            return '<span class="btn btn-sm btn-danger d-inline-block pt-0 pb-0">Denied</span>';
                        }
                    })
                    ->editColumn('payment_method', function($data) {
                        if($data->payment_method == 1){
                            return 'Bank';
                        } elseif($data->payment_method == 2) {
                            return 'bKash';
                        } elseif($data->payment_method == 3) {
                            return 'Nagad';
                        } elseif($data->payment_method == 4) {
                            return 'Rocket';
                        } elseif($data->payment_method == 5) {
                            return 'Upay';
                        } else {
                            return 'SureCash';
                        }
                    })
                    ->editColumn('created_at', function($data) {
                        return date("Y-m-d h:ia", strtotime($data->created_at));
                    })
                    ->addIndexColumn()
                    ->addColumn('action', function($data){
                        $btn = '<a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="View" class="mb-1 btn-sm btn-info rounded d-inline-block viewBtn"><i class="fa fa-eye"></i></a>';
                        if($data->status == 0){
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Delete" class="mb-1 btn-sm btn-danger rounded d-inline-block deleteBtn"><i class="fas fa-trash-alt"></i></a>';
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Approve" class="mb-1 btn-sm btn-success rounded d-inline-block approveBtn"><i class="fas fa-check"></i></a>';
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Denied" class="btn-sm btn-warning rounded d-inline-block denyBtn"><i class="fas fa-times"></i></a>';
                        }
                        return $btn;
                    })
                    ->rawColumns(['action', 'status'])
                    ->make(true);
        }
        return view('backend.withdraw.view');
    }

    public function viewWithdrawRequests(Request $request){
        if ($request->ajax()) {

            $data = DB::table('withdraws')
                        ->leftJoin('vendors', 'withdraws.vendor_id', '=', 'vendors.id')
                        ->leftJoin('stores', 'withdraws.store_id', '=', 'stores.id')
                        ->select('withdraws.*', 'vendors.business_name', 'stores.store_name')
                        ->orderBy('withdraws.id', 'desc')
                        ->where('withdraws.status', 0)
                        ->get();

            return Datatables::of($data)
                    ->editColumn('status', function($data) {
                        if($data->status == 0){
                            return '<span class="btn btn-sm btn-info d-inline-block pt-0 pb-0">Pending</span>';
                        } elseif($data->status == 1) {
                            return '<span class="btn btn-sm btn-success d-inline-block pt-0 pb-0">Approved</span>';
                        } else {
                            return '<span class="btn btn-sm btn-danger d-inline-block pt-0 pb-0">Denied</span>';
                        }
                    })
                    ->editColumn('payment_method', function($data) {
                        if($data->payment_method == 1){
                            return 'Bank';
                        } elseif($data->payment_method == 2) {
                            return 'bKash';
                        } elseif($data->payment_method == 3) {
                            return 'Nagad';
                        } elseif($data->payment_method == 4) {
                            return 'Rocket';
                        } elseif($data->payment_method == 5) {
                            return 'Upay';
                        } else {
                            return 'SureCash';
                        }
                    })
                    ->editColumn('created_at', function($data) {
                        return date("Y-m-d h:ia", strtotime($data->created_at));
                    })
                    ->addIndexColumn()
                    ->addColumn('action', function($data){
                        $btn = '<a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="View" class="mb-1 btn-sm btn-info rounded d-inline-block viewBtn"><i class="fa fa-eye"></i></a>';
                        if($data->status == 0){
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Delete" class="mb-1 btn-sm btn-danger rounded d-inline-block deleteBtn"><i class="fas fa-trash-alt"></i></a>';
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Approve" class="mb-1 btn-sm btn-success rounded d-inline-block approveBtn"><i class="fas fa-check"></i></a>';
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Denied" class="btn-sm btn-warning rounded d-inline-block denyBtn"><i class="fas fa-times"></i></a>';
                        }
                        return $btn;
                    })
                    ->rawColumns(['action', 'status'])
                    ->make(true);
        }
        return view('backend.withdraw.requests');
    }
    public function viewCompletedWithdraws(Request $request){
        if ($request->ajax()) {

            $data = DB::table('withdraws')
                        ->leftJoin('vendors', 'withdraws.vendor_id', '=', 'vendors.id')
                        ->leftJoin('stores', 'withdraws.store_id', '=', 'stores.id')
                        ->select('withdraws.*', 'vendors.business_name', 'stores.store_name')
                        ->orderBy('withdraws.id', 'desc')
                        ->where('withdraws.status', 1)
                        ->get();

            return Datatables::of($data)
                    ->editColumn('status', function($data) {
                        if($data->status == 0){
                            return '<span class="btn btn-sm btn-info d-inline-block pt-0 pb-0">Pending</span>';
                        } elseif($data->status == 1) {
                            return '<span class="btn btn-sm btn-success d-inline-block pt-0 pb-0">Approved</span>';
                        } else {
                            return '<span class="btn btn-sm btn-danger d-inline-block pt-0 pb-0">Denied</span>';
                        }
                    })
                    ->editColumn('payment_method', function($data) {
                        if($data->payment_method == 1){
                            return 'Bank';
                        } elseif($data->payment_method == 2) {
                            return 'bKash';
                        } elseif($data->payment_method == 3) {
                            return 'Nagad';
                        } elseif($data->payment_method == 4) {
                            return 'Rocket';
                        } elseif($data->payment_method == 5) {
                            return 'Upay';
                        } else {
                            return 'SureCash';
                        }
                    })
                    ->editColumn('created_at', function($data) {
                        return date("Y-m-d h:ia", strtotime($data->created_at));
                    })
                    ->addIndexColumn()
                    ->addColumn('action', function($data){
                        $btn = '<a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="View" class="mb-1 btn-sm btn-info rounded d-inline-block viewBtn"><i class="fa fa-eye"></i></a>';
                        if($data->status == 0){
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Delete" class="mb-1 btn-sm btn-danger rounded d-inline-block deleteBtn"><i class="fas fa-trash-alt"></i></a>';
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Approve" class="mb-1 btn-sm btn-success rounded d-inline-block approveBtn"><i class="fas fa-check"></i></a>';
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Denied" class="btn-sm btn-warning rounded d-inline-block denyBtn"><i class="fas fa-times"></i></a>';
                        }
                        return $btn;
                    })
                    ->rawColumns(['action', 'status'])
                    ->make(true);
        }
        return view('backend.withdraw.completed');
    }
    public function viewCancelledWithdraws(Request $request){
        if ($request->ajax()) {

            $data = DB::table('withdraws')
                        ->leftJoin('vendors', 'withdraws.vendor_id', '=', 'vendors.id')
                        ->leftJoin('stores', 'withdraws.store_id', '=', 'stores.id')
                        ->select('withdraws.*', 'vendors.business_name', 'stores.store_name')
                        ->orderBy('withdraws.id', 'desc')
                        ->where('withdraws.status', 2)
                        ->get();

            return Datatables::of($data)
                    ->editColumn('status', function($data) {
                        if($data->status == 0){
                            return '<span class="btn btn-sm btn-info d-inline-block pt-0 pb-0">Pending</span>';
                        } elseif($data->status == 1) {
                            return '<span class="btn btn-sm btn-success d-inline-block pt-0 pb-0">Approved</span>';
                        } else {
                            return '<span class="btn btn-sm btn-danger d-inline-block pt-0 pb-0">Denied</span>';
                        }
                    })
                    ->editColumn('payment_method', function($data) {
                        if($data->payment_method == 1){
                            return 'Bank';
                        } elseif($data->payment_method == 2) {
                            return 'bKash';
                        } elseif($data->payment_method == 3) {
                            return 'Nagad';
                        } elseif($data->payment_method == 4) {
                            return 'Rocket';
                        } elseif($data->payment_method == 5) {
                            return 'Upay';
                        } else {
                            return 'SureCash';
                        }
                    })
                    ->editColumn('created_at', function($data) {
                        return date("Y-m-d h:ia", strtotime($data->created_at));
                    })
                    ->addIndexColumn()
                    ->addColumn('action', function($data){
                        $btn = '<a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="View" class="mb-1 btn-sm btn-info rounded d-inline-block viewBtn"><i class="fa fa-eye"></i></a>';
                        if($data->status == 0){
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Delete" class="mb-1 btn-sm btn-danger rounded d-inline-block deleteBtn"><i class="fas fa-trash-alt"></i></a>';
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Approve" class="mb-1 btn-sm btn-success rounded d-inline-block approveBtn"><i class="fas fa-check"></i></a>';
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Denied" class="btn-sm btn-warning rounded d-inline-block denyBtn"><i class="fas fa-times"></i></a>';
                        }
                        return $btn;
                    })
                    ->rawColumns(['action', 'status'])
                    ->make(true);
        }
        return view('backend.withdraw.cancelled');
    }

    public function deleteWithdraw($id){
        $data = Withdraw::where('id', $id)->first();
        User::where('id', $data->user_id)->increment('balance', $data->withdraw_amount);
        Withdraw::where('id', $id)->whereIn('status', [0, 2])->delete();
        return response()->json(['success' => 'Withdraw Deleted Successfully.']);
    }

    public function denyWithdraw($id){
        $data = Withdraw::where('id', $id)->first();
        User::where('id', $data->user_id)->increment('balance', $data->withdraw_amount);
        Withdraw::where('id', $id)->update([
            'status' => 2,
            'updated_at' => Carbon::now()
        ]);
        return response()->json(['success' => 'Withdraw Denied Successfully.']);
    }

    public function approveWithdraw(Request $request){
        Withdraw::where('id', $request->id)->update([
            'transaction_id' => $request->transaction_id,
            'remarks' => $request->remarks,
            'status' => 1,
            'updated_at' => Carbon::now()
        ]);
        return response()->json(['success' => 'Withdraw Approved Successfully.']);
    }

    public function getWithdrawInfo($id){
        $data = DB::table('withdraws')
                ->leftJoin('vendors', 'withdraws.vendor_id', '=', 'vendors.id')
                ->leftJoin('stores', 'withdraws.store_id', '=', 'stores.id')
                ->select('withdraws.*', 'vendors.business_name', 'stores.store_name')
                ->where('withdraws.id', $id)
                ->first();
        return response()->json($data);
    }
}
