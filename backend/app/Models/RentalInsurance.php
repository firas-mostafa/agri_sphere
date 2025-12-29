<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

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
}
