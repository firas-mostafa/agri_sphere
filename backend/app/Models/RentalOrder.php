<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

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

    public function rentalOrderInsurances() : HasMany
    {//                                                foreign key        local key
        return $this->hasMany(RentalInsurance::class, 'rental_order_id', 'rental_order_id');
    }

    public function order() : BelongsTo
    {//                                       foreign key  local key
        return $this->belongsTo(Order::class, 'order_id', 'rental_order_id');
    }

    public function rentalProduct() : BelongsTo
    {//                                                foreign key         local key
        return $this->belongsTo(RentalProduct::class, 'rental_product_id', 'rental_product_id');
    }

    public function pickupAddress() : BelongsTo
    {//                                          foreign key           local key
        return $this->belongsTo(Address::class, 'pickup_location_id', 'address_id');
    }

    public function dropoffAddress() : BelongsTo
    {//                                          foreign key            local key
        return $this->belongsTo(Address::class, 'dropoff_location_id', 'address_id');
    }
}
