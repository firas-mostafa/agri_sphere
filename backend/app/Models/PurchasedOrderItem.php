<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class PurchasedOrderItem extends Model
{
    use HasFactory;

    protected $primaryKey = 'purchased_order_item_id';

    protected $fillable = [
        'purchased_order_id',
        'purchased_product_id',
        'name',
        'quantity',
        'price',
        'price_per_unit',
    ];

    public function purchasedOrder() : BelongsTo
    {//                                                 foreign key           local key
        return $this->belongsTo(purchasedOrder::class, 'purchased_order_id', 'purchased_order_id');
    }

    public function purchasedProduct() : BelongsTo
    {//                                                   foreign key             local key
        return $this->belongsTo(PurchasedProduct::class, 'purchased_product_id', 'purchased_product_id');
    }
}
