<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Order extends Model
{
    use HasFactory;

    protected $primaryKey = 'order_id';

    protected $fillable = [
        'user_id',
        'order_type',
        'order_date',
        'discount_amount',
        'caneclled_at',
        'cancellation_reason',
    ];

    protected $dates = [
        'order_date',
        'canelled_at',
    ];

    protected function casts(): array
    {
        return [
            'created_at' => 'datetime:d M, Y',
        ];
    }

    public function payments() : HasMany
    {//                                       foreign key   local key
        return $this->hasMany(Payment::class, 'order_id', 'order_id');
    }

    public function purchasedOrder() : HasOne
    {//                                              foreign key          local key
        return $this->hasOne(PurchasedOrder::class, 'purchased_order_id', 'order_id');
    }

    public function rentalOrder() : HasOne
    {//                                           foreign key       local key
        return $this->hasOne(RentalOrder::class, 'rental_order_id', 'order_id');
    }

    public function user() : BelongsTo
    {//                                     foreign key  local key
        return $this->belongsTo(User::class, 'user_id', 'user_id');
    }
}
