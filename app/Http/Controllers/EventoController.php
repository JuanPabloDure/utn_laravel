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

class EventoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index(Request $request): View
    {
        $eventos = Evento::paginate();

        return view('evento.index', compact('eventos'))
            ->with('i', ($request->input('page', 1) - 1) * $eventos->perPage());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): View
    {
        $evento = new Evento();
        //$evento = Evento::find($id);
        $aulas = Aula::all();
        $docentes = Docente::all();
        $horarios = Horario::all();
        $materias = Materia::all();

        return view('evento.create', compact('evento','aulas','docentes','horarios','materias'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(EventoRequest $request): RedirectResponse
    {
        Evento::create($request->validated());

        return Redirect::route('eventos.index')
            ->with('success', 'Evento created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show($id): View
    {
        $evento = Evento::find($id);

        return view('evento.show', compact('evento'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id): View
    {
        $evento = Evento::find($id);
        $aulas = Aula::all();
        $docentes = Docente::all();
        $horarios = Horario::all();
        $materias = Materia::all();

        return view('evento.edit', compact('evento','aulas','docentes','horarios','materias'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(EventoRequest $request, Evento $evento): RedirectResponse
    {
        $evento->update($request->validated());

        return Redirect::route('eventos.index')
            ->with('success', 'Evento updated successfully');
    }

    public function destroy($id): RedirectResponse
    {
        Evento::find($id)->delete();

        return Redirect::route('eventos.index')
            ->with('success', 'Evento deleted successfully');
    }
}
