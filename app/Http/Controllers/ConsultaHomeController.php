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
        

        $query = Evento::query();
        $Hquery = Horario::query();
        $Aquery = Aula::query();



        $eventos = $query->get();
        $horario = $Hquery->get();
        $aula = $Aquery->get();

        return response()->json([
            'eventos' => $eventos,
            'turnos' => $horario,
            'aulas' => $aula,
            'message' => $eventos->isEmpty() ? 'No se encontraron eventos' : 'Eventos encontrados',
        ]);
    }
}