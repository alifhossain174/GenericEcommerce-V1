<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    use HasFactory;

    public function children()
    {
        return $this->hasMany(Menu::class, 'parent_id')->with('children');
    }


    // Define the relationship with the parent Menu
    public function parent()
    {
        return $this->belongsTo(Menu::class, 'parent_id');
    }

    // Fetch products directly associated with this Menu
    public function products()
    {
        return $this->hasMany(Product::class);
    }

    public static function getTree($id = null)
    {
        // Get root menus (those that have no parent)
        $menus = Menu::whereNull('parent_id')->with('children')->get();

        // Build the tree with proper indentation and optional selection
        return self::buildTree($menus, '', $id);
    }

    private static function buildTree($menus, $prefix = '', $selectedId = null)
    {
        $tree = [];
        foreach ($menus as $menu) {
            // If the menu ID matches the selected ID, add the "selected" attribute
            $isSelected = $menu->id == $selectedId ? ' selected' : '';

            // Build the option element for the current menu
            $tree[] = "<option value='{$menu->id}'{$isSelected}>{$prefix}{$menu->menu_name}</option>";

            // Recursively handle child menus
            if ($menu->children->isNotEmpty()) {
                $tree = array_merge($tree, self::buildTree($menu->children, $prefix . '— ', $selectedId));
            }
        }
        return $tree;
    }

    // Static helper
    public static function getTreeForSelect($selectedIds = [])
    {
        // Ensure selectedIds is an array
        $selectedIds = is_array($selectedIds) ? $selectedIds : [$selectedIds];

        $menus = Menu::whereNull('parent_id')->with('children')->get();

        return self::buildTreeForSelect($menus, '', $selectedIds);
    }

    private static function buildTreeForSelect($menus, $prefix = '', $selectedIds = [], &$counter = 0)
    {
        $tree = [];
        foreach ($menus as $Menu) {
            $counter++; // Increment the counter for each Menu

            // Check if the Menu ID is in the selected IDs array
            $isChecked = (in_array($Menu->id, $selectedIds)) ? ' checked' : '';

            // Generate the list item with indentation first, followed by the checkbox
            $tree[] = "
        <li id='{$Menu->id}' style='list-style: none;'>
            <label>
                {$prefix}
                <input type='checkbox' name='Menu_id[]' value='{$Menu->id}'{$isChecked}>
                {$Menu->name}
            </label>
        </li>
        ";

            // Recursively build the tree for children
            if ($Menu->children->isNotEmpty()) {
                $tree = array_merge($tree, self::buildTreeForSelect($Menu->children, $prefix . '&nbsp;&nbsp;&nbsp;&nbsp;', $selectedIds, $counter));
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
