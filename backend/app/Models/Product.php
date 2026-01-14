<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

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

    public function productReviews() : HasMany
    {//                                      foreign key    local key
        return $this->hasMany(Review::class, 'product_id', 'product_id');
    }

    public function relatedProducts() : HasMany
    {//                                                 foreign key    local key
        return $this->hasMany(ManagementUserProduct::class, 'product_id', 'product_id');
    }

    public function productImages() : HasMany
    {//                                             foreign key         local key
        return $this->hasMany(ProductImage::class, 'product_id', 'product_id');
    }

    public function purchasedProduct() : HasOne
    {//                                                foreign key             local key
        return $this->hasOne(PurchasedProduct::class, 'purchased_product_id', 'product_id');
    }

    public function rentalProduct() : HasOne
    {//                                             foreign key          local key
        return $this->hasOne(RentalProduct::class, 'rental_product_id', 'product_id');
    }
}
