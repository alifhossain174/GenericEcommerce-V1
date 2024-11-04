<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Vendor;
use App\Models\VendorExcel;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Yajra\DataTables\DataTables;
use Maatwebsite\Excel\Facades\Excel;

class VendorController extends Controller
{
    public function createNewVendor(){
        return view('backend.vendor.create');
    }

    public function saveVendor(Request $request){

        $request->validate([
            'email' => ['required', 'string', 'max:255', 'unique:users'],
        ]);

        $userId = User::insertGetId([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'password' => Hash::make($request->password),
            'email_verified_at' => Carbon::now(),
            'user_type' => 4, //vendor
            'status' => 1,
            'created_at' => Carbon::now()
        ]);

        $nidCard = null;
        if ($request->hasFile('nid_card')){
            $get_image = $request->file('nid_card');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('vendor_attachments/');
            $get_image->move($location, $image_name);
            $nidCard = "vendor_attachments/" . $image_name;
        }

        $tradeLicense = null;
        if ($request->hasFile('trade_license')){
            $get_image = $request->file('trade_license');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('vendor_attachments/');
            $get_image->move($location, $image_name);
            $tradeLicense = "vendor_attachments/" . $image_name;
        }

        Vendor::insert([
            'user_id' => $userId,
            'vendor_no' => time(). str::random(5),
            'business_name' => $request->business_name,
            'business_category' => $request->business_category ? implode(",", $request->business_category) : null,
            'trade_license_no' => $request->trade_license_no,
            'business_address' => $request->business_address,
            'nid_card' => $nidCard,
            'trade_license' => $tradeLicense,
            'created_at' => Carbon::now()
        ]);

        Toastr::success('New Vendor is Created', 'Success');
        return redirect('/view/all/vendors');
    }

    public function viewAllVendors(Request $request){
        if ($request->ajax()) {

            $data = DB::table('vendors')
                        ->leftJoin('users', 'vendors.user_id', '=', 'users.id')
                        ->leftJoin('stores', 'vendors.id', '=', 'stores.vendor_id')
                        ->select('vendors.*', 'users.name', 'users.email', 'users.phone', 'users.status', 'stores.store_name')
                        ->where('users.status', 1)
                        ->orderBy('vendors.id', 'desc')
                        ->get();

            return Datatables::of($data)
                    ->editColumn('status', function($data) {
                        if($data->status == 1){
                            return '<span class="btn btn-sm btn-success d-inline-block pt-0 pb-0">Active</span>';
                        } else {
                            return '<span class="btn btn-sm btn-danger d-inline-block pt-0 pb-0">Inactive</span>';
                        }
                    })
                    ->editColumn('created_at', function($data) {
                        return date("Y-m-d", strtotime($data->created_at));
                    })
                    ->addIndexColumn()
                    ->addColumn('action', function($data){
                        $btn = ' <a href="'.url('edit/vendor').'/'.$data->vendor_no.'" class="mb-1 btn-sm btn-warning rounded d-inline-block"><i class="fas fa-edit"></i></a>';
                        $btn .= ' <a href="'.url('remove/vendor').'/'.$data->vendor_no.'" class="mb-1 btn-sm btn-danger rounded d-inline-block"><i class="fas fa-trash"></i></a>';
                        return $btn;
                    })
                    ->rawColumns(['action', 'status'])
                    ->make(true);
        }
        return view('backend.vendor.view');
    }

