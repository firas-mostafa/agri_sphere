<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Payment extends Model
{
    use HasFactory;

    protected $primaryKey = 'payment_id';

    protected $fillable = [
        'order_id',
        'payment_method',
        'payment_status',
        'amount',
        'transaction_id',
        'paid_at',
    ];

    public function order() : BelongsTo
    {//                                       foreign key  local key
        return $this->belongsTo(Order::class, 'order_id', 'order_id');
    }
}
