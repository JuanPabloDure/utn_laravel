<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Docente
 *
 * @property $idDocente
 * @property $nombre
 * @property $cargo
 * @property $apellido
 * @property $activo
 * @property $created_at
 * @property $updated_at
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Docente extends Model
{
    
    protected $perPage = 20;
    protected $primaryKey = 'idDocente';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['nombre', 'cargo', 'apellido', 'activo'];

    public function getNombreYapellidoAttribute()
    {
        return $this->nombre . ' ' . $this->apellido;
    }


}
