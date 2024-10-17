<?php

use Illuminate\Support\Facades\Route;
use App\Http\Middleware\CheckUserType;
use App\Http\Middleware\DemoMode;
use App\Http\Controllers\BuySellController;


Route::group(['middleware' => ['auth', 'CheckUserType', 'DemoMode']], function () {

    Route::get('/buy/sell/config', [BuySellController::class, 'buySellConfig'])->name('BuySellConfig');
    Route::post('/save/buy/sell/config', [BuySellController::class, 'buySellConfigUpdate'])->name('BuySellConfigUpdate');

    // category routes
    Route::get('/create/buy/sell/category', [BuySellController::class, 'createNew'])->name('BuySellCategoryCreateNew');
    Route::post('/save/buy/sell/category', [BuySellController::class, 'saveCategory'])->name('BuySellCategorySave');
    Route::get('/view/buy/sell/categories', [BuySellController::class, 'viewCategories'])->name('BuySellCategoryView');
    Route::get('/delete/buy/sell/category/{slug}', [BuySellController::class, 'deleteBuySellCategory'])->name('BuySellCategoryDelete');
    Route::get('/edit/buy/sell/category/{slug}', [BuySellController::class, 'editBuySellCategory'])->name('BuySellCategoryEdit');
    Route::post('/update/buy/sell/category', [BuySellController::class, 'updateBuySellCategory'])->name('BuySellCategoryUpdate');
    Route::get('/rearrange/buy/sell/categories', [BuySellController::class, 'rearrangeBuySellCategory'])->name('BuySellCategoryRearrange');
    Route::post('/save/rearranged/buy/sell/categories', [BuySellController::class, 'saveRearrangeBuySellCategory'])->name('BuySellCategoryRearrangeSave');

    Route::get('/buy/sell/listing', [BuySellController::class, 'buySellListing'])->name('BuySellListing');
    Route::get('/delete/buy/sell/listing/{slug}', [BuySellController::class, 'deleteBuySellListing'])->name('BuySellListingDelete');
    Route::get('/approve/buy/sell/listing/{slug}', [BuySellController::class, 'approveBuySellListing'])->name('BuySellListingApprove');
    Route::get('/deny/buy/sell/listing/{slug}', [BuySellController::class, 'denyBuySellListing'])->name('BuySellListingDeny');

});
