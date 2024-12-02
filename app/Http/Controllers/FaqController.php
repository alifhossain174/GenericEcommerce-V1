<?php

namespace App\Http\Controllers;

use App\Models\Faq;
use App\Models\FaqCategory;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Str;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\DB;

class FaqController extends Controller
{

    public function faqCategories(Request $request)
    {
        if ($request->ajax()) {
            $data = FaqCategory::orderBy('serial', 'asc')->get();
            return Datatables::of($data)
                ->editColumn('status', function ($data) {
                    if ($data->status == 1) {
                        return 'Active';
                    } else {
                        return 'Inactive';
                    }
                })
                ->addIndexColumn()
                ->addColumn('action', function ($data) {
                    $btn = ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="' . $data->slug . '" data-original-title="Edit" class="btn-sm btn-warning rounded editBtn"><i class="fas fa-edit"></i></a>';
                    $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="' . $data->slug . '" data-original-title="Delete" class="btn-sm btn-danger rounded deleteBtn"><i class="fas fa-trash-alt"></i></a>';
                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('backend.faq.category');
    }

    public function saveFaqCategory(Request $request)
    {
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
        ]);

        $clean = preg_replace('/[^a-zA-Z0-9\s]/', '', strtolower($request->name)); //remove all non alpha numeric
        $slug = preg_replace('!\s+!', '-', $clean);

        FaqCategory::insert([
            'name' => $request->name,
            'slug' => $slug . time(),
            'status' => 1,
            'created_at' => Carbon::now()
        ]);

        Toastr::success('Category has been Added', 'Success');
        return back();
    }

    public function deleteFaqCategory($slug)
    {
        $data = FaqCategory::where('slug', $slug)->first();

        $used = Faq::where('category_id', $data->id)->count();
        if ($used > 0) {
            return response()->json(['success' => 'Category cannot be deleted', 'data' => 0]);
        } else {
            $data->delete();
            return response()->json(['success' => 'Category deleted successfully.', 'data' => 1]);
        }
    }

    public function getFaqCategoryInfo($slug)
    {
        $data = FaqCategory::where('slug', $slug)->first();
        return response()->json($data);
    }

    public function updateFaqCategoryInfo(Request $request)
    {
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'category_status' => 'required',
        ]);

        $clean = preg_replace('/[^a-zA-Z0-9\s]/', '', strtolower($request->name)); //remove all non alpha numeric
        $slug = preg_replace('!\s+!', '-', $clean);

        FaqCategory::where('slug', $request->category_slug)->update([
            'name' => $request->name,
            'slug' => $slug . time(),
            'status' => $request->category_status,
            'updated_at' => Carbon::now()
        ]);

        return response()->json(['success' => 'Data Updated successfully.']);
    }

    public function rearrangeFaqCategory()
    {
        $categories = FaqCategory::orderBy('serial', 'asc')->get();
        return view('backend.faq.rearrange_faq_category', compact('categories'));
    }

    public function saveRearrangeCategory(Request $request)
    {
        $sl = 1;
        foreach ($request->slug as $slug) {
            FaqCategory::where('slug', $slug)->update([
                'serial' => $sl
            ]);
            $sl++;
        }
        Toastr::success('Category has been Rerranged', 'Success');
        return redirect('/faq/categories');
    }

    public function viewAllFaqs(Request $request)
    {
        if ($request->ajax()) {

            $data = DB::table('faqs')
                ->leftJoin('faq_categories', 'faqs.category_id', '=', 'faq_categories.id')
                ->select('faqs.*', 'faq_categories.name as faq_category_name')
                ->orderBy('faqs.serial', 'asc')
                ->get();

            // $data = Faq::orderBy('serial', 'asc')->get();

            return Datatables::of($data)
                ->editColumn('status', function ($data) {
                    if ($data->status == 1) {
                        return 'Active';
                    } else {
                        return 'Inactive';
                    }
                })
                ->addIndexColumn()
                ->addColumn('action', function ($data) {
                    $btn = ' <a href="' . url('edit/faq') . '/' . $data->slug . '" class="mb-1 btn-sm btn-warning rounded"><i class="fas fa-edit"></i></a>';
                    $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="' . $data->slug . '" data-original-title="Delete" class="btn-sm btn-danger rounded deleteBtn"><i class="fas fa-trash-alt"></i></a>';
                    return $btn;
                })
                ->rawColumns(['action', 'icon'])
                ->make(true);
        }
        return view('backend.faq.view');
    }

    public function addNewFaq()
    {
        return view('backend.faq.create');
    }

    public function saveFaq(Request $request)
    {
        // dd($request);
        $request->validate([
            'question' => 'required|max:255',
            'answer' => 'required',
        ]);

        Faq::insert([
            'category_id' => $request->category_id,
            'question' => $request->question,
            'answer' => $request->answer,
            'status' => 1,
            'slug' => str::random(5) . time(),
            'created_at' => Carbon::now()
        ]);

        Toastr::success('FAQ has been Added', 'Success');
        return back();
    }

    public function deleteFaq($slug)
    {
        Faq::where('slug', $slug)->delete();
        return response()->json(['success' => 'Deleted successfully.']);
    }

    public function editFaq($slug)
    {
        $data = Faq::where('slug', $slug)->first();
        return view('backend.faq.update', compact('data'));
    }

    public function updateFaq(Request $request)
    {
        $request->validate([
            'question' => 'required|max:255',
            'answer' => 'required',
            'status' => 'required',
        ]);

        Faq::where('slug', $request->slug)->update([
            'category_id' => $request->category_id,
            'question' => $request->question,
            'answer' => $request->answer,
            'status' => $request->status,
            'updated_at' => Carbon::now()
        ]);

        Toastr::success('FAQ has been Updated', 'Success');
        return redirect('/view/all/faqs');
    }

    public function rearrangeFaq()
    {
        $data = Faq::orderBy('serial', 'asc')->get();
        return view('backend.faq.rearrange', compact('data'));
    }

    public function saveRearrangeFaq(Request $request)
    {
        $sl = 1;
        foreach ($request->slug as $slug) {
            Faq::where('slug', $slug)->update([
                'serial' => $sl
            ]);
            $sl++;
        }
        Toastr::success('Faq has been Rerranged', 'Success');
        return redirect('/view/all/faqs');
    }
}
