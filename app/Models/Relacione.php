<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Relacione
 *
 * @property $id
 * @property $nombre
 * @property $desde
 * @property $hasta
 * @property $created_at
 * @property $updated_at
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Relacione extends Model
{
    
    protected $perPage = 20;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['nombre', 'desde', 'hasta'];


}
