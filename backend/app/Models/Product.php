<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $primaryKey = 'product_id';

    protected $fillable = [
        'category_id',
        'brand_id',
        'product_type',
        'name',
        'description',
        'short_description',
        'image',
        'barcode',
        'sku',
        'stock_quantity',
        'average_rating',
        'total_reviews',
    ];

    protected $appends = ['image_url'];

    public function getImageUrlAttribute()
    {
        if ( $this->image == "" ) {
            return "";
        }

        return asset('/uploads/products/small/'.$this->image);
    }

    public function product_images()
    {
        return $this->hasMany(ProductImage::class);
    }
}
