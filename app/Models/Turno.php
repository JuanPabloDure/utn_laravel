<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Turno
 *
 * @property $idTurno
 * @property $descripcion
 * @property $rangoHorario
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Turno extends Model
{
    
    protected $perPage = 20;
    protected $primaryKey = 'idTurno';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['idTurno', 'descripcion', 'rangoHorario'];


}
