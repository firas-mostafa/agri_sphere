<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ProductImage extends Model
{
    use HasFactory;

    protected $primaryKey = 'product_image_id';

    protected $fillable = [
        'product_id',
        'image',
    ];

    protected $appends = ['image_url'];

    public function getImageUrlAttribute()
    {
        if ( $this->image == "" ) {
            return "";
        }

        return asset("/uploads/products/small/".$this->image);
    }

    public function product() : BelongsTo
    {//                                         foreign key    local key         
        return $this->belongsTo(Product::class, 'product_id', 'product_id');
    }
}
