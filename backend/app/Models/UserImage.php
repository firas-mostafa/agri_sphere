<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class UserImage extends Model
{
    use HasFactory;

    protected $primaryKey = "user_image_id";

    protected $fillable = [
        'user_id',
        'image',
    ];

    public function getImageUrlAttribute()
    {
        if ( $this->image == "" ) {
            return "";
        }

        return asset("/uploads/products/small/".$this->image);
    }

    public function user() : BelongsTo
    {//                                     foreign key  local key
        return $this->belongsTo(User::class, 'user_id', 'user_id');
    }
}
