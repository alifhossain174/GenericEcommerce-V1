@extends('backend.master')

@section('header_css')
    <style>
        .nav-pills .nav-link {
            border: 1px solid #e2e7f1;
            padding: .75rem 1rem;
            text-align: left;
            display: inline-block;
            text-wrap: nowrap;
        }

        .nav-pills {
            background: transparent;
        }

        .nav-pills .nav-link.active,
        .nav-pills .show>.nav-link {
            color: #fff;
            background-color: #5369f8;
        }
    </style>
@endsection

@section('page_title')
    Footer Settings
@endsection
@section('page_heading')
    Footer Settings
@endsection

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header bg-transparent">
                    <h4 class="header-title mt-0 mb-0">Footer Settings</h4>
                </div>
                <div class="card-body">
                    <form action="{{ url('save/footer') }}" method="POST" enctype="multipart/form-data" id="footer-widget">
                        @csrf
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist"
                                    aria-orientation="vertical">
                                    @foreach (['Footer_widget_1', 'Footer_widget_2', 'Footer_widget_3', 'social_links', 'contacts'] as $widget)
                                        <a class="nav-link {{ $loop->first ? 'active show' : '' }}"
                                            id="v-pills-{{ $widget }}-tab" data-toggle="pill"
                                            href="#v-pills-{{ $widget }}" role="tab"
                                            aria-controls="v-pills-{{ $widget }}"
                                            aria-selected="{{ $loop->first ? 'true' : 'false' }}">
                                            <span class="d-none d-lg-block">
                                                {{ ucwords(str_replace('_', ' ', $widget)) }}
                                            </span>
                                        </a>
                                    @endforeach
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="tab-content" id="v-pills-tabContent">
                                    @foreach (['1' => 'Footer Widget 1', '2' => 'Footer Widget 2', '3' => 'Footer Widget 3', '4' => 'Footer Widget 4'] as $widgetIndex => $widgetTitle)
                                        <div class="tab-pane fade {{ $widgetIndex == '1' ? 'show active' : '' }}"
                                            id="v-pills-Footer_widget_{{ $widgetIndex }}" role="tabpanel"
                                            aria-labelledby="v-pills-Footer_widget_{{ $widgetIndex }}-tab">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h4 class="header-title mt-0 mb-0">{{ $widgetTitle }}</h4>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-12 mb-2">
                                                                    <label class="form-label"
                                                                        for="widget{{ $widgetIndex }}_title">Widget
                                                                        Title</label>
                                                                    <input type="text" class="form-control"
                                                                        id="widget{{ $widgetIndex }}_title"
                                                                        name="widget{{ $widgetIndex }}_title"
                                                                        value="{{ $footer->{'widget' . $widgetIndex . '_title'} }}"
                                                                        placeholder="Widget {{ $widgetIndex }} Title">
                                                                </div>

                                                                <div class="col-12">
                                                                    <table class="table table-nowrap"
                                                                        id="widget{{ $widgetIndex }}_table">
                                                                        <thead>
                                                                            <tr>
                                                                                <th scope="col">Widget Title</th>
                                                                                <th scope="col">Widget Link</th>
                                                                                <th scope="col">Action</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            @foreach (json_decode($footer->{'widget' . $widgetIndex . '_links'} ?? '[]', true) as $index => $widgetItem)
                                                                                <tr
                                                                                    id="widget{{ $widgetIndex }}-row-{{ $index }}">
                                                                                    <td>
                                                                                        <input type="text"
                                                                                            class="form-control"
                                                                                            name="widget{{ $widgetIndex }}_link_label[]"
                                                                                            value="{{ $widgetItem['widget' . $widgetIndex . '_link_label'] }}"
                                                                                            placeholder="Link Label">
                                                                                    </td>
                                                                                    <td>
                                                                                        <input type="text"
                                                                                            class="form-control"
                                                                                            name="widget{{ $widgetIndex }}_url[]"
                                                                                            value="{{ $widgetItem['widget' . $widgetIndex . '_url'] }}"
                                                                                            placeholder="URL">
                                                                                    </td>
                                                                                    <td>
                                                                                        <button type="button"
                                                                                            class="btn btn-danger"
                                                                                            onclick="removeWidgetRow('widget{{ $widgetIndex }}-row-{{ $index }}')">Remove</button>
                                                                                    </td>
                                                                                </tr>
                                                                            @endforeach
                                                                        </tbody>
                                                                    </table>
                                                                    <button type="button" class="btn btn-primary mt-2"
                                                                        onclick="addWidgetRow('widget{{ $widgetIndex }}_table', 'widget{{ $widgetIndex }}_link_label', 'widget{{ $widgetIndex }}_url')">Add
                                                                        New Link</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach

                                    <div class="tab-pane fade" id="v-pills-social_links" role="tabpanel"
                                        aria-labelledby="v-pills-social_links-tab">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="col-12 mb-2">
                                                    <label class="form-label" for="social_link_title">Social
                                                        Title</label>
                                                    <input type="text" class="form-control" id="social_link_title"
                                                        name="social_link_title" value="{{ $footer->social_link_title }}"
                                                        placeholder="Social Link Title">
                                                </div>
                                                <table class="table table-nowrap" id="download_app_table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Label</th>
                                                            <th scope="col">Icon</th>
                                                            <th scope="col">URL</th>
                                                            <th scope="col">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        @php
                                                            $socialLinks = is_string($footer->social_links)
                                                                ? json_decode($footer->social_links, true)
                                                                : $footer->social_links ?? [];
                                                        @endphp

                                                        @foreach ($socialLinks as $index => $socialLink)
                                                            @if (is_array($socialLink))
                                                                <tr id="social_link_row_{{ $index }}">
                                                                    <td>
                                                                        <input type="text" class="form-control"
                                                                            name="social_link_label[]"
                                                                            value="{{ $socialLink['social_link_label'] ?? '' }}"
                                                                            placeholder="Link Label">
                                                                    </td>
                                                                    <td>
                                                                        <input type="file" class="form-control"
                                                                            name="social_link_icon[]" accept="image/*"
                                                                            placeholder="Icon">
                                                                        @if (!empty($socialLink['social_link_icon']))
                                                                            <div class="d-flex align-items-center mt-2">
                                                                                <img src="{{ asset('storage/' . $socialLink['social_link_icon']) }}"
                                                                                    alt="{{ $socialLink['social_link_label'] }}"
                                                                                    style="max-width: 24px;">
                                                                                <span class="ml-2">
                                                                                    Added Icon:
                                                                                    {{ $socialLink['social_link_label'] }}
                                                                                </span>
                                                                            </div>
                                                                        @endif
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" class="form-control"
                                                                            name="social_link_url[]"
                                                                            value="{{ $socialLink['social_link_url'] ?? '' }}"
                                                                            placeholder="URL">
                                                                    </td>
                                                                    <td>
                                                                        <button type="button" class="btn btn-danger"
                                                                            onclick="removeWidgetRow('social_link_row_{{ $index }}')">Remove</button>
                                                                    </td>
                                                                </tr>
                                                            @endif
                                                        @endforeach
                                                    </tbody>
                                                </table>
                                                <button type="button" id="add_social_link_btn"
                                                    class="btn btn-primary mt-2" onclick="addSocialLinkRow()">
                                                    Add New Social Link
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="v-pills-contacts" role="tabpanel"
                                        aria-labelledby="v-pills-contacts-tab">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="col-12 mb-2">
                                                    <label class="form-label" for="contact_title">Contacts</label>
                                                    <input type="text" class="form-control" id="contact_title"
                                                        name="contact_title" value="{{ $footer->contact_title }}"
                                                        placeholder="Contact Title">
                                                </div>
                                                <table class="table table-nowrap" id="contacts_table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Phone No</th>
                                                            <th scope="col">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        @php
                                                            $contacts = json_decode($footer->contact, true) ?? [];
                                                        @endphp

                                                        @foreach ($contacts as $index => $contact)
                                                            @if (is_array($contact))
                                                                <tr id="contact_row_{{ $index }}">
                                                                    <td>
                                                                        <input type="text" class="form-control"
                                                                            name="contact_label[]"
                                                                            value="{{ $contact['contact_label'] ?? '' }}"
                                                                            placeholder="Contact Label">
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" class="form-control"
                                                                            name="contact_number[]"
                                                                            value="{{ $contact['contact_number'] ?? '' }}"
                                                                            placeholder="Contact Number">
                                                                    </td>
                                                                    <td>
                                                                        <button type="button" class="btn btn-danger"
                                                                            onclick="removeWidgetRow('contact_row_{{ $index }}')">Remove</button>
                                                                    </td>
                                                                </tr>
                                                            @endif
                                                        @endforeach
                                                    </tbody>
                                                </table>
                                                <button type="button" id="add_contact_btn" class="btn btn-primary mt-2"
                                                    onclick="addContactRow()">
                                                    Add New Contact
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 text-center">
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('footer_js')
    <script>
        var ckClassicEditor = document.querySelectorAll(".ckeditor-classic");
        if (ckClassicEditor) {
            Array.from(ckClassicEditor).forEach(function() {
                ClassicEditor.create(document.querySelector(".ckeditor-classic"))
                    .then(function(editor) {
                        editor.ui.view.editable.element.style.height = "250px";
                    })
                    .catch(function(error) {
                        console.error(error);
                    });
            });
        }
    </script>
    <script>
        function addWidgetRow(tableId, labelName, urlName) {
            const tableBody = document.querySelector(`#${tableId} tbody`);
            const index = Date.now();
            const row = document.createElement('tr');
            row.id = `${tableId}-row-${index}`;
            row.innerHTML = `
                    <td>
                        <input type="text" class="form-control" name="${labelName}[]" placeholder="Link Label">
                    </td>
                    <td>
                        <input type="text" class="form-control" name="${urlName}[]" placeholder="URL">
                    </td>
                    <td>
                        <button type="button" class="btn btn-danger" onclick="removeWidgetRow('${row.id}')">Remove</button>
                    </td>
                `;
            tableBody.appendChild(row);
        }

        function removeWidgetRow(rowId) {
            const row = document.getElementById(rowId);
            if (row) {
                row.remove();
            }
        }
    </script>

    <script>
        function addSocialLinkRow() {
            const tableBody = document.querySelector('#download_app_table tbody');
            const index = Date.now();
            const row = document.createElement('tr');
            row.id = `social_link_row_${index}`;
            row.innerHTML = `
                    <td>
                        <input type="text" class="form-control" name="social_link_label[]" placeholder="Link Label">
                    </td>
                    <td>
                        <input type="file" class="form-control" name="social_link_icon[]" placeholder="Icon">
                    </td>
                    <td>
                        <input type="text" class="form-control" name="social_link_url[]" placeholder="URL">
                    </td>
                    <td>
                        <button type="button" class="btn btn-danger" onclick="removeWidgetRow('social_link_row_${index}')">Remove</button>
                    </td>
                `;
            tableBody.appendChild(row);
        }
    </script>

    <script>
        function addContactRow() {
            const tableBody = document.querySelector('#contacts_table tbody');
            const index = Date.now();
            const row = document.createElement('tr');
            row.id = `contact_row_${index}`;
            row.innerHTML = `
                   <td>
                        <input type="text" class="form-control" name="contact_label[]" placeholder="Contact Label">
                    </td>
                    <td>
                        <input type="text" class="form-control" name="contact_number[]" placeholder="Contact Number">
                    </td>
                    <td>
                        <button type="button" class="btn btn-danger" onclick="removeWidgetRow('contact_row_${index}')">Remove</button>
                    </td>
                `;
            tableBody.appendChild(row);
        }
    </script>
@endsection
