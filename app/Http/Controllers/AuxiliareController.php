<?php

namespace App\Http\Controllers;

use App\Models\Auxiliare;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Http\Requests\AuxiliareRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

class AuxiliareController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request): View
    {
        $auxiliares = Auxiliare::paginate();

        return view('auxiliare.index', compact('auxiliares'))
            ->with('i', ($request->input('page', 1) - 1) * $auxiliares->perPage());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): View
    {
        $auxiliare = new Auxiliare();

        return view('auxiliare.create', compact('auxiliare'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(AuxiliareRequest $request): RedirectResponse
    {
        Auxiliare::create($request->validated());

        return Redirect::route('auxiliares.index')
            ->with('success', 'Auxiliare created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show($id): View
    {
        $auxiliare = Auxiliare::find($id);

        return view('auxiliare.show', compact('auxiliare'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id): View
    {
        $auxiliare = Auxiliare::find($id);

        return view('auxiliare.edit', compact('auxiliare'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(AuxiliareRequest $request, Auxiliare $auxiliare): RedirectResponse
    {
        $auxiliare->update($request->validated());

        return Redirect::route('auxiliares.index')
            ->with('success', 'Auxiliare updated successfully');
    }

    public function destroy($id): RedirectResponse
    {
        Auxiliare::find($id)->delete();

        return Redirect::route('auxiliares.index')
            ->with('success', 'Auxiliare deleted successfully');
    }
}
