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


}
