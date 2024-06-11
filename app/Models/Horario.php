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
    
    protected $perPage = 50;
    protected $primaryKey = 'idHorario';
    public $timestamps = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['rangoHorario', 'horarioInicio', 'horarioFin', 'hora', 'idTurno'];

    public function turno()
        {
            return $this->hasOne(Turno::class,'idTurno','idTurno');
        }

    public function turnoView()
        {
            return $this->hasOne(Turno::class,'idTurno','idTurno');
        }


}
