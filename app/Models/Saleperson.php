<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Saleperson extends Model
{
    protected $table = "salespeople";
    protected $fillable = [
        'name',
        'nickname',
    ];
}
