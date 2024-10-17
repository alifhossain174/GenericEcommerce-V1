<?php

namespace App\Http\Controllers;

use App\Models\BuySell;
use App\Models\BuySellCategory;
use App\Models\BuySellConfig;
use App\Models\BuySellImages;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Sohibd\Laravelslug\Generate;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Yajra\DataTables\DataTables;

class BuySellController extends Controller
{
    public function buySellConfig(){
        $config = BuySellConfig::where('id', 1)->first();
        return view('backend.buy_sell.config', compact('config'));
    }

    public function buySellConfigUpdate(Request $request){

        $config = BuySellConfig::where('id', 1)->first();

        $banner = $config->banner;
        if ($request->hasFile('banner')){
            $get_image = $request->file('banner');

            $allowedExtensions = array("jpg", "png", "jpeg", "svg");
            if (!in_array(strtolower($get_image->getClientOriginalExtension()), $allowedExtensions)){
                Toastr::error('Supported File for Banner: jpg/png/svg');
                return back();
            }

            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('buysell_config/');
            // Image::make($get_image)->save($location . $image_name, 80);
            $get_image->move($location, $image_name);
            $banner = "buysell_config/" . $image_name;
        }

        BuySellConfig::where('id', 1)->update([
            'banner' => $banner,
            'description' => $request->description,
            'updated_at' => Carbon::now()
        ]);

        Toastr::success('Config has been updated', 'Success');
        return back();
    }

    public function createNew(){
        return view('backend.buy_sell.create_category');
    }

    public function saveCategory(Request $request){

        $icon = null;
        if ($request->hasFile('icon')){
            $get_image = $request->file('icon');

            $allowedExtensions = array("jpg", "png", "jpeg", "svg");
            if (!in_array(strtolower($get_image->getClientOriginalExtension()), $allowedExtensions)){
                Toastr::error('Supported File for Icon: jpg/png/svg');
                return back();
            }

            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('buysell_category_icons/');
            // Image::make($get_image)->save($location . $image_name, 80);
            $get_image->move($location, $image_name);
            $icon = "buysell_category_icons/" . $image_name;
        }

        BuySellCategory::insert([
            'name' => $request->name,
            'icon' => $icon,
            'slug' => Generate::Slug($request->name),
            'status' => 1,
            'serial' => BuySellCategory::min('serial') - 1,
            'created_at' => Carbon::now()
        ]);

        Toastr::success('Category has been Added', 'Success');
        return back();

    }

    public function viewCategories(Request $request){
        if ($request->ajax()) {
            $data = BuySellCategory::orderBy('serial', 'asc')->get();
            return Datatables::of($data)
                    ->editColumn('status', function($data) {
                        if($data->status == 1){
                            return '<span style="color:green; font-weight: 600">Active</span>';
                        } else {
                            return '<span style="color:#DF3554; font-weight: 600">Inactive</span>';
                        }
                    })
                    ->editColumn('icon', function($data) {
                        if($data->icon && file_exists(public_path($data->icon))){
                            return $data->icon;
                        }
                    })
                    ->addIndexColumn()
                    ->addColumn('action', function($data){
                        $btn = ' <a href="'.url('edit/buy/sell/category').'/'.$data->slug.'" class="mb-1 btn-sm btn-warning rounded"><i class="fas fa-edit"></i></a>';
                        $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->slug.'" data-original-title="Delete" class="btn-sm btn-danger rounded deleteBtn"><i class="fas fa-trash-alt"></i></a>';
                        return $btn;
                    })
                    ->rawColumns(['action', 'icon', 'status'])
                    ->make(true);
        }
        return view('backend.buy_sell.view_categories');
    }

    public function deleteBuySellCategory($slug){
        $data = BuySellCategory::where('slug', $slug)->first();
        if($data->icon){
            if(file_exists(public_path($data->icon))){
                unlink(public_path($data->icon));
            }
        }
        $data->delete();
        return response()->json(['success' => 'Category deleted successfully.']);
    }

    public function editBuySellCategory($slug){
        $category = BuySellCategory::where('slug', $slug)->first();
        return view('backend.buy_sell.update_category', compact('category'));
    }

