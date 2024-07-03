<?php

namespace App\Http\Controllers;

use App\Models\Store;
use App\Models\Vendor;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Yajra\DataTables\DataTables;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\DB;

class StoreController extends Controller
{
    public function createNewStore(){
        $vendors = DB::table('vendors')
                        ->leftJoin('users', 'vendors.user_id', '=', 'users.id')
                        ->select('vendors.business_name', 'vendors.id', 'users.name', 'users.status')
                        ->where('users.status', 1)
                        ->orderBy('vendors.id', 'desc')
                        ->get();
        return view('backend.store.create', compact('vendors'));
    }

    public function saveStore(Request $request){

        if(Store::where('vendor_id', $request->vendor_id)->exists()){
            Toastr::error('This Vendor already have a store', 'Failed');
            return back();
        }

        $vendor = Vendor::where('id', $request->vendor_id)->first();

        $storeLogo = null;
        if ($request->hasFile('store_logo')){
            $get_image = $request->file('store_logo');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('stores/');
            $get_image->move($location, $image_name);
            $storeLogo = "stores/" . $image_name;
        }

        $storeBanner = null;
        if ($request->hasFile('store_banner')){
            $get_image = $request->file('store_banner');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('stores/');
            $get_image->move($location, $image_name);
            $storeBanner = "stores/" . $image_name;
        }

        $clean = preg_replace('/[^a-zA-Z0-9\s]/', '', strtolower($request->store_name)); //remove all non alpha numeric
        $slug = preg_replace('!\s+!', '-', $clean);

        Store::insert([
            'user_id' => $vendor->user_id,
            'vendor_id' => $vendor->id,
            'store_no' => time(). str::random(5),
            'store_name' => $request->store_name,
            'store_logo' => $storeLogo,
            'store_banner' => $storeBanner,
            'store_address' => $request->store_address,
            'store_phone' => $request->store_phone ? implode(",", $request->store_phone) : null,
            'store_email' => $request->store_email ? implode(",", $request->store_email) : null,
            'store_description' => $request->store_description,
            'store_percentage' => $request->store_percentage,
            'facebook' => $request->facebook,
            'whatsapp' => $request->whatsapp,
            'instagram' => $request->instagram,
            'tiktok' => $request->tiktok,
            'linkedin' => $request->linkedin,
            'twitter' => $request->twitter,
            'meta_title' => $request->meta_title,
            'meta_description' => $request->meta_description,
            'meta_keywords' => $request->meta_keywords ? implode(",", $request->meta_keywords) : null,
            'status' => 1,
            'slug' => $slug.'-'.time(),
            'created_at' => Carbon::now()
        ]);

        Toastr::success('New Store is Created', 'Success');
        return redirect('/view/all/stores');

    }

    public function viewAllStores(Request $request){
        if ($request->ajax()) {

            $data = DB::table('stores')
                        ->leftJoin('vendors', 'stores.vendor_id', '=', 'vendors.id')
                        ->select('stores.*', 'vendors.business_name')
                        ->orderBy('stores.id', 'desc')
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
                    ->editColumn('store_percentage', function($data) {
                        return $data->store_percentage."%";
                    })
                    ->addColumn('total_products', function($data){
                        return DB::table('products')->where('store_id', $data->id)->count();
                    })
                    ->addColumn('total_earnings', function($data){
                        return DB::table('order_details')->where('store_id', $data->id)->sum('total_price');
                    })
                    ->addIndexColumn()
                    ->addColumn('action', function($data){
                        $btn = ' <a href="'.url('edit/store').'/'.$data->slug.'" class="mb-1 btn-sm btn-warning rounded d-inline-block"><i class="fas fa-edit"></i></a>';
                        if($data->status != 1){
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Active" class="btn-sm btn-success rounded d-inline-block activeBtn"><i class="fas fa-check"></i></a>';
                        } else {
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Inactive" class="btn-sm btn-danger rounded d-inline-block inactiveBtn"><i class="feather-x"></i></a>';
                        }
                        return $btn;
                    })
                    ->rawColumns(['action', 'status'])
                    ->make(true);
        }
        return view('backend.store.view');
    }

    public function inactiveStore($id){
        Store::where('id', $id)->update([
            'status' => 0,
            'updated_at' => Carbon::now(),
        ]);
        return response()->json(['success' => 'Inactivated Successfully.']);
    }

    public function activateStore($id){
        Store::where('id', $id)->update([
            'status' => 1,
            'updated_at' => Carbon::now(),
        ]);
        return response()->json(['success' => 'Activated Successfully.']);
    }

    public function editStore($slug){
        $store = Store::where('slug', $slug)->first();

        $vendors = DB::table('vendors')
                ->leftJoin('users', 'vendors.user_id', '=', 'users.id')
                ->select('vendors.business_name', 'vendors.id', 'users.name', 'users.status')
                ->where('vendors.id', $store->vendor_id)
                ->orderBy('vendors.id', 'desc')
                ->get();

        return view('backend.store.update', compact('vendors', 'store'));
    }

    public function updateStore(Request $request){

        $store = Store::where('id', $request->store_id)->first();

        $storeLogo = $store->store_logo;
        if ($request->hasFile('store_logo')){
            if($store->store_logo && file_exists(public_path($store->store_logo))){
                unlink(public_path($store->store_logo));
            }
            $get_image = $request->file('store_logo');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('stores/');
            $get_image->move($location, $image_name);
            $storeLogo = "stores/" . $image_name;
        }

        $storeBanner = $store->store_banner;
        if ($request->hasFile('store_banner')){
            if($store->store_banner && file_exists(public_path($store->store_banner))){
                unlink(public_path($store->store_banner));
            }
            $get_image = $request->file('store_banner');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('stores/');
            $get_image->move($location, $image_name);
            $storeBanner = "stores/" . $image_name;
        }

        $clean = preg_replace('/[^a-zA-Z0-9\s]/', '', strtolower($request->store_name)); //remove all non alpha numeric
        $slug = preg_replace('!\s+!', '-', $clean);

        Store::where('id', $request->store_id)->update([
            'store_name' => $request->store_name,
            'store_logo' => $storeLogo,
            'store_banner' => $storeBanner,
            'store_address' => $request->store_address,
            'store_phone' => $request->store_phone ? implode(",", $request->store_phone) : null,
            'store_email' => $request->store_email ? implode(",", $request->store_email) : null,
            'store_description' => $request->store_description,
            'store_percentage' => $request->store_percentage,
            'facebook' => $request->facebook,
            'whatsapp' => $request->whatsapp,
            'instagram' => $request->instagram,
            'tiktok' => $request->tiktok,
            'linkedin' => $request->linkedin,
            'twitter' => $request->twitter,
            'meta_title' => $request->meta_title,
            'meta_description' => $request->meta_description,
            'meta_keywords' => $request->meta_keywords ? implode(",", $request->meta_keywords) : null,
            'slug' => $slug,
            'updated_at' => Carbon::now()
        ]);

        Toastr::success('Store Info Updated', 'Success');
        return back();
    }
}
