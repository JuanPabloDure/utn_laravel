<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Evento;

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
}