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

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['aula_id', 'idDocente', 'idHorario', 'nota'];

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



}
