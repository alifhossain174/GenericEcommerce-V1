<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class StoreController extends Controller
{
    public function createNewStore(){
        return view('backend.store.create');
    }
}
