<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;


    public function children()
    {
        return $this->hasMany(Category::class, 'parent_id')->with('children');
    }

    // Define the relationship with the parent category
    public function parent()
    {
        return $this->belongsTo(Category::class, 'parent_id');
    }

    // Fetch products directly associated with this category
    public function products()
    {
        return $this->hasMany(Product::class);
    }



    public static function getTree($id = null)
    {
        $categories = Category::whereNull('parent_id')->with('children')->get();
        return self::buildTree($categories, '', $id);
    }


    private static function buildTree($categories, $prefix = '', $selectedId = null)
    {
        $tree = [];
        foreach ($categories as $category) {
            // Add the "selected" attribute if the category id matches the given id
            $isSelected = $category->id == $selectedId ? ' selected' : '';

            // Add the option element with indentation for hierarchy
            $tree[] = "<option value='{$category->id}'{$isSelected}>{$prefix}{$category->name}</option>";

            // Recursively build the tree for children, appending `&nbsp;&nbsp;` for visual indentation
            if ($category->children->isNotEmpty()) {
                $tree = array_merge($tree, self::buildTree($category->children, $prefix . '&nbsp;&nbsp;&nbsp;&nbsp;', $selectedId));
            }
        }
        return $tree;
    }


    // Static helper
    public static function getTreeForSelect($selectedIds = [])
    {
        // Ensure selectedIds is an array
        $selectedIds = is_array($selectedIds) ? $selectedIds : [$selectedIds];

        $categories = Category::whereNull('parent_id')->with('children')->get();

        return self::buildTreeForSelect($categories, '', $selectedIds);
    }

    private static function buildTreeForSelect($categories, $prefix = '', $selectedIds = [], &$counter = 0)
    {
        $tree = [];
        foreach ($categories as $category) {
            $counter++; // Increment the counter for each category

            // Check if the category ID is in the selected IDs array
            $isChecked = (in_array($category->id, $selectedIds)) ? ' checked' : '';

            // Generate the list item with indentation first, followed by the checkbox
            $tree[] = "
        <li id='{$category->id}' style='list-style: none;'>
            <label>
                {$prefix}
                <input type='checkbox' name='category_id[]' value='{$category->id}'{$isChecked}>
                {$category->name}
            </label>
        </li>
        ";

            // Recursively build the tree for children
            if ($category->children->isNotEmpty()) {
                $tree = array_merge($tree, self::buildTreeForSelect($category->children, $prefix . '&nbsp;&nbsp;&nbsp;&nbsp;', $selectedIds, $counter));
            }
        }
        return $tree;
    }



    public static function getDropDownList($fieldName, $id = NULL)
    {
        $str = "<option value=''>Select One</option>";
        $lists = self::orderBy('serial', 'asc')->where('status', 1)->get();
        if ($lists) {
            foreach ($lists as $list) {
                if ($id != NULL && $id == $list->id) {
                    $str .= "<option  value='" . $list->id . "' selected>" . $list->$fieldName . "</option>";
                } else {
                    $str .= "<option  value='" . $list->id . "'>" . $list->$fieldName . "</option>";
                }
            }
        }
        return $str;
    }
}
