<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderPayment extends Model
{
    use HasFactory;

    public static function getOrderPaymentsWithTotal($orderId, $column = 'amount')
    {
        if (!in_array($column, ['amount', 'store_amount'])) {
            $column = 'amount';
        }

        $payments = self::where('order_id', $orderId)->get();
        $total = $payments->sum($column);

        return [
            'payments' => $payments,
            'total' => $total
        ];
    }
}
