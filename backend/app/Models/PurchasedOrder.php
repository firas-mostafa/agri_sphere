<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

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

    public function purchasedOrderItems() : HasMany
    {//                                                   foreign key           local key
        return $this->hasMany(PurchasedOrderItem::class, 'purchased_order_id', 'purchased_order_id');
    }

    public function order() : BelongsTo
    {//                                       foreign key   local key
        return $this->belongsTo(Order::class, 'order_id', 'purchased_order_id');
    }

    public function shippingAddress() : BelongsTo
    {//                                          foreign key           local key
        return $this->belongsTo(Address::class, 'shipping_address_id', 'address_id');
    }

    public function billingAddress() : BelongsTo
    {//                                          foreign key           local key
        return $this->belongsTo(Address::class, 'billing_address_id', 'address_id');
    }
}
