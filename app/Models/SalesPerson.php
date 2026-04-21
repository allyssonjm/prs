<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property string $name
 * @property string $nickname
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Saleperson newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Saleperson newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Saleperson query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Saleperson whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Saleperson whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Saleperson whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Saleperson whereNickname($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Saleperson whereUpdatedAt($value)
 * @mixin \Eloquent
 */
class SalesPerson extends Model
{
    protected $table = "salespeople";
    protected $fillable = [
        'name',
        'nickname',
        'email',
        'avatar'
    ];
}
