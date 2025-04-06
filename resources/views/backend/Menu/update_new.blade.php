@extends('backend.master')

@section('header_css')
    <link href="{{ url('assets') }}/css/tagsinput.css" rel="stylesheet" type="text/css" />
    <link href="{{ url('dataTable') }}/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="{{ url('dataTable') }}/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="{{ url('assets') }}/plugins/dropify/dropify.min.css" rel="stylesheet" type="text/css" />
    <link href="{{ url('assets') }}/plugins/select2/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="{{ url('multipleImgUploadPlugin') }}/image-uploader.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <style>
        .dataTables_wrapper .dataTables_paginate .paginate_button {
            padding: 0px;
            border-radius: 4px;
        }

        table.dataTable tbody td:nth-child(1) {
            font-weight: 600;
        }

        table.dataTable tbody td {
            text-align: center !important;
        }

        tfoot {
            display: table-header-group !important;
        }

        tfoot th {
            text-align: center;
        }

        < !---->.p-category-sidebar {
            width: 40%;
            padding: 10px;
        }

        .p-category-sidebar ul {
            list-style: none;
            padding: 0;
        }

        .p-category-sidebar li {
            margin: 10px 0;
            position: relative;
            padding: 10px;
            cursor: pointer;
            transition: background 0.3s;
            border: 1px solid #e3e8f3;
            border-radius: 4px;
        }

        .p-category-sidebar li.active {}

        .p-category-sidebar li i {
            opacity: 0.8;
            margin-right: 4px;
        }

        .p-category-sidebar .toggle-icon {
            position: absolute;
            right: 12px;
            top: 8px;
        }

        .p-category-sidebar .delete-btn {
            background: #d63939;
            color: white;
            border: none;
            padding: 5px;
            cursor: pointer;
            font-size: 12px;
            border-radius: 4px;
            line-height: 10px;
            margin-left: 8px;
            display: none;
        }

        .p-category-sidebar .edit-btn {
            background: green;
            color: white;
            border: none;
            padding: 5px;
            cursor: pointer;
            font-size: 12px;
            border-radius: 4px;
            line-height: 10px;
            margin-left: 8px;
            display: none;
        }

        .p-category-sidebar .delete-btn:hover {
            background: #b92c2c;
        }

        .p-category-sidebar .edit-btn:hover {
            background: green;
        }

        .p-category-sidebar li.active .delete-btn {
            display: inline-block;
        }

        .p-category-sidebar li.active .edit-btn {
            display: inline-block;
        }

        .p-category-sidebar .submenu {
            display: none;
            padding-left: 20px;
        }

        .p-category-sidebar .submenu.open {
            display: block;
        }

        .product-category-inner {
            display: flex;
            gap: 24px;
        }

        .product-category-inner .data-form {
            padding: 20px;
            width: 60%;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-left: 20px;
            width: 60%;
            margin-top: 20px;
        }

        .product-category-inner .data-form input,
        .product-category-inner .data-form textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #e3e8f3;
            border-radius: 4px;
        }

        @media only screen and (max-width: 766.99px) {
            .product-category-inner {
                display: block;
            }

            .p-category-sidebar {
                width: 100%;
            }

            .product-category-inner .data-form {
                margin-left: 0;
                width: 100%;
            }
        }
    </style>
@endsection

@section('page_title')
    Menu
