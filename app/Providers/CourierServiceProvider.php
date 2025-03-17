<?php

namespace App\Providers;

use Illuminate\Support\Facades\Config;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\DB;

class CourierServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        $courierApiKeys = DB::table('courier_api_keys')
            ->where('provider_name', 'steadfast')
            ->first();

        if ($courierApiKeys) {
            Config::set('steadfast.api_key', $courierApiKeys->app_key);
            Config::set('steadfast.secret_key', $courierApiKeys->secret_key);
        }
    }
}
