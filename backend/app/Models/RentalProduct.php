<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RentalProduct extends Product
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
}
