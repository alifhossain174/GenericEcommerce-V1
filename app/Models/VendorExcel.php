<?php
namespace App\Models;

use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class VendorExcel implements FromCollection, WithHeadings

{
    /**
    * @return \Illuminate\Support\Collection
    */

    public function collection()
    {
        // return Vendor::select("business_name", "business_category", "trade_license_no", "business_address")->orderBy('id', 'desc')->get();
        return DB::table('vendors')
        ->leftJoin('users', 'vendors.user_id', '=', 'users.id')
        ->select('users.name', 'users.email', 'users.phone', 'vendors.business_name', 'vendors.business_category', 'vendors.trade_license_no', 'vendors.business_address')
        ->where('users.status', 1)
        ->orderBy('vendors.id', 'desc')
        ->get();
    }


    /**
     * Write code on Method
     *
     * @return response()
     */
    public function headings(): array
    {
        return ["Name", "Email", "Phone", "Business Name", "Business Category", "Trade License No", "Business Address"];
    }

}
