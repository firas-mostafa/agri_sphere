<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ManagementProduct extends Model
{
    use HasFactory;

    protected $primaryKey = 'management_product_id';

    protected $fillable = [
        'user_id',
        'product_id',
    ];
}
