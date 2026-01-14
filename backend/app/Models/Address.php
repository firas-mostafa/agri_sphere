<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Address extends Model
{
    use HasFactory;

    protected $primaryKey = 'address_id';

    protected $fillable = [
        'user_id',
        'address_line_1',
        'address_line_2',
        'city',
        'state',
        'postal_code',
        'country',
        'address_type',
    ];

    public function user() : BelongsTo
    {//                                     foreign key  local key
        return $this->belongsTo(User::class, 'user_id', 'user_id');
    }

    public function shippingPurchasedOrders() : HasMany
    {//                                               foreign key             local key
        return $this->hasMany(PurchasedOrder::class, 'shipping_address_id', 'address_id');
    }

    public function billingPurchasedOrders() : HasMany
    {//                                              foreign key            local key
        return $this->hasMany(PurchasedOrder::class, 'billing_address_id', 'address_id');
    }

    public function pickupLocationRentalOrders() : HasMany
    {//                                            foreign key           local key
        return $this->hasMany(RentalOrder::class, 'pickup_location_id', 'address_id');
    }

    public function dropoffLocationRentalOrders() : HasMany
    {//                                            foreign key           local key
        return $this->hasMany(RentalOrder::class, 'dropoff_location_id', 'address_id');
    }
}