<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class PurchasedProduct extends Model
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

    public function purchasedItems() : HasMany
    {//                                                   foreign key             local key
        return $this->hasMany(PurchasedOrderItem::class, 'purchased_product_id', 'purchased_product_id');
    }

    public function product() : BelongsTo
    {//                                          foreign key             local key
        return $this->belongsTo(Product::class, 'purchased_product_id', 'product_id');
    }
}
