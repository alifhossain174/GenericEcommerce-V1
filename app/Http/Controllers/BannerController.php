<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\PromotionalBanner;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Str;
use DataTables;
use DateTime;

class BannerController extends Controller
{
    public function viewAllSliders(Request $request){
        if ($request->ajax()) {

            $data = Banner::where('type', 1)->orderBy('serial', 'asc')->get();

            return Datatables::of($data)
                    ->editColumn('status', function($data) {
                        if($data->status == 1){
                            return '<span class="btn btn-sm btn-success rounded" style="padding: 0.1rem .5rem;">Active</span>';
                        } else {
                            return '<span class="btn btn-sm btn-warning rounded" style="padding: 0.1rem .5rem;">Inactive</span>';
                        }
                    })
                    ->addIndexColumn()
                    ->addColumn('action', function($data){
                        $btn = ' <a href="'.url('edit/slider').'/'.$data->slug.'" class="mb-1 btn-sm btn-warning rounded"><i class="fas fa-edit"></i></a>';
                        $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->slug.'" data-original-title="Delete" class="btn-sm btn-danger rounded deleteBtn"><i class="fas fa-trash-alt"></i></a>';
                        return $btn;
                    })
                    ->rawColumns(['action', 'image', 'status'])
                    ->make(true);
        }
        return view('backend.banners.sliders');
    }

    public function addNewSlider(){
        return view('backend.banners.create_slider');
    }

    public function saveNewSlider(Request $request){
        $request->validate([
            'image' => 'required',
        ]);

        $image = null;
        if ($request->hasFile('image')){
            $get_image = $request->file('image');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('banner/');
            $get_image->move($location, $image_name);
            $image = "banner/" . $image_name;
        }

        Banner::insert([
            'type' => 1,
            'image' => $image,
            'link' => $request->link,

            'sub_title' => $request->sub_title,
            'title' => $request->title,
            'description' => $request->description,
            'btn_text' => $request->btn_text,
            'btn_link' => $request->btn_link,
            'text_position' => $request->text_position,
            'serial' => Banner::min('serial') - 1,

            'status' => 1,
            'slug' => str::random(5) . time(),
            'created_at' => Carbon::now()
        ]);

        Toastr::success('Slider has been Added', 'Success');
        return back();
    }

    public function deleteData($slug){
        $data = Banner::where('slug', $slug)->first();
        if($data->image){
            if(file_exists(public_path($data->image))){
                unlink(public_path($data->image));
            }
        }
        $data->delete();
        return response()->json(['success' => 'Data deleted successfully.']);
    }

    public function editSlider($slug){
        $data = Banner::where('slug', $slug)->first();
        return view('backend.banners.update_slider', compact('data'));
    }

    public function updateSlider(Request $request){
        $request->validate([
            'status' => 'required',
        ]);

        $data = Banner::where('slug', $request->slug)->first();

        $image = $data->image;
        if ($request->hasFile('image')){

            if($image != '' && file_exists(public_path($image))){
                unlink(public_path($image));
            }

            $get_image = $request->file('image');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('banner/');
            // Image::make($get_image)->save($location . $image_name, 80);
            $get_image->move($location, $image_name);
            $image = "banner/" . $image_name;
        }

        $data->image = $image;
        $data->status = $request->status;
        $data->link = $request->link;

        $data->sub_title = $request->sub_title;
        $data->title = $request->title;
        $data->description = $request->description;
        $data->btn_text = $request->btn_text;
        $data->btn_link = $request->btn_link;
        $data->text_position = $request->text_position;

        $data->updated_at = Carbon::now();
        $data->save();

        Toastr::success('Data has been Updated', 'Success');
        return redirect('/view/all/sliders');

    }

    public function rearrangeSlider(){
        $data = Banner::where('type', 1)->orderBy('serial', 'asc')->get();
        return view('backend.banners.rearrange_slider', compact('data'));
    }

    public function updateRearrangedSliders(Request $request){
        $sl = 1;
        foreach($request->slug as $slug){
            Banner::where('slug', $slug)->update([
                'serial' => $sl
            ]);
            $sl++;
        }
        Toastr::success('Slider has been Rerranged', 'Success');
        return redirect('/view/all/sliders');
    }







