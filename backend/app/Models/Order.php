<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $primaryKey = 'order_id';

    protected $fillable = [
        'user_id',
        'order_type',
        'order_date',
        'discount_amount',
        'canelled_at',
        'cancellation_reason',
    ];

    protected $dates = [
        'order_date',
        'canelled_at',
    ];
}
