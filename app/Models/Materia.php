<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Materia
 *
 * @property $idMateria
 * @property $idArea
 * @property $nombre
 * @property $anio
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Materia extends Model
{
    
    protected $perPage = 20;
    protected $primaryKey = 'idMateria';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['idMateria', 'idArea', 'nombre', 'anio'];


}
