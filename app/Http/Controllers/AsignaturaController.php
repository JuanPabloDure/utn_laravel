<?php

namespace App\Http\Controllers;

use App\Models\Asignatura;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Http\Requests\AsignaturaRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

class AsignaturaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request): View
    {
        $asignaturas = Asignatura::paginate();

        return view('asignatura.index', compact('asignaturas'))
            ->with('i', ($request->input('page', 1) - 1) * $asignaturas->perPage());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): View
    {
        $asignatura = new Asignatura();

        return view('asignatura.create', compact('asignatura'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(AsignaturaRequest $request): RedirectResponse
    {
        Asignatura::create($request->validated());

        return Redirect::route('asignaturas.index')
            ->with('success', 'Asignatura created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show($id): View
    {
        $asignatura = Asignatura::find($id);

        return view('asignatura.show', compact('asignatura'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id): View
    {
        $asignatura = Asignatura::find($id);

        return view('asignatura.edit', compact('asignatura'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(AsignaturaRequest $request, Asignatura $asignatura): RedirectResponse
    {
        $asignatura->update($request->validated());

        return Redirect::route('asignaturas.index')
            ->with('success', 'Asignatura updated successfully');
    }

    public function destroy($id): RedirectResponse
    {
        Asignatura::find($id)->delete();

        return Redirect::route('asignaturas.index')
            ->with('success', 'Asignatura deleted successfully');
    }
}
