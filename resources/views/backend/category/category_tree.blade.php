<ul id="categoryTree">
    @foreach ($categories as $category)
        @php
            $category_products = \DB::table('products')
                ->whereRaw("JSON_CONTAINS(category_id, '\"$category->id\"')")
                ->where('status', 1)
                ->count();
        @endphp
        <li data-name="{{ $category['name'] }}" data-slug="{{ $category['slug'] }}"
            data-parent_id="{{ $category['parent_id'] }}">
            <i class="mdi mdi-folder-edit"></i><strong>[ID: {{ $category['id'] }}]</strong> - {{ $category['name'] }}
            <span class="product-count">({{ $category_products }} products)</span>
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
