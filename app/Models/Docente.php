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

    protected static function boot()
    {
        parent::boot();

        // Define el orden por defecto
        static::addGlobalScope('order', function (\Illuminate\Database\Eloquent\Builder $builder) {
            $builder->orderBy('apellido', 'asc'); // Cambia 'fecha_evento' por el nombre de tu columna y 'asc' por 'desc' si quieres orden descendente
        });
    }

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
