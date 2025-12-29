<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RentalOrder extends Model
{
    use HasFactory;

    protected $primaryKey = 'rental_order_id';

    protected $fillable = [
        'rental_order_id',
        'rental_product_id',
        'pickup_location_id',
        'dropoff_location_id',
        'order_type',
        'actual_pickup_date',
        'actual_dropoff_date',
        'rental_status',
        'pick_status',
        'dropoff_status',
        'base_rental_amount',
        'tax_amount',
        'insurance_total',
        'total_amount',
        'refund_amount',
    ];
}
