<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Sohibd\Laravelslug\Generate;
use Illuminate\Support\Str;
use Carbon\Carbon;
use Image;
use Yajra\DataTables\DataTables;

class CategoryController extends Controller
{
    public function addNewCategory()
    {
        return view('backend.category.create');
    }

    public function saveNewCategory(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255|unique:categories',
            'parent_id' => 'nullable',
        ]);

        $image = null;
        if ($request->hasFile('image')) {
            $get_image = $request->file('image');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('category_images/');
            // Image::make($get_image)->save($location . $image_name, 80);
            $get_image->move($location, $image_name);
            $image = "category_images/" . $image_name;
        }

        $icon = null;
        if ($request->hasFile('icon')) {
            $get_image = $request->file('icon');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('category_images/');
            // Image::make($get_image)->save($location . $image_name, 80);
            $get_image->move($location, $image_name);
            $icon = "category_images/" . $image_name;
        }

        $categoryBanner = null;
        if ($request->hasFile('banner_image')) {
            $get_image = $request->file('banner_image');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('category_images/');
            // Image::make($get_image)->save($location . $image_name, 80);
            $get_image->move($location, $image_name);
            $categoryBanner = "category_images/" . $image_name;
        }

        $ogImage = null;
        if ($request->hasFile('og_image')) {
            $get_image = $request->file('og_image');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('og_images/');
            // Image::make($get_image)->save($location . $image_name, 80);
            $get_image->move($location, $image_name);
            $ogImage = "og_images/" . $image_name;
        }

        Category::insert([
            'name' => $request->name,
            'parent_id' => $request->parent_id === null || $request->parent_id === 'null' || $request->parent_id === '0' ? null : $request->parent_id,
            'image' => $image,
            'icon' => $icon,
            'banner_image' => $categoryBanner,
            'slug' => str_replace(' ', '', Generate::Slug($request->name),),

            'sort_priority' => $request->sort_priority ?? null,
            'google_cat_id' => $request->google_cat_id ?? null,
            'affiliate_bonus' => $request->affiliate_bonus ?? 0,
            'vendor_commission' => $request->vendor_commission ?? 0,
            'summary' => $request->summary ?? null,
            'description' => $request->description ?? null,
            'meta_title' => $request->meta_title ?? null,
            'meta_keywords' => $request->meta_keywords ?? null,
            'meta_description' => $request->meta_description ?? null,
            'og_title' => $request->og_title ?? null,
            'og_keywords' => $request->og_keywords ?? null,
            'og_image' => $ogImage,

            'status' => 1,
            'featured' => $request->featured ?: 0,
            'show_on_navbar' => $request->show_on_navbar ?: 0,
            'serial' => Category::min('serial') - 1,
            'created_at' => Carbon::now()
        ]);

        Toastr::success('Category has been Added', 'Success');
        return back();
    }

    public function viewAllCategory(Request $request)
    {
        $categories = Category::whereNull('parent_id')->with('children')->get();

        return view('backend.category.view', compact('categories'));
    }

    public function deleteCategory($slug)
    {
        $category = Category::where('slug', $slug)->first();

        if (!$category) {
            return response()->json(['error' => 'Category not found.'], 404);
        }

        $this->deleteChildCategories($category);

        if ($category->icon && file_exists(public_path($category->icon))) {
            unlink(public_path($category->icon));
        }
        if ($category->banner_image && file_exists(public_path($category->banner_image))) {
            unlink(public_path($category->banner_image));
        }
        if ($category->image && file_exists(public_path($category->image))) {
            unlink(public_path($category->image));
        }

        $category->delete();

        return response()->json(['success' => 'Category and its descendants deleted successfully.']);
    }

    private function deleteChildCategories($category)
    {
        foreach ($category->children as $child) {

            $this->deleteChildCategories($child);

            if ($child->icon && file_exists(public_path($child->icon))) {
                unlink(public_path($child->icon));
            }
            if ($child->banner_image && file_exists(public_path($child->banner_image))) {
                unlink(public_path($child->banner_image));
            }
            if ($child->image && file_exists(public_path($child->image))) {
                unlink(public_path($child->image));
            }

            $child->delete();
        }
    }

    public function featureCategory($slug)
    {
        $data = Category::where('slug', $slug)->first();
        if ($data->featured == 0) {
            $data->featured = 1;
            $data->save();
        } else {
            $data->featured = 0;
            $data->save();
        }
        return response()->json(['success' => 'Status Changed successfully.']);
    }

    public function editCategory($slug)
    {
        $category = Category::where('slug', $slug)->first();
        return view('backend.category.update', compact('category'));
    }

    public function editCategoryNew($slug)
    {
        $category = Category::where('slug', $slug)->first();
        $categories = Category::whereNull('parent_id')->with('children')->get();

        return view('backend.category.update_new', compact('category', 'categories'));
    }

    public function updateCategory(Request $request)
    {
        $categoryExist = $request->id ? Category::find($request->id) : null;

        $request->validate([
            'name' => 'required|string|max:255',
            'parent_id' => 'nullable',
            'slug' => [
                'required',
                'unique:categories,slug,' . ($categoryExist ? $categoryExist->id : 'NULL') . ',id',
                'regex:/^[a-z0-9-_]+$/',
            ],
            'status' => 'required',
        ], [
            'slug.regex' => 'The slug should not contain spaces or special characters. It can only include lowercase letters, numbers, hyphens (-), and underscores (_).'
        ]);

        $duplicateCategoryExists = Category::where('id', '!=', $request->id)->where('name', $request->name)->first();
        $duplicateCategorySlugExists = Category::where('id', '!=', $request->id)->where('slug', $request->slug)->first();
        if ($duplicateCategoryExists || $duplicateCategorySlugExists) {
            Toastr::warning('Duplicate Category Or Slug Exists', 'Duplicate');
            return back();
        }

        $data = Category::where('id', $request->id)->first();

        $image = $data->image;
        if ($request->hasFile('image')) {

            if ($image != '' && file_exists(public_path($image))) {
                unlink(public_path($image));
            }

            $get_image = $request->file('image');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('category_images/');
            $get_image->move($location, $image_name);
            $image = "category_images/" . $image_name;
        }

        $icon = $data->icon;
        if ($request->hasFile('icon')) {

            if ($icon != '' && file_exists(public_path($icon))) {
                unlink(public_path($icon));
            }

            $get_image = $request->file('icon');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('category_images/');
            $get_image->move($location, $image_name);
            $icon = "category_images/" . $image_name;
        }

        $categoryBanner = $data->banner_image;
        if ($request->hasFile('banner_image')) {

            if ($categoryBanner != '' && file_exists(public_path($categoryBanner))) {
                unlink(public_path($categoryBanner));
            }

            $get_image = $request->file('banner_image');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('category_images/');
            $get_image->move($location, $image_name);
            $categoryBanner = "category_images/" . $image_name;
        }

        $ogImage = $data->og_image;
        if ($request->hasFile('og_image')) {

            if ($ogImage != '' && file_exists(public_path($ogImage))) {
                unlink(public_path($ogImage));
            }

            $get_image = $request->file('og_image');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('og_images/');
            $get_image->move($location, $image_name);
            $ogImage = "og_images/" . $image_name;
        }


        Category::where('id', $request->id)->update([
            'name' => $request->name,
            'parent_id' => $request->parent_id === null || $request->parent_id === 'null' || $request->parent_id === '0' ? null : $request->parent_id,
            'image' => $image,
            'icon' => $icon,
            'banner_image' => $categoryBanner,
            'slug' => Generate::Slug($request->slug),

            'sort_priority' => $request->sort_priority ?? null,
            'google_cat_id' => $request->google_cat_id ?? null,
            'affiliate_bonus' => $request->affiliate_bonus ?? 0,
            'vendor_commission' => $request->vendor_commission ?? 0,
            'summary' => $request->summary ?? null,
            'description' => $request->description ?? null,
            'meta_title' => $request->meta_title ?? null,
            'meta_keywords' => $request->meta_keywords ?? null,
            'meta_description' => $request->meta_description ?? null,
            'og_title' => $request->og_title ?? null,
            'og_keywords' => $request->og_keywords ?? null,
            'og_image' => $ogImage,

            'status' => $request->status,
            'featured' => $request->featured ? $request->featured : 0,
            'show_on_navbar' => $request->show_on_navbar ? $request->show_on_navbar : 0,
            'updated_at' => Carbon::now()
        ]);

        Toastr::success('Category has been Updated', 'Success');
        return redirect('/edit/category/' . $request->slug);
    }

    public function rearrangeCategory()
    {
        $categories = Category::orderBy('serial', 'asc')->get();
        return view('backend.category.rearrange', compact('categories'));
    }

    public function saveRearrangeCategoryOrder(Request $request)
    {
        $sl = 1;
        foreach ($request->slug as $slug) {
            Category::where('slug', $slug)->update([
                'serial' => $sl
            ]);
            $sl++;
        }

        Toastr::success('Category has been Rerranged', 'Success');
        return redirect('/view/all/category');
    }
}
