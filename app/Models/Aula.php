<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Aula
 *
 * @property $id
 * @property $name
 * @property $codigo
 * @property $direccion
 * @property $created_at
 * @property $updated_at
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Aula extends Model
{
    
    protected $perPage = 20;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['name', 'codigo', 'direccion', 'activo'];


}
