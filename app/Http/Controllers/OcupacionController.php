<?php

namespace App\Http\Controllers;

use App\Models\Evento;
use App\Models\Aula;
use App\Models\Docente;
use App\Models\Horario;
use App\Models\Materia;

use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Http\Requests\EventoRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

//Esto es un Reporte Vista Busqueda de Eventos por docente y otros parametros 
//Uso el mismo espacio de evento si total va a ser una vista de este modelo


class OcupacionController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $usuario = auth()->user();//Usuario actual tiene que estar logueado para si lo usas q no romapa
        $eventos = Evento::all();
        $aulas = Aula::all();
        $docentes = Docente::all();
        $horarios = Horario::all();
        $materias = Materia::all();
        return view('ocupacion', compact('eventos','aulas','docentes','horarios','materias','usuario'));
    }
}
