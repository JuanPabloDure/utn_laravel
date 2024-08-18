<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Evento
 *
 * @property $id
 * @property $aula_id
 * @property $idDocente
 * @property $idHorario
 * @property $nota
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Evento extends Model
{
    public $timestamps = false;
    protected $perPage = 20;

    protected static function boot()
    {
        parent::boot();

        // Define el orden por defecto
        static::addGlobalScope('order', function (\Illuminate\Database\Eloquent\Builder $builder) {
            $builder->orderBy('idHorario', 'asc'); // Cambia 'fecha_evento' por el nombre de tu columna y 'asc' por 'desc' si quieres orden descendente
        });
    }

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'aula_id', 
        'idDocente', 
        'idHorario', 
        'nota',
        'fecha',
        'tipo',
        'dia_semana',
        'idMateria'];

    public function AulaView()
    {
        return $this->hasOne(Aula::class,'id','aula_id');
    }
    public function DocenteView()
    {
        return $this->hasOne(Docente::class,'idDocente','idDocente');
    }
    public function HorarioView()
    {
        return $this->hasOne(Horario::class,'idHorario','idHorario');
    }
    public function Materia()
    {
        return $this->belongsTo(Materia::class, 'idMateria', 'idMateria');
    }



}
