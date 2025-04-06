<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Sohibd\Laravelslug\Generate;
use Illuminate\Support\Str;
use Carbon\Carbon;
use Image;
use Yajra\DataTables\DataTables;


class MenuController extends Controller
{
    public function addNewMenu()
    {
        return view('backend.Menu.create', compact('menus'));
    }

    public function saveNewMenu(Request $request)
    {

        $request->validate([
            'menu_name' => 'required|string|max:255',
            'parent_id' => 'nullable',
        ]);

        $icon = null;
        if ($request->hasFile('icon')) {
            $get_image = $request->file('icon');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('Menu_images/');
            $get_image->move($location, $image_name);
            $icon = "Menu_images/" . $image_name;
        }

        Menu::insert([
            'menu_name' => $request->menu_name,
            'app_url' => $request->app_url,
            'web_url' => $request->web_url,
            'parent_id' => $request->parent_id === null || $request->parent_id === 'null' || $request->parent_id === '0' ? null : $request->parent_id,

            'icon' => $icon,
            'slug' => str_replace(' ', '', Generate::Slug($request->menu_name),),

            'status' => 1,
            'menu_type' => $request->menu_type ?: 0,
            'serial' => Menu::min('serial') - 1,
            'sort' => $request->sort,
            'created_at' => Carbon::now()
        ]);

        Toastr::success('Menu has been Added', 'Success');
        return back();
    }


    public function viewAllMenu(Request $request)
    {
        $menus = Menu::whereNull('parent_id')->with('children')->orderBy('sort', 'asc')->get();
        return view('backend.Menu.view', compact('menus'));
    }

    public function deleteMenu($slug)
    {
        $Menu = Menu::where('slug', $slug)->first();

        if (!$Menu) {
            return response()->json(['error' => 'Menu not found.'], 404);
        }

        $this->deleteChildmenus($Menu);

        if ($Menu->icon && file_exists(public_path($Menu->icon))) {
            unlink(public_path($Menu->icon));
        }
        if ($Menu->banner_image && file_exists(public_path($Menu->banner_image))) {
            unlink(public_path($Menu->banner_image));
        }

        $Menu->delete();

        return response()->json(['success' => 'Menu and its descendants deleted successfully.']);
    }

    private function deleteChildmenus($Menu)
    {
        foreach ($Menu->children as $child) {

            $this->deleteChildmenus($child);

            if ($child->icon && file_exists(public_path($child->icon))) {
                unlink(public_path($child->icon));
            }
            if ($child->banner_image && file_exists(public_path($child->banner_image))) {
                unlink(public_path($child->banner_image));
            }

            $child->delete();
        }
    }

    public function featureMenu($slug)
    {
        $data = Menu::where('slug', $slug)->first();
        if ($data->featured == 0) {
            $data->featured = 1;
            $data->save();
        } else {
            $data->featured = 0;
            $data->save();
        }
        return response()->json(['success' => 'Status Changed successfully.']);
    }

    public function editMenu($slug)
    {
        $menu = Menu::where('slug', $slug)->first();
        return view('backend.Menu.update', compact('menu'));
    }

    public function editMenuNew($slug)
    {
        $menu = Menu::where('slug', $slug)->orderBy('sort', 'asc')->first();
        $menus = Menu::whereNull('parent_id')->with('children')->orderBy('sort', 'asc')->get();

        return view('backend.Menu.update_new', compact('menu', 'menus'));
    }

    public function updateMenu(Request $request)
    {
        try {
            $menuExist = $request->id ? Menu::find($request->id) : null;
            $slugText = Generate::Slug($request->web_url);
            $duplicateSlugExists = Menu::where('id', '!=', $request->id)
                ->where('slug', $slugText)
                ->exists();

            if ($duplicateSlugExists) {
                Toastr::warning('A menu with this URL already exists. Please use a different web URL.', 'Duplicate Slug');
                return back();
            }

            $request->validate([
                'menu_name' => 'required|string|max:255',
                'parent_id' => 'nullable',
                'status' => 'required',
            ]);

            $duplicateMenuExists = Menu::where('id', '!=', $request->id)
                ->where('menu_name', $request->menu_name)
                ->exists();

            if ($duplicateMenuExists) {
                Toastr::warning('A menu with this name already exists.', 'Duplicate Menu');
                return back();
            }
            $icon = $menuExist->icon ?? null;
            if ($request->hasFile('icon')) {
                if ($icon && file_exists(public_path($icon))) {
                    unlink(public_path($icon));
                }
                $get_image = $request->file('icon');
                $image_name = Str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
                $location = public_path('menu_images/');
                $get_image->move($location, $image_name);
                $icon = "menu_images/" . $image_name;
            }
            Menu::where('id', $request->id)->update([
                'menu_name' => $request->menu_name,
                'app_url' => $request->app_url,
                'web_url' => $request->web_url,
                'parent_id' => $request->parent_id === null || $request->parent_id === 'null' || $request->parent_id === '0'
                    ? null
                    : $request->parent_id,
                'icon' => $icon,
                'slug' => $slugText,
                'status' => $request->status,
                'menu_type' => $request->menu_type ? $request->menu_type : 0,
                'serial' => Menu::min('serial') - 1,
                'sort' => $request->sort,
                'updated_at' => Carbon::now()
            ]);
            Toastr::success('Menu has been updated successfully', 'Success');
            return redirect('/edit/menu/' . $slugText);
        } catch (\Throwable $th) {
            // Log the error for debugging
            \Log::error('Menu update error: ' . $th->getMessage());
            Toastr::error('An error occurred while updating the menu', 'Error');
            return back();
        }
    }
}
