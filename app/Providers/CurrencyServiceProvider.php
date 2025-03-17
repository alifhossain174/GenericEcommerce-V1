<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\DB;

class CurrencyServiceProvider extends ServiceProvider
{
    public function boot()
    {
        View::composer('*', function ($view) {
            $activeCurrency = DB::table('currencies')
                ->where('status', 1)
                ->first(['symbol', 'code', 'name', 'exchange_rate']);

            // Fallback to default if no active currency
            if (!$activeCurrency) {
                $currencySymbol = '৳';
                $currencyCode = 'BDT';
                $currencyName = 'Bangladeshi Taka';
                $exchangeRate = 1;
            } else {
                $currencySymbol = $activeCurrency->symbol;
                $currencyCode = $activeCurrency->code;
                $currencyName = $activeCurrency->name;
                $exchangeRate = $activeCurrency->exchange_rate;
            }

            $view->with('currencySymbol', $currencySymbol);
            $view->with('currencyCode', $currencyCode);
            $view->with('currencyName', $currencyName ?? null);
            $view->with('exchangeRate', $exchangeRate ?? null);
        });
    }
}
