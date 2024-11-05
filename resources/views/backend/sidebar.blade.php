<!-- Left Menu Start -->
<ul class="metismenu list-unstyled" id="side-menu">
    <li><a href="{{ url('/home') }}"><i class="feather-home"></i><span>Dashboard</span></a></li>

    <hr style="border-color: #c8c8c836; margin-top: 12px; margin-bottom: 5px;">
    <li class="menu-title" style="color: khaki; text-shadow: 1px 1px 2px black;">Website Config</li>
    <li><a href="{{ url('/general/info') }}"><i class="feather-grid"></i><span>General Info</span></a></li>
    <li><a href="{{ url('/website/theme/page') }}"><i class="mdi mdi-format-color-fill"
                style="font-size: 18px"></i><span>Website Theme Color</span></a></li>
    <li><a href="{{ url('/social/media/page') }}"><i class="mdi mdi-link-variant"
                style="font-size: 17px"></i><span>Social Media Links</span></a></li>
    <li><a href="{{ url('/seo/homepage') }}"><i class="dripicons-search"></i><span>Home Page SEO</span></a></li>
    <li><a href="{{ url('/custom/css/js') }}"><i class="feather-code"></i><span>Custom CSS & JS</span></a></li>
    <li><a href="{{ url('/social/chat/script/page') }}"><i class="mdi mdi-code-brackets"></i><span>Social & Chat Scripts</span></a></li>


    @if(env('BUYSELL_Module') == true)
    <hr style="border-color: #c8c8c836; margin-top: 12px; margin-bottom: 12px;">
    <li class="menu-title" style="color: khaki; text-shadow: 1px 1px 2px black;">BuySell Modules</li>
    <li><a href="{{ url('/buy/sell/config') }}"><i class="fas fa-business-time"></i><span>Buy Sell Config</span></a></li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="fas fa-columns"></i><span>Buy Sell Categories</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/create/buy/sell/category') }}">Create New</a></li>
            <li><a href="{{ url('/view/buy/sell/categories') }}">View All Categories</a></li>
        </ul>
    </li>
    <li><a href="{{ url('/buy/sell/listing') }}"><i class="fas fa-list"></i><span>Buy Sell Listing</span></a></li>
    @endif


    @if(env('MultiVendor') == true)
    <hr style="border-color: #c8c8c836; margin-top: 12px; margin-bottom: 12px;">
    <li class="menu-title" style="color: khaki; text-shadow: 1px 1px 2px black;">Multivendor Modules</li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="feather-user-check"></i><span>Vendors</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/create/new/vendor') }}">Create New Vendor</a></li>
            @php
                $totalVendorRequests = DB::table('vendors')
                        ->leftJoin('users', 'vendors.user_id', '=', 'users.id')
                        ->select('vendors.*', 'users.name', 'users.email', 'users.phone', 'users.status')
                        ->where('users.status', 0)
                        ->orderBy('vendors.id', 'desc')
                        ->count();
            @endphp
            <li><a href="{{ url('/view/vendor/requests') }}">Vendor Requests <span style="color:lightgreen">({{$totalVendorRequests}})</span></a></li>
            <li><a href="{{ url('/view/all/vendors') }}">Approved Vendors</a></li>
            <li><a href="{{ url('/view/inactive/vendors') }}">Inactive Vendors</a></li>
        </ul>
    </li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="dripicons-store"></i><span>Stores</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/create/new/store') }}">Create New Store</a></li>
            <li><a href="{{ url('/view/all/stores') }}">View All Stores</a></li>
        </ul>
    </li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="feather-dollar-sign"></i><span>Withdrawal</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{url('view/all/withdraws')}}">All Withdrawals</a></li>
            <li><a href="{{url('create/new/withdraw')}}">Create Withdrawal</a></li>
            <li><a href="{{url('view/withdraw/requests')}}">Withdraw Requests <span style="color:lightgreen">({{DB::table('withdraws')->where('status', 0)->count()}})</span></a></li>
            <li><a href="{{url('view/completed/withdraws')}}">Completed Withdrawals</a></li>
            <li><a href="{{url('view/cancelled/withdraws')}}">Cancelled Withdrawals</a></li>
        </ul>
    </li>
    @endif


    <hr style="border-color: #c8c8c836; margin-top: 12px; margin-bottom: 12px;">
    <li class="menu-title" style="color: khaki; text-shadow: 1px 1px 2px black;">E-commerce Modules</li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="feather-settings"></i><span>Config</span></a>
        <ul class="sub-menu" aria-expanded="false">

            <li><a href="{{ url('/config/setup') }}">Setup Your Config</a></li>

            {{-- Fshion Insdustry --}}
            @if(DB::table('config_setups')->where('code', 'product_size')->where('status', 1)->first())
            <li><a href="{{ url('/view/all/sizes') }}">Product Sizes</a></li>
            @endif

            {{-- tech industry --}}
            @if(DB::table('config_setups')->where('code', 'storage')->where('status', 1)->first())
            <li><a href="{{ url('/view/all/storages') }}">Storage</a></li>
            @endif
            @if(DB::table('config_setups')->where('code', 'sim')->where('status', 1)->first())
            <li><a href="{{ url('/view/all/sims') }}">SIM Type</a></li>
            @endif
            @if(DB::table('config_setups')->where('code', 'device_condition')->where('status', 1)->first())
            <li><a href="{{ url('/view/all/device/conditions') }}">Device Condition</a></li>
            @endif
            @if(DB::table('config_setups')->where('code', 'product_warranty')->where('status', 1)->first())
            <li><a href="{{ url('/view/all/warrenties') }}">Product Warrenty</a></li>
            @endif

            {{-- common --}}
            @if(DB::table('config_setups')->where('code', 'color')->where('status', 1)->first())
            <li><a href="{{ url('/view/all/colors') }}">Product Colors</a></li>
            @endif

            <li><a href="{{ url('/view/all/units') }}">Measurement Units</a></li>


            <li><a href="{{ url('/view/all/brands') }}">Product Brands</a></li>
            <li><a href="{{ url('/view/all/models') }}">Models of Brand</a></li>
            <li><a href="{{ url('/view/all/flags') }}">Product Flags</a></li>

        </ul>
    </li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="feather-sliders"></i><span>Category</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/add/new/category') }}">Add New Category</a></li>
            <li><a href="{{ url('/view/all/category') }}">View All Categories</a></li>
        </ul>
    </li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="feather-command"></i><span>Subcategory</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/add/new/subcategory') }}">Add New Subcategory</a></li>
            <li><a href="{{ url('/view/all/subcategory') }}">View All Subcategories</a></li>
        </ul>
    </li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="feather-git-pull-request"></i><span>Child
                Category</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/add/new/childcategory') }}">Add Child Category</a></li>
            <li><a href="{{ url('/view/all/childcategory') }}">View Child Categories</a></li>
        </ul>
    </li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="feather-box"></i><span>Manage Products</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/add/new/product') }}">Add New Product</a></li>
            <li>
                <a href="{{ url('/view/all/product') }}">
                    View All Products
                    <span style="color:lightgreen" title="Total Products">
                        ({{DB::table('products')->count()}})
                    </span>
                </a>
            </li>
            <li><a href="{{ url('/products/from/excel') }}">Bulk Upload <sup class="text-warning">New</sup></a></li>
            <li>
                <a href="{{ url('/view/product/reviews') }}">
                    Products's Review
                    <span style="color:goldenrod" title="Indicate Pending Review">
                        (@php
                            echo DB::table('product_reviews')
                                ->where('status', 0)
                                ->count();
                        @endphp)
                    </span>
                </a>
            </li>
            <li>
                <a href="{{ url('/view/product/question/answer') }}">
                    Product Ques/Ans
                    <span style="color:goldenrod" title="Indicate Unanswered Questions">
                        (@php
                            echo DB::table('product_question_answers')
                                ->whereNull('answer')
                                ->orWhere('answer', '=', '')
                                ->count();
                        @endphp)
                    </span>
                </a>
            </li>
        </ul>
    </li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="feather-shopping-cart"></i><span>Manage Orders</span></a>
        <ul class="sub-menu" aria-expanded="false">
            @if(env('POS') == true && env('POS_KEY') == "GenericCommerceV1-SBW7583837NUDD82")
            <li><a style="color: white !important;" href="{{ url('/create/new/order') }}">Create Order</a>
            @endif
            <li>
                <a style="color: white !important;" href="{{ url('/view/orders') }}">
                    All Orders ({{DB::table('orders')->count()}})
                </a>
            </li>
            <li @if(request()->query('status') == 'pending') class="mm-active" @endif>
                <a @if(request()->query('status') == 'pending') class="active" @endif style="color: skyblue !important;" href="{{ url('/view/orders') }}?status=pending">
                    Pending Orders ({{DB::table('orders')->where('order_status', 0)->count()}})
                </a>
            </li>
            <li @if(request()->query('status') == 'approved') class="mm-active" @endif>
                <a @if(request()->query('status') == 'approved') class="active" @endif style="color: wheat !important;" href="{{ url('/view/orders') }}?status=approved">
                    Approved Orders ({{DB::table('orders')->where('order_status', 1)->count()}})
                </a>
            </li>
            <li @if(request()->query('status') == 'intransit') class="mm-active" @endif>
                <a @if(request()->query('status') == 'intransit') class="active" @endif style="color: lightgreen !important;" href="{{ url('/view/orders') }}?status=intransit">
                    InTransit Orders ({{DB::table('orders')->where('order_status', 2)->count()}})
                </a>
            </li>
            <li @if(request()->query('status') == 'delivered') class="mm-active" @endif>
                <a @if(request()->query('status') == 'delivered') class="active" @endif style="color: #0c0 !important;" href="{{ url('/view/orders') }}?status=delivered">
                    Delivered Orders ({{DB::table('orders')->where('order_status', 3)->count()}})
                </a>
            </li>
            <li @if(request()->query('status') == 'cancelled') class="mm-active" @endif>
                <a @if(request()->query('status') == 'cancelled') class="active" @endif style="color: red !important;" href="{{ url('/view/orders') }}?status=cancelled">
                    Cancelled Orders ({{DB::table('orders')->where('order_status', 4)->count()}})
                </a>
            </li>
        </ul>
    </li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="feather-gift"></i><span>Promo Codes</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/add/new/code') }}">Add New Promo Code</a></li>
            <li><a href="{{ url('/view/all/promo/codes') }}">View All Promo Codes</a></li>
        </ul>
    </li>

    {{-- <li><a href="{{ url('/file-manager') }}"><i class="fas fa-folder-open"></i><span>File Manager</span></a></li> --}}
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="feather-bell"></i><span>Push Notification</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/send/notification/page') }}">Send Notification</a></li>
            <li><a href="{{ url('/view/all/notifications') }}">Prevoious Notifications</a></li>
        </ul>
    </li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="fas fa-sms"></i><span>SMS Service</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/view/sms/templates') }}">SMS Templates</a></li>
            <li><a href="{{ url('/send/sms/page') }}">Send SMS</a></li>
            <li><a href="{{ url('/view/sms/history') }}">SMS History</a></li>
        </ul>
    </li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="feather-settings"></i><span>Gateway & API</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/view/email/credential') }}">Email Configure (SMTP)</a></li>
            <li><a href="{{ url('/view/email/templates') }}">Email Templates</a></li>
            <li><a href="{{ url('/setup/sms/gateways') }}">SMS Gateway</a></li>
            <li><a href="{{ url('/setup/payment/gateways') }}">Payment Gateway</a></li>
        </ul>
    </li>

    <li><a href="{{ url('/view/all/customers') }}"><i class="feather-users"></i><span>Customers</span></a></li>
    <li><a href="{{ url('/view/customers/wishlist') }}"><i class="feather-heart"></i><span>Customer's Wishlist</span></a></li>
    <li><a href="{{ url('/view/delivery/charges') }}"><i class="feather-truck"></i><span>Delivery Charges</span></a></li>
    <li><a href="{{ url('/view/upazila/thana') }}"><i class="dripicons-location"></i><span>Upazila & Thana</span></a></li>
    <li><a href="{{ url('/view/payment/history') }}"><i class="feather-dollar-sign"></i><span>Payment History</span></a></li>

    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="feather-printer"></i><span>Generate Report</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/sales/report') }}">Sales Report</a></li>
        </ul>
    </li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="feather-download-cloud"></i><span>Download
                Backup</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/download/database/backup') }}">Database Backup</a></li>
            <li><a href="{{ url('/download/product/files/backup') }}">Product Images Backup</a></li>
            <li><a href="{{ url('/download/user/files/backup') }}">User Images Backup</a></li>
            <li><a href="{{ url('/download/banner/files/backup') }}">Banner Images Backup</a></li>
            <li><a href="{{ url('/download/category/files/backup') }}">Category Icon Backup</a></li>
            <li><a href="{{ url('/download/subcategory/files/backup') }}">Subcategory Backup</a></li>
            <li><a href="{{ url('/download/flag/files/backup') }}">Flag Icon Backup</a></li>
            <li><a href="{{ url('/download/ticket/files/backup') }}">Ticket Files Backup</a></li>
            <li><a href="{{ url('/download/blog/files/backup') }}">Blog Files Backup</a></li>
            <li><a href="{{ url('/download/other/files/backup') }}">Other Images Backup</a></li>
        </ul>
    </li>

    <hr style="border-color: #c8c8c836; margin-top: 12px; margin-bottom: 12px;">
    <li class="menu-title" style="color: khaki; text-shadow: 1px 1px 2px black;">CRM Modules</li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="fas fa-headset"></i><span>Support
                Ticket</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a style="color: skyblue !important;" href="{{ url('/pending/support/tickets') }}">Pending Supports
                    (@php
                        echo DB::table('support_tickets')
                            ->where('status', 0)
                            ->orWhere('status', 1)
                            ->count();
                    @endphp)</a></li>
            <li><a style="color: #0c0 !important;" href="{{ url('/solved/support/tickets') }}">Solved Supports
                    (@php
                        echo DB::table('support_tickets')
                            ->where('status', 2)
                            ->count();
                    @endphp)</a></li>
            <li><a style="color: goldenrod !important;" href="{{ url('/on/hold/support/tickets') }}">On Hold Supports
                    (@php
                        echo DB::table('support_tickets')
                            ->where('status', 4)
                            ->count();
                    @endphp)</a></li>
            <li><a style="color: red !important;" href="{{ url('/rejected/support/tickets') }}">Rejected Supports
                    (@php
                        echo DB::table('support_tickets')
                            ->where('status', 3)
                            ->count();
                    @endphp)</a></li>
        </ul>
    </li>
    <li><a href="{{ url('/view/all/contact/requests') }}"><i class="feather-phone-forwarded"></i><span>Contact Request</span></a></li>
    <li><a href="{{ url('/view/all/subscribed/users') }}"><i class="feather-user-check"></i><span>Subscribed Users</span></a></li>


    <hr style="border-color: #c8c8c836; margin-top: 12px; margin-bottom: 12px;">
    <li class="menu-title" style="color: khaki; text-shadow: 1px 1px 2px black;">Content Management</li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="feather-image"></i><span>Sliders & Banners</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/view/all/sliders') }}">View All Sliders</a></li>
            <li><a href="{{ url('/view/all/banners') }}">View All Banners</a></li>
            <li><a href="{{ url('/view/promotional/banner') }}">Promotional Banner</a></li>
        </ul>
    </li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="feather-message-square"></i><span>Testimonials</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/add/testimonial') }}">Add New Testimonial</a></li>
            <li><a href="{{ url('/view/testimonials') }}">View All Testimonials</a></li>
        </ul>
    </li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="feather-file-text"></i><span>Manage Blogs</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/blog/categories') }}">Blog Categories</a></li>
            <li><a href="{{ url('/add/new/blog') }}">Write a Blog</a></li>
            <li><a href="{{ url('/view/all/blogs') }}">View All Blogs</a></li>
        </ul>
    </li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="feather-alert-triangle"></i><span>Terms & Policies</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/terms/and/condition') }}">Terms & Condition</a></li>
            <li><a href="{{ url('/view/privacy/policy') }}">Privacy Policy</a></li>
            <li><a href="{{ url('/view/shipping/policy') }}">Shipping Policy</a></li>
            <li><a href="{{ url('/view/return/policy') }}">Return Policy</a></li>
        </ul>
    </li>
    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="feather-file-plus"></i><span>Custom Pages</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/create/new/page') }}">Create New Page</a></li>
            <li><a href="{{ url('/view/all/pages') }}">View All Pages</a></li>
        </ul>
    </li>
    <li><a href="{{ url('/about/us/page') }}"><i class="feather-globe"></i><span>About Us</span></a></li>
    <li><a href="{{ url('/view/all/faqs') }}"><i class="far fa-question-circle"></i><span>FAQ's</span></a></li>


    <hr style="border-color: #c8c8c836; margin-top: 12px; margin-bottom: 5px;">
    <li class="menu-title" style="color: khaki; text-shadow: 1px 1px 2px black;">User Role Permission</li>
    <li><a href="{{ url('/view/system/users') }}"><i class="fas fa-user-shield"></i><span>System Users</span></a></li>
    <li><a href="{{ url('/view/permission/routes') }}"><i class="feather-git-merge"></i><span>Permission Routes</span></a></li>
    <li><a href="{{ url('/view/user/roles') }}"><i class="feather-user-plus"></i><span>User Roles</span></a></li>
    <li><a href="{{ url('/view/user/role/permission') }}"><i class="mdi mdi-security"></i><span>Assign Role Permission</span></a></li>
    <hr style="border-color: #c8c8c836; margin-top: 12px; margin-bottom: 12px;">

    <li>
        <a href="javascript: void(0);" class="has-arrow"><i class="feather-box"></i><span>Demo Products</span></a>
        <ul class="sub-menu" aria-expanded="false">
            <li><a href="{{ url('/generate/demo/products') }}">Generate Products</a></li>
            <li><a href="{{ url('/remove/demo/products/page') }}">Remove Products</a></li>
        </ul>
    </li>
    <li><a href="{{ url('/clear/cache') }}"><i class="feather-rotate-cw"></i><span>Clear Cache</span></a></li>
    <li><a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();"><i class="feather-log-out"></i><span>Logout</span></a></li>

</ul>
