

<ul id="menuTree">
    @foreach ($menus as $menu)
        <li data-name="{{ $menu->menu_name }}" data-slug="{{ $menu->slug }}" data-parent_id="{{ $menu->parent_id }}">
            <i class="mdi mdi-folder-edit"></i>{{ $menu->menu_name }}

            <span class="toggle-icon" style="display: @if ($menu->children->isNotEmpty()) block @else none @endif;">+</span>

            <button class="delete-btn">Delete</button>
            <a class="edit-btn" href="/edit/menu/{{ $menu->slug }}">Edit</a>

            @if ($menu->children->isNotEmpty())
                <ul class="submenu">
                    @include('backend.Menu.menu_tree', ['menus' => $menu->children])
                </ul>
            @endif
        </li>
    @endforeach
</ul>


