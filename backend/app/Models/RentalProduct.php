<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class RentalProduct extends Model
{
    use HasFactory;

    protected $primaryKey = 'rental_product_id';

    protected $fillable = [
        'rental_product_id',
        'product_type',
        'hourly_rate',
        'daily_base_rate',
        'weekly_base_rate',
        'monthly_base_rate',
        'rent_product_status',
    ];

    public function rentalOrders() : HasMany
    {//                                            foreign key          local key
        return $this->hasMany(RentalOrder::class, 'rental_product_id', 'rental_product_id');
    }

    public function product() : BelongsTo
    {//                                          foreign key         local key
        return $this->belongsTo(Product::class, 'rental_product_id', 'product_id');
    }
}
