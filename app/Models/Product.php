<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = "products";
    protected $fillable = [
        'name',
        'category_id',
        'color_id',
        'size_id',
        'brand_id',
        'feature_id',
    ];
}
