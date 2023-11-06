<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\DB;

class DeliveryChargeController extends Controller
{
    public function viewAllDeliveryCharges(Request $request){
        if ($request->ajax()) {

            $data = DB::table('districts')
                    ->join('divisions','districts.division_id', '=', 'divisions.id')
                    ->select('districts.*', 'divisions.name as division_name')
                    ->orderBy('id', 'asc')
                    ->get();

            return Datatables::of($data)
                    ->addIndexColumn()
                    ->editColumn('delivery_charge', function($data) {
                        return "<span style='color: green; font-weight: 600;'>BDT ".$data->delivery_charge."/=</span>";
                    })
                    ->addColumn('action', function($data){
                        $btn = ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="'.$data->id.'" data-original-title="Delete" class="btn-sm btn-warning rounded editBtn"><i class="fas fa-edit"></i></a>';
                        return $btn;
                    })
                    ->rawColumns(['action', 'delivery_charge'])
                    ->make(true);
        }
        return view('backend.delivery_charges');
    }

    public function getDeliveryCharge($id){
        $data = DB::table('districts')->where('id', $id)->first();
        return response()->json($data);
    }

    public function updateDeliveryCharge(Request $request){
        DB::table('districts')->where('id', $request->delivery_charge_id)->update([
            'delivery_charge' => $request->delivery_charge,
        ]);
        return response()->json(['success'=>'Updated successfully.']);
    }
}
