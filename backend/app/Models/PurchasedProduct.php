<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PurchasedProduct extends Product
{
    use HasFactory;

    protected $primaryKey = 'purchased_product_id';

    protected $fillable = [
        'purchased_product_id',
        'product_type',
        'price',
        'compare_price',
        'is_active',
    ];
}