@endsection
@section('page_heading')
    Update Menu
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12 col-xl-12">

            <div class="card">
                <div class="card-body">
                    <div class="product-category-inner">
                        <!-- Sidebar Menus  -->
                        <div class="col-lg-4 p-category-sidebar">
                            <div class="text-right">
                                <a href="{{ route('ViewAllMenu') }}" class="btn btn-primary mb-3" id="addMenuBtn">Add
                                    Menu</a>
                            </div>
                            @include('backend.Menu.menu_tree', ['menus' => $menus])
                        </div>

                        <!-- Category Data Form  -->
                        <div class="data-form hidden" id="dataForm">
                            <form class="needs-validation" method="POST" action="{{ url('update/menu') }}"
                                enctype="multipart/form-data">
                                @csrf
                                <input type="hidden" name="id" value="{{ $menu->id }}">

                                <h3 id="formTitle">Menu Update Form</h3>
                                <div class="form-group">
                                    <label>Menu Name</label>
                                    <input value="{{ $menu->menu_name }}" type="text" id="nameInput" name="menu_name"
                                        placeholder="Menu Name" required />
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('menu_name')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label>Web Url<span class="btn-outline-danger">*</span></label>
                                    <input type="text" name="web_url" id="permalinkInput" placeholder="Permalink"
                                        oninput="updateSlugPreview()" value="{{ $menu->web_url }}" />

                                    <small class="form-hint mt-n2 text-truncate">
                                        Preview url:
                                        <a id="permalinkPreview" {{--
                                        href="{{ config('app.url') }}/category/{{$menu->slug}}" --}}
                                            style="color:darkcyan;font-size: 12px" target="_blank">
                                            {{ env('APP_FRONTEND_URL') }}/{{ $menu->web_url }}
                                        </a>
                                    </small>
                                </div>

                                <div class="form-group">
                                    <label>App url<span class="btn-outline-danger">*</span></label>
                                    <input type="text" name="app_url" id="permalinkInput1" placeholder="Permalink"
                                        oninput="updateSlugPreview()" value="{{ $menu->app_url }}" />

                                    <small class="form-hint mt-n2 text-truncate">
                                        Preview url:
                                        <a id="permalinkPreview1" {{--
                                        href="{{ config('app.url') }}/category/{{$menu->slug}}" --}}
                                            style="color:darkcyan;font-size: 12px" target="_blank">
                                            {{ env('APP_FRONTEND_URL') }}/{{ $menu->app_url }}
                                        </a>
                                    </small>
                                </div>

                                <input type="hidden" name="slug" value="{{ $menu->slug }}" id="permalinkInput2"
                                    placeholder="Slug" />

                                <div class="form-group">

                                    <label>Parent </label>
                                    <select class="form-control w-100" data-toggle="select2" id="parentInput"
                                        name="parent_id">
                                        <option value="">Select Menu</option>
                                        @foreach (\App\Models\Menu::getTree($menu->parent_id) as $option)
                                            {!! $option !!}
                                        @endforeach
                                    </select>
                                </div>

                                <div class="form-group row">
                                    <label for="colFormLabel" class="col-sm-2 col-form-label">Menu Icon</label>
                                    <div class="col-sm-10">
                                        <input type="file" name="icon" class="dropify" data-height="100"
                                            data-max-file-size="1M" accept="image/*" />
                                    </div>
                                </div>

                                <div class="form-group row">

                                    <div class="col-lg-4">
                                        <label for="menu_type">Menu Type</label>

                                        <select name="menu_type" class="form-control" id="menu_type">
                                            <option value="1" @if ($menu->menu_type == 1) selected @endif>Main
                                                Menu</option>
                                        </select>
                                        <div class="invalid-feedback" style="display: block;">
                                            @error('menu_type')
                                                {{ $message }}
                                            @enderror
                                        </div>

                                    </div>

                                    <div class="col-lg-4">
                                        <label for="sort">Sorting</label>
                                        <input value="{{ $menu->sort }}" type="number" id="sortInput" name="sort"
                                            placeholder="Sorting" required />
                                        <div class="invalid-feedback" style="display: block;">
                                            @error('sort')
                                                {{ $message }}
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-lg-4">
                                        <label for="status">Status</label>
                                        <select name="status" class="form-control" id="status">
                                            <option value="">Select One</option>
                                            <option value="1" @if ($menu->status == 1) selected @endif>Active
                                            </option>
                                            <option value="0" @if ($menu->status == 0) selected @endif>
                                                Inactive</option>
                                        </select>
                                        <div class="invalid-feedback" style="display: block;">
                                            @error('status')
                                                {{ $message }}
                                            @enderror
                                        </div>
                                    </div>
                                </div>

                                <div class="data-form-bottom">
                                    <button type="submit" class="btn btn-primary"> Save </button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>



        </div>
    </div>
