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
    Category
@endsection
@section('page_heading')
    Update category
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
                                <a href="{{ route('ViewAllCategory') }}" class="btn btn-primary mb-3"
                                    id="addCategoryBtn">Add
                                    Category</a>
                            </div>
                            @include('backend.category.category_tree', ['categories' => $categories])
                        </div>

                        <!-- Category Data Form  -->
                        <div class="data-form hidden" id="dataForm">
                            <form class="needs-validation" method="POST" action="{{ url('update/category') }}"
                                enctype="multipart/form-data">
                                @csrf
                                <input type="hidden" name="id" value="{{ $category->id }}">

                                {{-- <div class="d-flex justify-content-between align-content-center mb-4">
                                    <h3 id="formTitle" class="m-0">New Category</h3>
                                    <a href="{{ url('/view/all/category') }}" class="btn btn-primary">Add new category</a>
                                </div> --}}

                                <h3 id="formTitle">Category Update Form</h3>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input value="{{ $category->name }}" type="text" id="nameInput" name="name"
                                        placeholder="Name" required />
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('name')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label>Permalink <span class="btn-outline-danger">*</span></label>
                                    <input type="text" name="slug" id="permalinkInput" placeholder="Permalink"
                                        oninput="updateSlugPreview()" value="{{ $category->slug }}" required />

                                    <small class="form-hint mt-n2 text-truncate">
                                        Preview url:
                                        <a id="permalinkPreview" {{-- href="{{env('APP_FRONTEND_URL')}}/{{$category->slug}}" --}}
                                            style="color:darkcyan;font-size: 12px" target="_blank">
                                            {{ env('APP_FRONTEND_URL') }}/{{ $category->slug }}
                                        </a>
                                    </small>
                                </div>

                                <div class="form-group">
                                    <label>Parent </label>
                                    <select class="form-control w-100" data-toggle="select2" id="parentInput"
                                        name="parent_id">
                                        <option value="">Select Category</option>
                                        @foreach (\App\Models\Category::getTree($category->parent_id) as $option)
                                            {!! $option !!}
                                        @endforeach
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="description">Full Description</label>

                                    <textarea id="description" name="description" class="form-control"> {!! $category->description !!}</textarea>
                                    <div class="invalid-feedback" style="display: block;">
                                        @error('description')
                                            {{ $message }}
                                        @enderror
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label>Summary </label>
                                    <textarea name="summary" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Enter Note"> {!! $category->summary !!}</textarea>
                                </div>

                                <div class="form-group row">
                                    <label for="colFormLabel" class="col-sm-2 col-form-label">Category Image</label>
                                    <div class="col-sm-10">
                                        <input type="file" name="image" class="dropify" data-height="100"
                                            data-max-file-size="1M" accept="image/*" />
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="colFormLabel" class="col-sm-2 col-form-label">Category Icon</label>
                                    <div class="col-sm-10">
                                        <input type="file" name="icon" class="dropify" data-height="100"
                                            data-max-file-size="1M" accept="image/*" />
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="colFormLabel" class="col-sm-2 col-form-label">Category Banner</label>
                                    <div class="col-sm-10">
                                        <input type="file" name="banner_image" class="dropify" data-height="200"
                                            data-max-file-size="1M" accept="image/*" />
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="meta_title">Affiliate bonus</label>
                                            <input value="{{ $category->affiliate_bonus }}" type="number"
                                                id="meta_title" name="affiliate_bonus" class="form-control"
                                                placeholder="Affiliate bonus">
                                            <div class="invalid-feedback" style="display: block;">
                                                @error('affiliate_bonus')
                                                    {{ $message }}
                                                @enderror
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="meta_keywords">Vendor commission</label>
                                            <input value="{{ $category->vendor_commission }}" type="number"
                                                name="vendor_commission" class="form-control">
                                            <div class="invalid-feedback" style="display: block;">
                                                @error('vendor_commission')
                                                    {{ $message }}
                                                @enderror
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="form-group row">

                                    <div class="col-lg-6">
                                        <label for="meta_title">Sort priority</label>
                                        <select class="form-control" id="sort_priority" name="sort_priority">
                                            <option value="">Select One</option>
                                            <option value="P_H_L"
                                                {{ $category->sort_priority == 'P_H_L' ? 'selected' : '' }}>Price (High to
                                                Low)</option>
                                            <option value="P_L_H"
                                                {{ $category->sort_priority == 'P_L_H' ? 'selected' : '' }}>Price (Low to
                                                High)</option>
                                            <option value="N_ASC"
                                                {{ $category->sort_priority == 'N_ASC' ? 'selected' : '' }}>Name (ASC)
                                            </option>
                                            <option value="N_DESC"
                                                {{ $category->sort_priority == 'N_DESC' ? 'selected' : '' }}>Name (DESC)
                                            </option>
                                            <option value="R_H_L"
                                                {{ $category->sort_priority == 'R_H_L' ? 'selected' : '' }}>Rating (High to
                                                Low)</option>
                                            <option value="R_L_H"
                                                {{ $category->sort_priority == 'R_L_H' ? 'selected' : '' }}>Rating (Low to
                                                High)</option>
                                        </select>

                                        <div class="invalid-feedback" style="display: block;">
                                            @error('sort_priority')
                                                {{ $message }}
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="meta_keywords">Google category id</label>
                                            <input value="{{ $category->google_cat_id }}" type="number"
                                                name="google_cat_id" class="form-control">
                                            <div class="invalid-feedback" style="display: block;">
                                                @error('google_cat_id')
                                                    {{ $message }}
                                                @enderror
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-lg-12">
                                        <div class="card">
                                            <div class="card-body table-responsive">
                                                <h4 class="card-title mb-3">Category SEO Information <small
                                                        class="text-danger font-weight-bolder">(Optional)</small></h4>

                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="form-group">
                                                            <label for="meta_title">Meta Title</label>
                                                            <input value="{{ $category->meta_title }}" type="text"
                                                                id="meta_title" name="meta_title" class="form-control"
                                                                placeholder="Meta Title">
                                                            <div class="invalid-feedback" style="display: block;">
                                                                @error('meta_title')
                                                                    {{ $message }}
                                                                @enderror
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="form-group">
                                                            <label for="meta_keywords">Meta Keywords</label>
                                                            <input value="{{ $category->meta_keywords }}" type="text"
                                                                id="meta_keywords" data-role="tagsinput"
                                                                name="meta_keywords" class="form-control">
                                                            <div class="invalid-feedback" style="display: block;">
                                                                @error('meta_keywords')
                                                                    {{ $message }}
                                                                @enderror
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <div class="form-group">
                                                            <label for="meta_description">Meta Description</label>
                                                            <textarea id="meta_description" name="meta_description" class="form-control" placeholder="Meta Description Here"> {!! $category->meta_description !!}</textarea>
                                                            <div class="invalid-feedback" style="display: block;">
                                                                @error('meta_description')
                                                                    {{ $message }}
                                                                @enderror
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-lg-12">
                                        <div class="card">
                                            <div class="card-body table-responsive">
                                                <h4 class="card-title mb-3">OG Information <small
                                                        class="text-danger font-weight-bolder">(Optional)</small></h4>

                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="col-lg-12">
                                                            <div class="form-group">
                                                                <label for="meta_title">OG Title</label>
                                                                <input value="{{ $category->og_title }}" type="text"
                                                                    id="meta_title" name="og_title" class="form-control"
                                                                    placeholder="Meta Title">
                                                                <div class="invalid-feedback" style="display: block;">
                                                                    @error('og_title')
                                                                        {{ $message }}
                                                                    @enderror
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-12">
                                                            <div class="form-group">
                                                                <label for="meta_description">OG Description</label>
                                                                <textarea rows="6" id="meta_description" name="og_keywords" class="form-control"
                                                                    placeholder="Meta Description Here">{!! $category->og_keywords !!}</textarea>
                                                                <div class="invalid-feedback" style="display: block;">
                                                                    @error('og_keywords')
                                                                        {{ $message }}
                                                                    @enderror
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="form-group">
                                                            <label for="image">OG Image<span
                                                                    class="text-danger">*</span></label>
                                                            <input type="file" name="og_image" class="dropify"
                                                                data-height="215" data-max-file-size="1M"
                                                                accept="image/*" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">

                                    <div class="col-lg-4">
                                        <label for="show_on_navbar">Show On Navbar</label>

                                        <select name="show_on_navbar" class="form-control" id="show_on_navbar">
                                            <option value="">Select One</option>
                                            <option value="1" @if ($category->show_on_navbar == 1) selected @endif>Yes
                                            </option>
                                            <option value="0" @if ($category->show_on_navbar == 0) selected @endif>No
                                            </option>
                                        </select>
                                        <div class="invalid-feedback" style="display: block;">
                                            @error('show_on_navbar')
                                                {{ $message }}
                                            @enderror
                                        </div>

                                    </div>

                                    <div class="col-lg-4">
                                        <label for="meta_title">Is featured?</label>
                                        <select name="featured" class="form-control" id="featured">
                                            <option value="">Select One</option>
                                            <option value="1" @if ($category->featured == 1) selected @endif>Yes
                                                Featured
                                            </option>
                                            <option value="0" @if ($category->featured == 0) selected @endif>Not
                                                Featured
                                            </option>
                                        </select>
                                        <div class="invalid-feedback" style="display: block;">
                                            @error('featured')
                                                {{ $message }}
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-lg-4">
                                        <label for="meta_title">Status</label>
                                        <select name="status" class="form-control" id="featured">
                                            <option value="">Select One</option>
                                            <option value="1" @if ($category->status == 1) selected @endif>Active
                                            </option>
                                            <option value="0" @if ($category->status == 0) selected @endif>
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

                            @php
                                $category_products = \DB::table('products')
                                    ->whereRaw("JSON_CONTAINS(category_id, '\"$category->id\"')")
                                    ->where('status', 1)
                                    ->orderBy('id', 'desc')
                                    ->get();
                            @endphp
                            {{-- <p>Product {{ $key }}: {{ $product->name }}</p> --}}

                            {{-- Create a product table --}}
                            <table class="table table-bordered mt-3">
                                <thead>
                                    <tr>
                                        <th>SL</th>
                                        <th>SKU</th>
                                        <th>Product Image</th>
                                        <th>Product Name</th>
                                        <th>Product Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($category_products as $key => $product)
                                        <tr>
                                            <td>
                                                {{ $key + 1 }}
                                            </td>
                                            <td>{{ $product->code }}</td>
                                            <td>
                                                <img src="{{ url($product->image) }}" alt="{{ $product->name }}"
                                                    style="width: 50px;">
                                            </td>
                                            <td>{{ $product->name }}</td>
                                            <td>{{ $product->price }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>


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
            ajax: "{{ url('view/all/category') }}",
            columns: [{
                    data: 'DT_RowIndex',
                    name: 'DT_RowIndex'
                },
                {
                    data: 'name',
                    name: 'name'
                }, //orderable: true, searchable: true
                {
                    data: 'image',
                    name: 'image',
                    render: function(data, type, full, meta) {
                        if (data) {
                            return "<img src=\"/" + data + "\" width=\"50\"/>";
                        } else {
                            return '';
                        }
                    }
                },
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
                    data: 'banner_image',
                    name: 'banner_image',
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
                    data: 'featured',
                    name: 'featured'
                },
                {
                    data: 'show_on_navbar',
                    name: 'show_on_navbar'
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
                    url: "{{ url('delete/category') }}" + '/' + categorySlug,
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
                    url: "{{ url('feature/category') }}" + '/' + categorySlug,
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
        const categoryTree = document.getElementById("categoryTree");
        const dataForm = document.getElementById("dataForm");
        const formTitle = document.getElementById("formTitle");
        const nameInput = document.getElementById("nameInput");
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
        categoryTree.addEventListener("click", function(e) {
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
        categoryTree.addEventListener("click", function(e) {
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
        @if ($category->image && file_exists(public_path($category->image)))
            $(".dropify-preview").eq(0).css("display", "block");
            $(".dropify-clear").eq(0).css("display", "block");
            $(".dropify-filename-inner").eq(0).html("{{ $category->image }}");
            $("span.dropify-render").eq(0).html("<img src='{{ url($category->image) }}'>");
        @endif

        @if ($category->icon && file_exists(public_path($category->icon)))
            $(".dropify-preview").eq(1).css("display", "block");
            $(".dropify-clear").eq(1).css("display", "block");
            $(".dropify-filename-inner").eq(1).html("{{ $category->icon }}");
            $("span.dropify-render").eq(1).html("<img src='{{ url($category->icon) }}'>");
        @endif

        @if ($category->banner_image && file_exists(public_path($category->banner_image)))
            $(".dropify-preview").eq(2).css("display", "block");
            $(".dropify-clear").eq(2).css("display", "block");
            $(".dropify-filename-inner").eq(2).html("{{ $category->banner_image }}");
            $("span.dropify-render").eq(2).html("<img src='{{ url($category->banner_image) }}'>");
        @endif

        @if ($category->og_image && file_exists(public_path($category->og_image)))
            $(".dropify-preview").eq(3).css("display", "block");
            $(".dropify-clear").eq(3).css("display", "block");
            $(".dropify-filename-inner").eq(3).html("{{ $category->og_image }}");
            $("span.dropify-render").eq(3).html("<img src='{{ url($category->og_image) }}'>");
        @endif
    </script>



    <script>
        function updateSlugPreview() {
            const input = document.getElementById('permalinkInput');
            const previewLink = document.getElementById('permalinkPreview');

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
