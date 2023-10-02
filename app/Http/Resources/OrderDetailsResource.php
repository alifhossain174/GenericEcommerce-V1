<?php

namespace App\Http\Resources;

use App\Models\Color;
use App\Models\DeviceCondition;
use App\Models\Product;
use App\Models\ProductWarrenty;
use App\Models\Sim;
use App\Models\StorageType;
use App\Models\Unit;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Resources\Json\JsonResource;

class OrderDetailsResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */

    public function toArray($request)
    {
        // return parent::toArray($request);
        $prodInfo = Product::where('id', $this->product_id)->first();
        $unitInfo = Unit::where('id', $this->unit_id)->first();
        $deviceConditionInfo = DeviceCondition::where('id', $this->device_condition_id)->first();

        return [
            'id' => $this->id,
            'order_id' => $this->order_id,
            'product_id' => $this->product_id,
            'product_name' => $prodInfo ? $prodInfo->name : '',
            'product_image' => $prodInfo ? $prodInfo->image : '',
            'unit_id' => $this->unit_id,
            'unit_name' => $unitInfo ? $unitInfo->name : '',

            // variants
            'color_id' => $this->color_id,
            'color_name' => $this->color_id > 0 ? Color::where('id', $this->color_id)->first()->name : '',
            'region_id' => $this->region_id,
            'region_name' => $this->region_id > 0 ? DB::table('country')->where('id', $this->region_id)->first()->name : '',
            'sim_id' => $this->sim_id,
            'sim_name' => $this->sim_id > 0 ? Sim::where('id', $this->sim_id)->first()->name : '',
            'storage_id' => $this->storage_id,
            'storage_name' => $this->storage_id > 0 ? StorageType::where('id', $this->storage_id)->first()->ram."/".StorageType::where('id', $this->storage_id)->first()->rom : '',
            'warrenty_id' => $this->warrenty_id,
            'warrenty_name' => $this->warrenty_id > 0 ? ProductWarrenty::where('id', $this->warrenty_id)->first()->name : '',
            'device_condition_id' => $this->device_condition_id,
            'device_condition_name' => $deviceConditionInfo ? $deviceConditionInfo->name : '',

            'qty' => $this->qty,
            'unit_price' => $this->unit_price,
            'total_price' => $this->total_price,
        ];
    }
}
