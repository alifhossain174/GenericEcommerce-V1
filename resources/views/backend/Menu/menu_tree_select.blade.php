<ul>

    @foreach ($menus as $menu)
        <li>
            {{ $menu['name'] }}
            @if (!empty($menu['children']))
                @include('backend.Menu.menu_tree_select', ['menus' => $menu['children']])
            @endif
        </li>
    @endforeach
</ul>







{{--
<ul id="menuTree">
    @foreach ($menus as $menu)
        <li data-name="{{ $menu['name'] }}" data-slug="{{ $menu['slug'] }}" data-parent_id="{{ $menu['parent_id'] }}">
            <i class="mdi mdi-folder-edit"></i>{{ $menu['name'] }}

            <span class="toggle-icon" style="display: @if (isset($menu['children']) && count($menu['children']) !== 0) block @else none @endif;">+</span>

            <button class="delete-btn">Delete</button>
            <a class="edit-btn" href="/edit/menu/{{ $menu['slug'] }}">New Edit</a>
            @if (!empty($menu['children']))
                <ul class="submenu">
                @include('backend.menu.menu_tree', ['menus' => $menu['children']])
                </ul>
            @endif
        </li>
    @endforeach
</ul>

--}}
