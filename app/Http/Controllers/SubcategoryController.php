<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Subcategory;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Carbon\Carbon;
use Image;
use DataTables;

class SubcategoryController extends Controller
{
    public function addNewSubcategory(){
        return view('backend.subcategory.create');
    }

    public function saveNewSubcategory(Request $request){

        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'category_id' => 'required',
        ]);

        $icon = null;
        if ($request->hasFile('icon')){
            $get_image = $request->file('icon');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('subcategory_images/');
            // Image::make($get_image)->save($location . $image_name);
            $get_image->move($location, $image_name);
            $icon = "subcategory_images/" . $image_name;
        }

        $image = null;
        if ($request->hasFile('image')){
            $get_image = $request->file('image');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('subcategory_images/');
            // Image::make($get_image)->save($location . $image_name);
            $get_image->move($location, $image_name);
            $image = "subcategory_images/" . $image_name;
        }

        $clean = preg_replace('/[^a-zA-Z0-9\s]/', '', strtolower($request->name)); //remove all non alpha numeric
        $slug = preg_replace('!\s+!', '-', $clean);

        Subcategory::insert([
            'category_id' => $request->category_id,
            'name' => $request->name,
            'icon' => $icon,
            'image' => $image,
            'slug' => $slug."-".time()."-".str::random(5),
            'status' => 1,
            'created_at' => Carbon::now()
        ]);

        Toastr::success('Subcategory has been Added', 'Success');
        return back();
    }

    public function viewAllSubcategory(Request $request){
        if ($request->ajax()) {

            $data = DB::table('subcategories')
                ->join('categories', 'subcategories.category_id', '=', 'categories.id')
                ->select('subcategories.*', 'categories.name as category_name')
                ->orderBy('subcategories.id', 'desc')
                ->get();

            return Datatables::of($data)
                    ->editColumn('status', function($data) {
                        if($data->status == 1){
                            return 'Active';
                        } else {
                            return 'Inactive';
                        }
                    })
                    ->editColumn('featured', function($data) {
                        if($data->featured == 0){
                            return '<button class="btn btn-sm btn-danger rounded">Not Featured</button>';
                        } else {
                            return '<button class="btn btn-sm btn-success rounded">Featured</button>';
                        }
                    })
                    ->addIndexColumn()
                    ->addColumn('action', function($data){

                        $btn = ' <a href="'.url('edit/subcategory').'/'.$data->slug.'" class="mb-1 btn-sm btn-warning rounded d-inline-block"><i class="fas fa-edit"></i></a>';
                        $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->slug.'" data-original-title="Delete" class="btn-sm btn-danger rounded d-inline-block deleteBtn"><i class="fas fa-trash-alt"></i></a>';

                        if($data->featured == 0){
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" title="Featured" data-original-title="Featured" class="btn-sm btn-success rounded d-inline-block featureBtn"><i class="feather-chevrons-up"></i></a>';
                        } else {
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" title="Featured" data-original-title="Featured" class="btn-sm btn-danger rounded d-inline-block featureBtn"><i class="feather-chevrons-down"></i></a>';
                        }

                        return $btn;
                    })
                    ->rawColumns(['action', 'icon', 'featured'])
                    ->make(true);
        }
        return view('backend.subcategory.view');
    }

    public function deleteSubcategory($slug){
        $data = Subcategory::where('slug', $slug)->first();
        $used = Product::where('subcategory_id', $data->id)->count();
        if($used > 0){
            return response()->json(['success' => 'Subcategory Cannot be Deleted.', 'data' => 0]);
        } else {
            if($data->icon){
                if(file_exists(public_path($data->icon))){
                    unlink(public_path($data->icon));
                }
            }
            $data->delete();
            return response()->json(['success' => 'Subcategory deleted successfully.', 'data' => 1]);
        }
    }

    public function editSubcategory($slug){
        $subcategory = Subcategory::where('slug', $slug)->first();
        return view('backend.subcategory.update', compact('subcategory'));
    }

    public function updateSubcategory(Request $request){

        $request->validate([
            'name' => 'required|max:255',
            'category_id' => 'required',
            'status' => 'required',
        ]);

        $duplicateSubCategoryExists = Subcategory::where('name', $request->name)->where('id', '!=', $request->id)->first();
        if($duplicateSubCategoryExists){
            Toastr::warning('Duplicate SubCategory Exists', 'Success');
            return back();
        }

        $data = Subcategory::where('slug', $request->slug)->first();

        $icon = $data->icon;
        if ($request->hasFile('icon')){

            if($icon != '' && file_exists(public_path($icon))){
                unlink(public_path($icon));
            }

            $get_image = $request->file('icon');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('subcategory_images/');
            // Image::make($get_image)->save($location . $image_name, 80);
            $get_image->move($location, $image_name);
            $icon = "subcategory_images/" . $image_name;
        }

        $image = $data->image;
        if ($request->hasFile('image')){

            if($image != '' && file_exists(public_path($image))){
                unlink(public_path($image));
            }

            $get_image = $request->file('image');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('subcategory_images/');
            // Image::make($get_image)->save($location . $image_name, 80);
            $get_image->move($location, $image_name);
            $image = "subcategory_images/" . $image_name;
        }

        $clean = preg_replace('/[^a-zA-Z0-9\s]/', '', strtolower($request->name)); //remove all non alpha numeric
        $slug = preg_replace('!\s+!', '-', $clean);

        Subcategory::where('slug', $request->slug)->update([
            'category_id' => $request->category_id,
            'name' => $request->name,
            'icon' => $icon,
            'image' => $image,
            'slug' => $slug."-".time()."-".str::random(5),
            'status' => $request->status,
            'updated_at' => Carbon::now()
        ]);

        Toastr::success('Subcategory has been Added', 'Success');
        return redirect('/view/all/subcategory');

    }

    public function featureSubcategory($id){
        $data = Subcategory::where('id', $id)->first();
        if($data->featured == 0){
            $data->featured = 1;
            $data->save();
        } else {
            $data->featured = 0;
            $data->save();
        }
        return response()->json(['success' => 'Satatus Changed successfully.']);
    }
}