    public function viewAllBanners(Request $request){
        if ($request->ajax()) {

            $data = Banner::where('type', 2)->orderBy('id', 'desc')->get();

            return Datatables::of($data)
                    ->editColumn('status', function($data) {
                        if($data->status == 1){
                            return 'Active';
                        } else {
                            return 'Inactive';
                        }
                    })
                    ->addIndexColumn()
                    ->addColumn('action', function($data){
                        $btn = ' <a href="'.url('edit/banner').'/'.$data->slug.'" class="mb-1 btn-sm btn-warning rounded"><i class="fas fa-edit"></i></a>';
                        $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->slug.'" data-original-title="Delete" class="btn-sm btn-danger rounded deleteBtn"><i class="fas fa-trash-alt"></i></a>';
                        return $btn;
                    })
                    ->rawColumns(['action', 'image'])
                    ->make(true);
        }
        return view('backend.banners.banners');
    }

    public function addNewBanner(){
        return view('backend.banners.create_banner');
    }

    public function saveNewBanner(Request $request){
        $request->validate([
            'image' => 'required',
            'position' => 'required',
        ]);

        $image = null;
        if ($request->hasFile('image')){
            $get_image = $request->file('image');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('banner/');
            $get_image->move($location, $image_name);
            $image = "banner/" . $image_name;
        }

        Banner::insert([
            'type' => 2,
            'image' => $image,
            'link' => $request->link,
            'position' => $request->position,
            'status' => 1,
            'slug' => str::random(5) . time(),
            'created_at' => Carbon::now()
        ]);

        Toastr::success('Banner has been Added', 'Success');
        return back();
    }

    public function editBanner($slug){
        $data = Banner::where('slug', $slug)->first();
        return view('backend.banners.update_banner', compact('data'));
    }

    public function updateBanner(Request $request){
        $request->validate([
            'status' => 'required',
        ]);

        $data = Banner::where('slug', $request->slug)->first();

        $image = $data->image;
        if ($request->hasFile('image')){

            if($image != '' && file_exists(public_path($image))){
                unlink(public_path($image));
            }

            $get_image = $request->file('image');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('banner/');
            // Image::make($get_image)->save($location . $image_name, 80);
            $get_image->move($location, $image_name);
            $image = "banner/" . $image_name;
        }

        $data->image = $image;
        $data->status = $request->status;
        $data->link = $request->link;
        $data->position = $request->position;
        $data->updated_at = Carbon::now();
        $data->save();

        Toastr::success('Data has been Updated', 'Success');
        return redirect('/view/all/banners');

    }



    public function viewPromotionalBanner(){
        $promotionalBanner = PromotionalBanner::where('id', 1)->first();
        return view('backend.banners.promotional_banner', compact('promotionalBanner'));
    }

    public function updatePromotionalBanner(Request $request){

        $started_at = str_replace("/","-",$request->started_at);
        $started_at = date("Y-m-d H:i:s", strtotime($started_at));

        $end_at = str_replace("/","-",$request->end_at);
        $end_at = date("Y-m-d H:i:s", strtotime($end_at));


        $data = PromotionalBanner::where('id', 1)->first();

        $icon = $data->icon;
        if ($request->hasFile('icon')){

            if($icon && file_exists(public_path($icon))){
                unlink(public_path($icon));
            }

            $get_image = $request->file('icon');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('banner/');
            $get_image->move($location, $image_name);
            $icon = "banner/" . $image_name;
        }

        $product_image = $data->product_image;
        if ($request->hasFile('product_image')){

            if($product_image && file_exists(public_path($product_image))){
                unlink(public_path($product_image));
            }

            $get_image = $request->file('product_image');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('banner/');
            $get_image->move($location, $image_name);
            $product_image = "banner/" . $image_name;
        }

        $data->icon = $icon;
        $data->product_image = $product_image;
        $data->heading = $request->heading;
        $data->heading_color = $request->heading_color;
        $data->title = $request->title;
        $data->title_color = $request->title_color;
        $data->url = $request->url;
        $data->btn_text = $request->btn_text;
        $data->btn_text_color = $request->btn_text_color;
        $data->btn_bg_color = $request->btn_bg_color;
        $data->background_color = $request->background_color;
        $data->started_at = $started_at;
        $data->end_at = $end_at;
        $data->time_bg_color = $request->time_bg_color;
        $data->updated_at = Carbon::now();
        $data->save();

        Toastr::success('Data has been Updated', 'Success');
        return back();

    }
}
