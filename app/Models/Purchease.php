<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Model;

class Purchease extends Model
{
    protected $table = "purchease";
    protected $fillable = [
        'client_id',
        'saleperson_id',
        'product_id',
        'dt_purchase'
    ];

    public function dtPurchase(): Attribute
    {
        return new Attribute(
            get: fn (?string $value): ?string => $value ? (new Carbon($value))->format('d/m/Y') : null,
            set: fn (?string $value) => $value ?
            preg_replace("/^(\d{2})\/(\d{2})\/(\d{4})/", '$3-$2-$1 00:00:00', $value) : null
        );
    }
}
