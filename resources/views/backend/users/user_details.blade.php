@extends('backend.master')

@section('title')
    User Details
@endsection

@section('content')
<div class="content-page" style="padding: 15px 10px;>
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box">
                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">Dashboard</a></li>
                                <li class="breadcrumb-item"><a href="{{ url('/view/customers') }}">Customers</a></li>
                                <li class="breadcrumb-item active">User Details</li>
                            </ol>
                        </div>
                        <h4 class="page-title">User Details</h4>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-body">
                    <div id="print_area">
                        <div class="invoice-title">
                            <h4 class="float-right font-size-16">Customer Information</h4>
                            <div class="mb-4">
                                <h3 class="font-size-16">
                                    <strong>User: </strong> {{ $user->name }}
                                </h3>
                            </div>
                        </div>
                        <hr>

                        <!-- User Details Section -->
                        <div class="row mb-4">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body p-3">
                                        <div class="row">
                                            <div class="col-md-3 text-center">
                                                <h4 class="mb-0">{{ $user->name }}</h4>
                                                <p class="text-muted mb-0">Customer Name</p>
                                            </div>
                                            
                                            <div class="col-md-3 text-center">
                                                <h4 class="mb-0">{{ $user->phone }}</h4>
                                                <p class="text-muted mb-0">Mobile</p>
                                            </div>
                                            
                                            <div class="col-md-3 text-center">
                                                <h4 class="mb-0">{{ $user->email }}</h4>
                                                <p class="text-muted mb-0">Email</p>
                                            </div>
                                            
                                            <div class="col-md-3 text-center">
                                                <h4 class="mb-0">{{ date('d M, Y', strtotime($user->created_at)) }}</h4>
                                                <p class="text-muted mb-0">Member Since</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Orders Section -->
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-2">
                                    <h5 class="font-size-15">Invoices:</h5>
                                </div>

                                <div class="py-2">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover mb-0">
                                            <thead class="thead-light">
                                            <tr>
                                                <th>#</th>
                                                <th>Invoice</th>
                                                <th>Date</th>
                                                <th>Name</th>
                                                <th>Mobile</th>
                                                <th>Email</th>
                                                <th class="text-right">Total</th>
                                                <th class="text-right">VAT</th>
                                                <th>Print</th>
                                                <th>Order Date</th>
                                                <th>Status</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @php $i=1; @endphp
                                            @forelse($orders as $order)
                                            <tr>
                                                <td>{{ $i }}</td>
                                                <td>{{ $order->order_no }}</td>
                                                <td>{{ date('d M Y', strtotime($order->order_date)) }}</td>
                                                <td>{{ $user->name }}</td>
                                                <td>{{ $user->phone }}</td>
                                                <td>{{ $user->email }}</td>
                                                <td class="text-right">৳{{ number_format($order->total, 2) }}</td>
                                                <td class="text-right">৳{{ number_format($order->tax ?? 0, 2) }}</td>
                                                <td>
                                                    <a href="{{ url('print/invoice/'.$order->id) }}" target="_blank" class="btn btn-sm btn-primary waves-effect waves-light">
                                                        <i class="fa fa-print"></i>
                                                    </a>
                                                </td>
                                                <td>{{ date('d M Y', strtotime($order->order_date)) }}</td>
                                                <td>
                                                    @php
                                                        $statusLabels = [
                                                            0 => '<span class="badge badge-warning">Pending</span>',
                                                            1 => '<span class="badge badge-info">Approved</span>',
                                                            2 => '<span class="badge badge-primary">Intransit</span>',
                                                            3 => '<span class="badge badge-success">Delivered</span>',
                                                            4 => '<span class="badge badge-danger">Cancel</span>'
                                                        ];
                                                    @endphp
                                                    {!! isset($statusLabels[$order->order_status]) ? $statusLabels[$order->order_status] : '<span class="badge badge-secondary">Unknown</span>' !!}
                                                </td>
                                            </tr>
                                            @php $i++; @endphp
                                            @empty
                                            <tr>
                                                <td colspan="11" class="text-center">No orders found for this customer.</td>
                                            </tr>
                                            @endforelse
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Addresses Section -->
                        <div class="row mt-4">
                            <div class="col-12">
                                <div class="mb-2">
                                    <h5 class="font-size-15">Addresses:</h5>
                                </div>

                                <div class="py-2">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover mb-0">
                                            <thead class="thead-light">
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>Type</th>
                                                <th>Address</th>
                                                <th>City/State</th>
                                                <th>Phone</th>
                                                <th>Action</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @php $i=1; @endphp
                                            @forelse($addresses as $address)
                                            <tr>
                                                <td>{{ $i }}</td>
                                                <td><strong>{{ $address->name }}</strong></td>
                                                <td>{{ ucfirst($address->address_type ?? 'Default') }}</td>
                                                <td>{{ $address->address }}</td>
                                                <td>{{ $address->city }}, {{ $address->state }}</td>
                                                <td>{{ $address->phone }}</td>
                                                <td>
                                                    <a href="{{ url('edit/address/'.$address->id) }}" class="btn btn-sm btn-info waves-effect waves-light">
                                                        <i class="fa fa-edit"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" onclick="deleteAddress({{ $address->id }})" class="btn btn-sm btn-danger waves-effect waves-light">
                                                        <i class="fa fa-trash"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            @php $i++; @endphp
                                            @empty
                                            <tr>
                                                <td colspan="7" class="text-center">No addresses found for this customer.</td>
                                            </tr>
                                            @endforelse
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Recent Views Section -->
                        <div class="row mt-4">
                            <div class="col-12">
                                <div class="mb-2">
                                    <h5 class="font-size-15">Recent Views:</h5>
                                </div>

                                <div class="row">
                                    @forelse($recentViews as $product)
                                    <div class="col-md-2 mb-3">
                                        <div class="card h-100">
                                            <div class="position-relative">
                                                @if($product->discount_price > 0)
                                                <span class="badge badge-success position-absolute" style="top: 10px; left: 10px;">Sale</span>
                                                @endif
                                                <img src="{{ url(env('ADMIN_URL') . '/' .($product->image ?? 'default.jpg')) }}" class="card-img-top" alt="{{ $product->name }}" style="height: 120px; object-fit: cover;">
                                            </div>
                                            <div class="card-body p-2">
                                                <h6 class="card-title mb-1" style="font-size: 0.9rem;">{{ Str::limit($product->name, 30) }}</h6>
                                                <p class="card-text mb-1">
                                                    @if($product->discount_price > 0)
                                                    <span class="text-danger">৳{{ number_format($product->discount_price, 2) }}</span>
                                                    <del class="text-muted small">৳{{ number_format($product->price, 2) }}</del>
                                                    @else
                                                    <span>৳{{ number_format($product->price, 2) }}</span>
                                                    @endif
                                                </p>
                                                <p class="card-text text-muted small mb-0">{{ date('d M Y', strtotime($product->viewed_at)) }}</p>
                                            </div>
                                        </div>
                                    </div>
                                    @empty
                                    <div class="col-12">
                                        <p class="text-center">No recently viewed products found.</p>
                                    </div>
                                    @endforelse
                                </div>
                            </div>
                        </div>

                        <!-- Cart Section -->
                        <div class="row mt-4">
                            <div class="col-12">
                                <div class="mb-2">
                                    <h5 class="font-size-15">Cart:</h5>
                                </div>

                                <div class="py-2">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover mb-0">
                                            <thead class="thead-light">
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th class="text-center">QTY</th>
                                                <th class="text-right">Rate</th>
                                                <th class="text-right">Total</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @php $i=1; @endphp
                                            @forelse($cartItems as $item)
                                            <tr>
                                                <td>{{ $i }}</td>
                                                <td><strong>{{ $item->name }}</strong></td>
                                                <td class="text-center">{{ $item->quantity }}</td>
                                                <td class="text-right">৳{{ number_format($item->discount_price > 0 ? $item->discount_price : $item->price, 2) }}</td>
                                                <td class="text-right">৳{{ number_format(($item->discount_price > 0 ? $item->discount_price : $item->price) * $item->quantity, 2) }}</td>
                                            </tr>
                                            @php $i++; @endphp
                                            @empty
                                            <tr>
                                                <td colspan="5" class="text-center">No items in cart.</td>
                                            </tr>
                                            @endforelse
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th colspan="4" class="text-right">Total:</th>
                                                    <th class="text-right">৳{{ number_format($cartTotal, 2) }}</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Purchased Products Section -->
                        <div class="row mt-4">
                            <div class="col-12">
                                <div class="mb-2">
                                    <h5 class="font-size-15">Purchased Products:</h5>
                                </div>

                                <div class="py-2">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover mb-0">
                                            <thead class="thead-light">
                                            <tr>
                                                <th>SKU</th>
                                                <th>Date</th>
                                                <th>Item</th>
                                                <th class="text-right">MRP</th>
                                                <th class="text-right">VAT MRP</th>
                                                <th class="text-center">QTY</th>
                                                <th class="text-right">SALE</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @forelse($purchasedProducts as $product)
                                            <tr>
                                                <td>{{ $product->product_code }}</td>
                                                <td>{{ date('Y-m-d H:i:s a', strtotime($product->order_date)) }}</td>
                                                <td><strong>{{ $product->product_name }}</strong></td>
                                                <td class="text-right">৳{{ number_format($product->product_price, 2) }}</td>
                                                <td class="text-right">৳{{ number_format($product->discount_price > 0 ? $product->discount_price : $product->product_price, 2) }}</td>
                                                <td class="text-center">{{ $product->quantity }}</td>
                                                <td class="text-right">৳{{ number_format($product->total_price, 2) }}</td>
                                            </tr>
                                            @empty
                                            <tr>
                                                <td colspan="7" class="text-center">No purchased products found.</td>
                                            </tr>
                                            @endforelse
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="d-print-none hidden-print mt-3">
                        <div class="float-right">
                            <a href="javascript:void(0);" class="btn btn-success waves-effect waves-light mr-1" onclick="printPageArea('print_area')">
                                <i class="fa fa-print"></i> Print
                            </a>
                            <a href="{{ url('/view/customers') }}" class="btn btn-secondary waves-effect waves-light">
                                <i class="fa fa-arrow-left"></i> Back
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section('scripts')
<script>
    function printPageArea(areaID){
        var printContent = document.getElementById(areaID).innerHTML;
        var originalContent = document.body.innerHTML;
        document.body.innerHTML = printContent;
        window.print();
        document.body.innerHTML = originalContent;
    }
    
    function deleteAddress(id) {
        if (confirm('Are you sure you want to delete this address?')) {
            $.ajax({
                url: "{{ url('delete/user/address') }}/" + id,
                type: "GET",
                success: function(response) {
                    if (response.success) {
                        toastr.success(response.success);
                        setTimeout(function() {
                            location.reload();
                        }, 1000);
                    }
                }
            });
        }
    }
</script>
@endsection