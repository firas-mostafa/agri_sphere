<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Review extends Model
{
    use HasFactory;

    protected $primaryKey = 'review_id';

    protected $fillable = [
        'user_id',
        'product_id',
        'rating',
        'comment',
        'is_verified_purchase',
    ];

    public function user() : BelongsTo
    {//                                      foregin key  local key
        return $this->belongsTo(User::class, 'user_id', 'user_id');
    }

    public function product() :BelongsTo
    {//                                         foregin key   local key
        return $this->belongsTo(Product::class, 'product_id', 'product_id');
    }
}