    public function viewVendorRequests(Request $request){
        if ($request->ajax()) {

            $data = DB::table('vendors')
                        ->leftJoin('users', 'vendors.user_id', '=', 'users.id')
                        ->leftJoin('stores', 'vendors.id', '=', 'stores.vendor_id')
                        ->select('vendors.*', 'users.name', 'users.email', 'users.phone', 'users.status', 'users.email_verified_at', 'stores.store_name')
                        ->where('users.status', 0)
                        ->orderBy('vendors.id', 'desc')
                        ->get();

            return Datatables::of($data)
                    ->editColumn('status', function($data) {
                        if($data->status == 1){
                            return '<span class="btn btn-sm btn-success d-inline-block pt-0 pb-0">Active</span>';
                        } else {
                            return '<span class="btn btn-sm btn-info d-inline-block pt-0 pb-0">Pending</span>';
                        }
                    })
                    ->editColumn('email_verified_at', function($data) {
                        if($data->email_verified_at != null && $data->email_verified_at != ''){
                            return '<span class="btn btn-sm btn-success d-inline-block pt-0 pb-0">Yes</span>';
                        } else {
                            return '<span class="btn btn-sm btn-danger d-inline-block pt-0 pb-0">No</span>';
                        }
                    })
                    ->editColumn('created_at', function($data) {
                        return date("Y-m-d", strtotime($data->created_at));
                    })
                    ->addIndexColumn()
                    ->addColumn('action', function($data){
                        $btn = "";
                        if($data->status != 1){
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->vendor_no.'" data-original-title="Approve" class="btn-sm btn-success rounded d-inline-block approveBtn"><i class="fas fa-check"></i></a>';
                        }
                        $btn .= ' <a href="'.url('edit/vendor').'/'.$data->vendor_no.'" class="mb-1 btn-sm btn-warning rounded d-inline-block"><i class="fas fa-edit"></i></a>';
                        $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->vendor_no.'" data-original-title="Delete" class="btn-sm btn-danger rounded d-inline-block deleteBtn"><i class="fas fa-trash-alt"></i></a>';
                        return $btn;
                    })
                    ->rawColumns(['action', 'status', 'email_verified_at'])
                    ->make(true);
        }
        return view('backend.vendor.vendor_requests');
    }

    public function viewInactiveVendors(Request $request){
        if ($request->ajax()) {

            $data = DB::table('vendors')
                        ->leftJoin('users', 'vendors.user_id', '=', 'users.id')
                        ->leftJoin('stores', 'vendors.id', '=', 'stores.vendor_id')
                        ->select('vendors.*', 'users.name', 'users.email', 'users.phone', 'users.status', 'stores.store_name')
                        ->where('users.status', 2)
                        ->orderBy('vendors.id', 'desc')
                        ->get();

            return Datatables::of($data)
                    ->editColumn('status', function($data) {
                        if($data->status == 1){
                            return '<span class="btn btn-sm btn-success d-inline-block pt-0 pb-0">Active</span>';
                        } else {
                            return '<span class="btn btn-sm btn-danger d-inline-block pt-0 pb-0">Inactive</span>';
                        }
                    })
                    ->editColumn('created_at', function($data) {
                        return date("Y-m-d", strtotime($data->created_at));
                    })
                    ->addIndexColumn()
                    ->addColumn('action', function($data){
                        $btn = "";
                        if($data->status != 1){
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->vendor_no.'" data-original-title="Approve" class="btn-sm btn-success rounded d-inline-block approveBtn"><i class="fas fa-check"></i></a>';
                        }
                        $btn .= ' <a href="'.url('edit/vendor').'/'.$data->vendor_no.'" class="mb-1 btn-sm btn-warning rounded d-inline-block"><i class="fas fa-edit"></i></a>';
                        $btn .= ' <a href="'.url('remove/vendor').'/'.$data->vendor_no.'" class="mb-1 btn-sm btn-danger rounded d-inline-block"><i class="fas fa-trash"></i></a>';
                        return $btn;
                    })
                    ->rawColumns(['action', 'status'])
                    ->make(true);
        }
        return view('backend.vendor.inactive_vendors');
    }

    public function editVendor($vendorNo){
        $data = DB::table('vendors')
                    ->leftJoin('users', 'vendors.user_id', '=', 'users.id')
                    ->select('vendors.*', 'users.name', 'users.email', 'users.phone', 'users.status')
                    ->where('vendors.vendor_no', $vendorNo)
                    ->first();

        return view('backend.vendor.update', compact('data'));
    }

