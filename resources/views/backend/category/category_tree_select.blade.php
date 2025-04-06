<ul>

    @foreach ($categories as $category)
        <li>
            {{ $category['name'] }}
            @if (!empty($category['children']))
                @include('backend.category.category_tree_select', ['categories' => $category['children']])
            @endif
        </li>
    @endforeach
</ul>







{{--
<ul id="categoryTree">
    @foreach ($categories as $category)
        <li data-name="{{ $category['name'] }}" data-slug="{{ $category['slug'] }}" data-parent_id="{{ $category['parent_id'] }}">
            <i class="mdi mdi-folder-edit"></i>{{ $category['name'] }}

            <span class="toggle-icon" style="display: @if (isset($category['children']) && count($category['children']) !== 0) block @else none @endif;">+</span>

            <button class="delete-btn">Delete</button>
            <a class="edit-btn" href="/edit/category/{{ $category['slug'] }}">New Edit</a>
            @if (!empty($category['children']))
                <ul class="submenu">
                @include('backend.category.category_tree', ['categories' => $category['children']])
                </ul>
            @endif
        </li>
    @endforeach
</ul>

--}}
