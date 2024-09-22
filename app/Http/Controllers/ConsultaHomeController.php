<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Evento;
use App\Models\Horario;
use App\Models\Aula;

class ConsultaHomeController extends Controller
{
    public function consulta(Request $request)
    {
        $request->validate([
            'idMateria' => 'required|integer',
            'idDocente' => 'required|integer',
        ]);

        $query = Evento::query();

        if ($request->idMateria != 0) {
            $query->where('idMateria', $request->idMateria);
        }

        if ($request->idDocente != 0) {
            $query->where('idDocente', $request->idDocente);
        }

        $eventos = $query->get();

        return response()->json([
            'data' => $eventos,
            'message' => $eventos->isEmpty() ? 'No se encontraron eventos' : 'Eventos encontrados',
        ]);
    }

    public function ocupacion(Request $request)
    {
        $request->validate([
            'dia' => 'required|string',
            'turno' => 'required|integer',
        ]);
        
        $Hquery = Horario::query();
        $Aquery = Aula::query();


        $horario = $Hquery->whereNotIn('hora', ['PH', 'PPH']);
        if ($request->turno != 0) {
            $Hquery->where('idTurno', $request->turno);
        }

        $horario = $Hquery->get();
        $aula = $Aquery->get();

        $idHorarios = $Hquery->pluck('idHorario')->toArray();
        //$idHorarios = array_map(function($item) {
        //    return $item->idHorario; // Reemplaza `idHorario` con el nombre real de la propiedad
        //}, $horario);

        // Usamos join para traer los nombres de las materias en la misma consulta
        $eventos = Evento::query()
        ->join('materias', 'eventos.idMateria', '=', 'materias.idMateria')
        ->select('eventos.*', 'materias.nombre as nombre_materia')
        ->whereIn('idHorario', $idHorarios)
        ->get();
        

        return response()->json([
            'test' => $idHorarios,
            'eventos' => $eventos,
            'turnos' => $horario,
            'aulas' => $aula,
            'message' => $eventos->isEmpty() ? 'No se encontraron eventos' : 'Eventos encontrados',
        ]);
    }
}