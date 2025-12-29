<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

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
}
