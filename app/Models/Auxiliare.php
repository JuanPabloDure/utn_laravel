<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Auxiliare
 *
 * @property $id
 * @property $Descripcion
 * @property $codigo
 * @property $created_at
 * @property $updated_at
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Auxiliare extends Model
{
    
    protected $perPage = 20;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['Descripcion', 'codigo'];


}
