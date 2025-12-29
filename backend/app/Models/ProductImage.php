<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductImage extends Model
{
    use HasFactory;

    protected $primaryKey = 'product_image_id';

    protected $fillable = [
        'product_id',
        'image',
    ];

    public function getImageUrlAttribute()
    {
        if ( $this->image == "" ) {
            return "";
        }

        return asset("/uploads/products/small/".$this->image);
    }
}
