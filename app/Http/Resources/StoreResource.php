<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class StoreResource extends JsonResource
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
        return [
            'id' => $this->id,
            'store_name' => $this->store_name,
            'store_logo' => $this->store_logo,
            'store_banner' => $this->store_banner,
            'store_address' => $this->store_address,
            'store_phone' => $this->store_phone,
            'store_email' => $this->store_email,
            'store_description' => $this->store_description,
            'store_full_description' => $this->store_full_description,
            'facebook' => $this->facebook,
            'whatsapp' => $this->whatsapp,
            'instagram' => $this->instagram,
            'tiktok' => $this->tiktok,
            'linkedin' => $this->linkedin,
            'twitter' => $this->twitter,
            'slug' => $this->slug,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
