<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Comisione
 *
 * @property $id
 * @property $name
 * @property $codigo
 * @property $tipo
 * @property $created_at
 * @property $updated_at
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Comisione extends Model
{
    
    protected $perPage = 20;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['name', 'codigo', 'tipo'];


}
