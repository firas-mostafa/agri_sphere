<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PurchasedOrder extends Model
{
    use HasFactory;

    protected $primaryKey = 'purchased_order_id';

    protected $fillable = [
        'purchased_order_id',
        'shipping_address_id',
        'billing_address_id',
        'order_type',
        'subtotal',
        'grand_total',
        'order_status',
        'required_date',
        'shipped_date',
        'shipping_fee',
    ];
}
