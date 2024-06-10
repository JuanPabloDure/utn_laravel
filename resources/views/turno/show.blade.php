@extends('adminlte::page')

@section('template_title')
    {{ $turno->name ?? __('Show') . " " . __('Turno') }}
@endsection

@section('content')
    <section class="content container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header" style="display: flex; justify-content: space-between; align-items: center;">
                        <div class="float-left">
                            <span class="card-title">{{ __('Show') }} Turno</span>
                        </div>
                        <div class="float-right">
                            <a class="btn btn-primary btn-sm" href="{{ route('turnos.index') }}"> {{ __('Back') }}</a>
                        </div>
                    </div>

                    <div class="card-body bg-white">
                        
                                <div class="form-group mb-2 mb20">
                                    <strong>Idturno:</strong>
                                    {{ $turno->idTurno }}
                                </div>
                                <div class="form-group mb-2 mb20">
                                    <strong>Descripcion:</strong>
                                    {{ $turno->descripcion }}
                                </div>
                                <div class="form-group mb-2 mb20">
                                    <strong>Rangohorario:</strong>
                                    {{ $turno->rangoHorario }}
                                </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
