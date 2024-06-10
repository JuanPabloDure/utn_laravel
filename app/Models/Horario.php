<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Horario
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
class Horario extends Model
{
    
    protected $perPage = 20;
    protected $primaryKey = 'idHorario';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['rangoHorario', 'horarioInicio', 'horarioFin', 'hora'];


}
