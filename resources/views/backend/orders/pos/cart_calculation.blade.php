<tr>
    <td class="text-center">
        @php
            $total = 0;
            if (session('cart') && count(session('cart')) > 0) {
                foreach (session('cart') as $cartIndex => $details) {
                    $total = $total + $details['price'] * $details['quantity'];
                }
            }
        @endphp
        {{ $currencySymbol }} {{ number_format($total, 2) }}
        <input type="hidden" name="subtotal" id="subtotal" value="{{ $total }}">
    </td>
    <td class="text-center">{{ $currencySymbol }} 0</td>
    <td class="text-center">
        @php
            if (session('shipping_charge')) {
                $total = $total + session('shipping_charge');
            }
        @endphp
        {{ $currencySymbol }} <input type="text" class="text-center" style="width: 50px;"
            onkeyup="updateOrderTotalAmount()"
            @if (session('shipping_charge')) value="{{ session('shipping_charge') }}" @else value="0" @endif
            min="0" id="shipping_charge" name="shipping_charge" placeholder="1" required />
    </td>
    <td class="text-center">
        @php
            if (session('pos_discount')) {
                $total = $total - session('pos_discount');
            }
        @endphp
        {{ $currencySymbol }} <input type="text" class="text-center" style="width: 50px;"
            onkeyup="updateOrderTotalAmount()"
            @if (session('pos_discount')) value="{{ session('pos_discount') }}" @else value="0" @endif
            min="0" id="discount" name="discount" placeholder="1" required />
    </td>
    <th class="text-center" id="total_cart_calculation">{{ $currencySymbol }} {{ number_format($total, 2) }}</th>
</tr>
