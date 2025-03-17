<?php

namespace App\Http\Controllers;

use App\Models\Currency;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;

class CurrencyController extends Controller
{
    public function viewCurrency(Request $request)
    {
        if ($request->ajax()) {
            $data = Currency::orderBy('id', 'asc')->get();
            return Datatables::of($data)
                ->addColumn('action', function ($data) {
                    $btn = ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="' . $data->id . '" data-original-title="Edit" class="btn-sm mb-1 d-inline-block btn-warning rounded editBtn"><i class="fas fa-edit"></i></a>';
                    $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" data-id="' . $data->id . '" data-original-title="Delete" class="btn-sm mb-1 d-inline-block btn-danger rounded deleteBtn"><i class="fas fa-trash-alt"></i></a>';
                    return $btn;
                })
                ->addColumn('status', function ($data) {
                    return $data->status == 1 ? '<span class="badge badge-success">Active</span>' : '<span class="badge badge-danger">Inactive</span>';
                })
                ->addIndexColumn()
                ->rawColumns(['action', 'status'])
                ->make(true);
        }
        return view('backend.currency');
    }

    public function getCurrencyInfo($id)
    {
        $data = Currency::find($id);
        return response()->json($data);
    }

    public function updateCurrencyInfo(Request $request)
    {
        // Start a database transaction to ensure all operations complete successfully
        DB::beginTransaction();

        try {
            // If the current currency is being set to active, deactivate all other currencies
            if ($request->status == 1) {
                DB::table('currencies')->where('id', '!=', $request->id)->update([
                    'status' => 0,
                    'updated_at' => Carbon::now(),
                ]);
            }

            // Update the current currency
            DB::table('currencies')->where('id', $request->id)->update([
                'name' => $request->name,
                'symbol' => $request->symbol,
                'exchange_rate' => $request->exchange_rate,
                'status' => $request->status,
                'code' => $request->code,
                'updated_at' => Carbon::now(),
            ]);

            // Commit the transaction
            DB::commit();

            return response()->json(['success' => 'Updated successfully.']);
        } catch (\Exception $e) {
            // Rollback the transaction if any error occurs
            DB::rollBack();

            return response()->json(['error' => 'An error occurred: ' . $e->getMessage()], 500);
        }
    }

    public function saveNewCurrency(Request $request)
    {
        DB::table('currencies')->insert([
            'name' => $request->name,
            'symbol' => $request->symbol,
            'exchange_rate' => $request->exchange_rate,
            'status' => $request->status,
            'code' => $request->code,
            'created_at' => Carbon::now(),
        ]);
        return response()->json(['success' => 'Saved Successfully.']);
    }

    public function deleteCurrency($id)
    {
        DB::table('currencies')->where('id', $id)->delete();
        return response()->json(['success' => 'Removed Successfully.']);
    }

    public function changeCurrencyStatus(Request $request)
    {
        DB::table('currencies')->where('id', $request->id)->update([
            'status' => $request->status,
            'updated_at' => Carbon::now(),
        ]);
        return response()->json(['success' => 'Status changed successfully.']);
    }
}