    public function updateBuySellCategory(Request $request){
        $duplicateCategoryExists = BuySellCategory::where('id', '!=', $request->id)->where('name', $request->name)->first();
        $duplicateCategorySlugExists = BuySellCategory::where('id', '!=', $request->id)->where('slug', $request->slug)->first();
        if($duplicateCategoryExists || $duplicateCategorySlugExists){
            Toastr::warning('Duplicate Category Or Slug Exists', 'Duplicate');
            return back();
        }

        $data = BuySellCategory::where('id', $request->id)->first();

        $icon = $data->icon;
        if ($request->hasFile('icon')){

            if($icon != '' && file_exists(public_path($icon))){
                unlink(public_path($icon));
            }

            $get_image = $request->file('icon');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('buysell_category_icons/');
            // Image::make($get_image)->save($location . $image_name, 80);
            $get_image->move($location, $image_name);
            $icon = "buysell_category_icons/" . $image_name;
        }

        BuySellCategory::where('id', $request->id)->update([
            'name' => $request->name,
            'icon' => $icon,
            'slug' => Generate::Slug($request->slug),
            'status' => $request->status,
            'updated_at' => Carbon::now()
        ]);

        Toastr::success('Category has been Updated', 'Success');
        return redirect('/view/buy/sell/categories');
    }

    public function rearrangeBuySellCategory(){
        $categories = BuySellCategory::orderBy('serial', 'asc')->get();
        return view('backend.buy_sell.rearrange_categories', compact('categories'));
    }

    public function saveRearrangeBuySellCategory(Request $request){
        $sl = 1;
        foreach($request->slug as $slug){
            BuySellCategory::where('slug', $slug)->update([
                'serial' => $sl
            ]);
            $sl++;
        }
        Toastr::success('Category has been Rerranged', 'Success');
        return redirect('/view/buy/sell/categories');
    }

    public function buySellListing(Request $request){
        if ($request->ajax()) {

            $data = DB::table('buy_sells')
                    ->leftJoin('buy_sell_categories', 'buy_sells.category_id', 'buy_sell_categories.id')
                    ->leftJoin('users', 'buy_sells.posted_by', 'users.id')
                    ->select('buy_sells.*', 'buy_sell_categories.name as category_name', 'users.name as user_name')
                    ->orderBy('serial', 'asc')
                    ->get();

            return Datatables::of($data)
                    ->editColumn('status', function($data) {
                        if($data->status == 0){
                            return '<span style="color:blue; font-weight: 600">Pending</span>';
                        } elseif($data->status == 1) {
                            return '<span style="color:green; font-weight: 600">Approved</span>';
                        } elseif($data->status == 2) {
                            return '<span style="color:red; font-weight: 600">Denied</span>';
                        } else {
                            return '<span style="color:black; font-weight: 600">Sold</span>';
                        }
                    })
                    ->editColumn('image', function($data) {
                        if($data->image && file_exists(public_path($data->image))){
                            return $data->image;
                        }
                    })
                    ->addIndexColumn()
                    ->addColumn('action', function($data){
                        $link = env('APP_FRONTEND_URL')."/sale-products/".$data->slug;
                        $btn = ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->slug.'" data-original-title="Delete" class="btn-sm btn-danger rounded deleteBtn"><i class="fas fa-trash-alt"></i></a>';
                        $btn .= ' <a target="_blank" href="'.$link.'" class="btn-sm btn-info rounded"><i class="fa fa-eye"></i></a>';

                        if($data->status == 0){
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->slug.'" data-original-title="Approve" class="btn-sm btn-success rounded approveBtn"><i class="fas fa-check"></i></a>';
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->slug.'" data-original-title="Deny" class="btn-sm btn-danger rounded denyBtn"><i class="fas fa-times"></i></a>';
                        }

                        return $btn;
                    })
                    ->rawColumns(['action', 'image', 'status'])
                    ->make(true);
        }
        return view('backend.buy_sell.listing');
    }

    public function deleteBuySellListing($slug){
        $data = BuySell::where('slug', $slug)->first();

        $buySellimages = BuySellImages::where('buy_sell_id', $data->id)->get();
        if(count($buySellimages) > 0){
            foreach($buySellimages as $buySellimage){
                if($buySellimage->image){
                    if(file_exists(public_path($buySellimage->image))){
                        unlink(public_path($buySellimage->image));
                    }
                }
            }
        }

        if($data->image){
            if(file_exists(public_path($data->image))){
                unlink(public_path($data->image));
            }
        }

        BuySellImages::where('buy_sell_id', $data->id)->delete();
        $data->delete();
        return response()->json(['success' => 'Data Deleted Successfully.']);
    }

    public function approveBuySellListing($slug){
        $data = BuySell::where('slug', $slug)->first();
        $data->status = 1;
        $data->save();
        return response()->json(['success' => 'Data Saved Successfully.']);
    }

    public function denyBuySellListing($slug){
        $data = BuySell::where('slug', $slug)->first();
        $data->status = 2;
        $data->save();
        return response()->json(['success' => 'Data Saved Successfully.']);
    }
}
