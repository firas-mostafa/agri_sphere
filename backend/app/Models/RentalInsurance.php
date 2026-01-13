<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class RentalInsurance extends Model
{
    use HasFactory;

    protected $primaryKey = 'rental_insurance_id';

    protected $fillable = [
        'rental_order_id',
        'daily_rate_applied',
        'number_of_days',
        'total_cost',
    ];

    public function rentalOrder() : BelongsTo
    {
        return $this->belongsTo(RentalOrder::class, 'rental_order_id', 'rental_order_id');
    }
}
