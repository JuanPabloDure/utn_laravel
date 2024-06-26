<?php

namespace App\Http\Controllers;
use App\Models\Turno;
use App\Models\Horario;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Http\Requests\HorarioRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

class HorarioController extends Controller
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
        $horarios = Horario::paginate();
        $turnos = Turno::all();

        return view('horario.index', compact('horarios','turnos'))//Para que se pueda usar un select
            ->with('i', ($request->input('page', 1) - 1) * $horarios->perPage());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): View
    {
        $turnos = Turno::all();
        $horario = new Horario();

        return view('horario.create', compact('horario','turnos'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(HorarioRequest $request): RedirectResponse
    {
        Horario::create($request->validated());

        return Redirect::route('horarios.index')
            ->with('success', 'Horario created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show($id): View
    {
        $horario = Horario::find($id);

        return view('horario.show', compact('horario'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id): View
    {
        $horario = Horario::find($id);
        $turnos = Turno::all();

        return view('horario.edit', compact('horario','turnos'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(HorarioRequest $request, Horario $horario): RedirectResponse
    {
        $horario->update($request->validated());

        return Redirect::route('horarios.index')
            ->with('success', 'Horario updated successfully');
    }

    public function destroy($id): RedirectResponse
    {
        Horario::find($id)->delete();

        return Redirect::route('horarios.index')
            ->with('success', 'Horario deleted successfully');
    }
}