@endsection


@section('footer_js')
    {{-- js code for data table --}}
    <script src="{{ url('dataTable') }}/js/jquery.validate.js"></script>
    <script src="{{ url('dataTable') }}/js/jquery.dataTables.min.js"></script>
    <script src="{{ url('dataTable') }}/js/dataTables.bootstrap4.min.js"></script>
    <script src="{{ url('assets') }}/plugins/dropify/dropify.min.js"></script>
    <script src="{{ url('assets') }}/pages/fileuploads-demo.js"></script>
    <script src="{{ url('multipleImgUploadPlugin') }}/image-uploader.min.js"></script>
    <script src="{{ url('assets') }}/js/tagsinput.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <script type="text/javascript">
        var table = $(".data-table").DataTable({
            processing: true,
            serverSide: true,
            stateSave: true,
            ajax: "{{ url('view/all/menus') }}",
            columns: [{
                    data: 'DT_RowIndex',
                    name: 'DT_RowIndex'
                },
                {
                    data: 'menu_name',
                    name: 'menu_name'
                }, //orderable: true, searchable: true
                {
                    data: 'web_url',
                    name: 'web_url'
                }, //orderable: true, searchable: true
                {
                    data: 'app_url',
                    name: 'app_url'
                }, //orderable: true, searchable: true
                {
                    data: 'icon',
                    name: 'icon',
                    render: function(data, type, full, meta) {
                        if (data) {
                            return "<img src=\"/" + data + "\" width=\"50\"/>";
                        } else {
                            return '';
                        }
                    }
                },
                {
                    data: 'slug',
                    name: 'slug'
                },
                {
                    data: 'menu_type',
                    name: 'menu_type'
                },
                {
                    data: 'status',
                    name: 'status'
                },
                {
                    data: 'action',
                    name: 'action',
                    orderable: false,
                    searchable: false
                },
            ],

        });

        $(".dataTables_filter").append($("#customFilter"));
    </script>

    {{-- js code for user crud --}}
    <script>
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('body').on('click', '.deleteBtn', function() {
            var categorySlug = $(this).data("id");
            if (confirm("Are You sure want to delete !")) {
                $.ajax({
                    type: "GET",
                    url: "{{ url('delete/menu') }}" + '/' + categorySlug,
                    success: function(data) {
                        table.draw(false);
                        toastr.error("Category has been Deleted", "Deleted Successfully");
                    },
                    error: function(data) {
                        console.log('Error:', data);
                    }
                });
            }
        });


        $('body').on('click', '.featureBtn', function() {
            var categorySlug = $(this).data("id");
            if (confirm("Are You sure to Change the Feature Status !")) {
                $.ajax({
                    type: "GET",
                    url: "{{ url('feature/menu') }}" + '/' + categorySlug,
                    success: function(data) {

                        table.draw(false);
                        toastr.success("Category has been Featured", "Featured Successfully");

                    },
                    error: function(data) {
                        console.log('Error:', data);
                    }
                });
            }
        });
    </script>

    <!-- Product Category JS -->
    <script type="text/javascript">
        const menuTree = document.getElementById("menuTree");
        const dataForm = document.getElementById("dataForm");
        const formTitle = document.getElementById("formTitle");
        const nameInput = document.getElementById("nameInput");
        const sortInput = document.getElementById("sortInput");
        const permalinkInput = document.getElementById("permalinkInput");
        const rootCat = document.getElementById("rootCat");
        const parentInput = document.getElementById("parentInput");
        const descriptionInput = document.getElementById("descriptionInput");
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        // Toggle submenu for the clicked menu item
        menuTree.addEventListener("click", function(e) {
            const li = e.target.closest("li");
            if (!li) return;

            // Prevent the submenu toggle for the delete button
            if (e.target.classList.contains("delete-btn")) return;
            if (e.target.classList.contains("edit-btn")) return;

            // Toggle submenu for clicked menu item
            const submenu = li.querySelector(".submenu");
            if (submenu) {
                submenu.classList.toggle("open");
                const icon = li.querySelector(".toggle-icon");
                icon.textContent = submenu.classList.contains("open") ? "-" : "+";
            }

            // Remove 'active' class from all menu items and hide delete button
            const allMenus = document.querySelectorAll(".p-category-sidebar li");
            allMenus.forEach((menu) => {
                menu.classList.remove("active");
                const deleteBtn = menu.querySelector(".delete-btn");
                const editBtn = menu.querySelector(".edit-btn");
                if (deleteBtn) {
                    deleteBtn.style.display = "none";
                }
                if (editBtn) {
                    editBtn.style.display = "none";
                }
            });

            // Activate clicked menu item and show delete button
            li.classList.add("active");
            const deleteButton = li.querySelector(".delete-btn");
            if (deleteButton) {
                deleteButton.style.display = "inline-block";
            }

            const editButton = li.querySelector(".edit-btn");
            if (editButton) {
                editButton.style.display = "inline-block";
            }

            descriptionInput.value = "";
            dataForm.classList.remove("hidden");
        });

        // Optional: Add event listeners to handle delete actions
        menuTree.addEventListener("click", function(e) {
            if (e.target.classList.contains("delete-btn")) {
                const li = e.target.closest("li");
                if (li) {
                    // Confirm before deleting
                    if (
                        confirm(`Are you sure you want to delete "${li.dataset.name}" ,"${li.dataset.slug}"?`)
                    ) {
                        li.remove();
                        $.ajax({
                            type: "GET",
                            url: "{{ url('delete/category') }}" + '/' + li.dataset.slug,
                            success: function(data) {
                                table.draw(false);
                                toastr.error("Category has been Deleted", "Deleted Successfully");
                            },
                            error: function(data) {
                                console.log('Error:', data);
                            }
                        });

                    }
                }
            }
        });

        $('#description').summernote({
            placeholder: 'Write Description Here',
            tabsize: 2,
            height: 350
        });
    </script>

    <script>
        @if ($menu->icon && file_exists(public_path($menu->icon)))
            $(".dropify-preview").eq(0).css("display", "block");
            $(".dropify-clear").eq(0).css("display", "block");
            $(".dropify-filename-inner").eq(0).html("{{ $menu->icon }}");
            $("span.dropify-render").eq(0).html("<img src='{{ url($menu->icon) }}'>");
        @endif

        @if ($menu->banner_image && file_exists(public_path($menu->banner_image)))
            $(".dropify-preview").eq(1).css("display", "block");
            $(".dropify-clear").eq(1).css("display", "block");
            $(".dropify-filename-inner").eq(1).html("{{ $menu->banner_image }}");
            $("span.dropify-render").eq(1).html("<img src='{{ url($menu->banner_image) }}'>");
        @endif

        @if ($menu->og_image && file_exists(public_path($menu->og_image)))
            $(".dropify-preview").eq(2).css("display", "block");
            $(".dropify-clear").eq(2).css("display", "block");
            $(".dropify-filename-inner").eq(2).html("{{ $menu->og_image }}");
            $("span.dropify-render").eq(2).html("<img src='{{ url($menu->og_image) }}'>");
        @endif
    </script>

    <script>
        function updateSlugPreview() {
            const input = document.getElementById('permalinkInput');
            const input1 = document.getElementById('permalinkInput1');
            const previewLink = document.getElementById('permalinkPreview');
            const previewLink1 = document.getElementById('permalinkPreview1');

            // Replace spaces with dashes and remove special characters to create a slug
            const slug = input.value
                .toLowerCase()
                .replace(/ /g, '-') // Replace spaces with dashes
                .replace(/[^a-z0-9-]/g, ''); // Remove special characters

            // Update the href and text of the preview link
            previewLink.href = `{{ config('app.url') }}/product-categories/${slug}`;
            previewLink.textContent = `{{ config('app.url') }}/product-categories/${slug}`;
        }
    </script>
@endsection
