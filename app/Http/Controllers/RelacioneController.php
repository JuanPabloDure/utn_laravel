<?php

namespace App\Http\Controllers;

use App\Models\Relacione;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Http\Requests\RelacioneRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

class RelacioneController extends Controller
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
        $relaciones = Relacione::paginate();

        return view('relacione.index', compact('relaciones'))
            ->with('i', ($request->input('page', 1) - 1) * $relaciones->perPage());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): View
    {
        $relacione = new Relacione();

        return view('relacione.create', compact('relacione'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(RelacioneRequest $request): RedirectResponse
    {
        Relacione::create($request->validated());

        return Redirect::route('relaciones.index')
            ->with('success', 'Relacione created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show($id): View
    {
        $relacione = Relacione::find($id);

        return view('relacione.show', compact('relacione'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id): View
    {
        $relacione = Relacione::find($id);

        return view('relacione.edit', compact('relacione'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(RelacioneRequest $request, Relacione $relacione): RedirectResponse
    {
        $relacione->update($request->validated());

        return Redirect::route('relaciones.index')
            ->with('success', 'Relacione updated successfully');
    }

    public function destroy($id): RedirectResponse
    {
        Relacione::find($id)->delete();

        return Redirect::route('relaciones.index')
            ->with('success', 'Relacione deleted successfully');
    }
}