    public function updateVendor(Request $request){

        $vendor = Vendor::where('id', $request->vendor_id)->first();

        User::where('id', $vendor->user_id)->update([
            'name' => $request->name,
            'phone' => $request->phone,
            'status' => $request->status,
            'updated_at' => Carbon::now()
        ]);

        if($request->password){
            User::where('id', $vendor->user_id)->update([
                'password' => Hash::make($request->password),
            ]);
        }

        $nidCard = $vendor->nid_card;
        if ($request->hasFile('nid_card')){
            if($vendor->nid_card && file_exists(public_path($vendor->nid_card))){
                unlink(public_path($vendor->nid_card));
            }
            $get_image = $request->file('nid_card');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('vendor_attachments/');
            $get_image->move($location, $image_name);
            $nidCard = "vendor_attachments/" . $image_name;
        }

        $tradeLicense = $vendor->trade_license;
        if ($request->hasFile('trade_license')){
            if($vendor->trade_license && file_exists(public_path($vendor->trade_license))){
                unlink(public_path($vendor->trade_license));
            }
            $get_image = $request->file('trade_license');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('vendor_attachments/');
            $get_image->move($location, $image_name);
            $tradeLicense = "vendor_attachments/" . $image_name;
        }

        $vendor->business_name = $request->business_name;
        $vendor->business_category = $request->business_category ? implode(",", $request->business_category) : null;
        $vendor->trade_license_no = $request->trade_license_no;
        $vendor->business_address = $request->business_address;
        $vendor->nid_card = $nidCard;
        $vendor->trade_license = $tradeLicense;
        $vendor->updated_at = Carbon::now();
        $vendor->save();

        Toastr::success('Vendor Info Updated', 'Success');
        return back();
    }

    public function approveVendor($vendorNo){
        $vendor = Vendor::where('vendor_no', $vendorNo)->first();
        User::where('id', $vendor->user_id)->update([
            'status' => 1,
        ]);
        return response()->json(['success' => 'Vendor Approved Successfully.']);
    }

    public function deleteVendor($vendorNo){
        $vendor = Vendor::where('vendor_no', $vendorNo)->first();
        if($vendor->nid_card && file_exists(public_path($vendor->nid_card))){
            unlink(public_path($vendor->nid_card));
        }
        if($vendor->trade_license && file_exists(public_path($vendor->trade_license))){
            unlink(public_path($vendor->trade_license));
        }
        User::where('id', $vendor->user_id)->delete();
        $vendor->delete();
        return response()->json(['success' => 'Vendor Deleted Successfully.']);
    }

    public function removeVendor($vendorNo){

        $totalProducts = 0;
        $totalOrders = 0;
        $vendor = Vendor::where('vendor_no', $vendorNo)->first();
        $store = DB::table('stores')->where('vendor_id', $vendor->id)->first();

        if($store){
            $totalProducts = DB::table('products')->where('store_id', $store->id)->count();
            $totalOrders = DB::table('order_details')->where('store_id', $store->id)->groupBy('order_id')->count();

            if($totalOrders > 0){
                Toastr::error('Vendor has Orders', 'Please Contact Our Support Team');
                return back();
            }
            if($totalProducts > 0){
                Toastr::error('Vendor has Products', 'Please Contact Our Support Team');
                return back();
            }

            DB::table('stores')->where('vendor_id')->delete();
        }

        if($vendor->nid_card && file_exists(public_path($vendor->nid_card))){
            unlink(public_path($vendor->nid_card));
        }
        if($vendor->trade_license && file_exists(public_path($vendor->trade_license))){
            unlink(public_path($vendor->trade_license));
        }
        User::where('id', $vendor->user_id)->delete();
        $vendor->delete();

        Toastr::success('Vendor has Removed');
        return back();
    }

    public function downloadApprovedVendorsExcel(){
        return Excel::download(new VendorExcel, 'approved_vendors.xlsx');
    }
}
