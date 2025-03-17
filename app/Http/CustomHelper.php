<?php
namespace App\Http;

class CustomHelper
{
    public static function getPropRatio($phone)
    {
        try {
            if ($phone) {
                $token = 'sMqkr81wAfVExfAP2msMu0MZOKTqjRDid2x3lxfY1bWjqgHnKOf7AQljU4QE';
                $curl = curl_init();
                curl_setopt_array($curl, array(
                    CURLOPT_URL => 'https://bdcourier.com/api/courier-check?phone=' . $phone,
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_ENCODING => '',
                    CURLOPT_MAXREDIRS => 10,
                    CURLOPT_TIMEOUT => 0,
                    CURLOPT_FOLLOWLOCATION => true,
                    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                    CURLOPT_CUSTOMREQUEST => 'POST',
                    CURLOPT_HTTPHEADER => array(
                        'Authorization: Bearer ' . $token
                    ),
                ));

                $response = curl_exec($curl);

                curl_close($curl);
                return $response;
            }
            return response()->json(["status" => "success", "message" => "Invalid Phone Number"]);
        } catch (\Throwable $th) {
            return response()->json($th->getMessage());
        }
    }
}
