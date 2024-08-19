@extends('adminlte::page')

@section('template_title')
    {{ $evento->name ?? __('Show') . " " . __('Evento') }}
@endsection

@section('content')
    <section class="content container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header" style="display: flex; justify-content: space-between; align-items: center;">
                        <div class="float-left">
                            <span class="card-title">{{ __('Show') }} Evento</span>
                        </div>
                        <div class="float-right">
                            <a class="btn btn-primary btn-sm" href="{{ route('eventos.index') }}"> {{ __('Back') }}</a>
                        </div>
                    </div>

                    <div class="card-body bg-white">
                        
                                <div class="form-group mb-2 mb20">
                                    <strong>Aula Id:</strong>
                                    {{ $evento->aula_id }}
                                </div>
                                <div class="form-group mb-2 mb20">
                                    <strong>Iddocente:</strong>
                                    {{ $evento->idDocente }}
                                </div>
                                <div class="form-group mb-2 mb20">
                                    <strong>Idhorario:</strong>
                                    {{ $evento->idHorario }}
                                </div>
                                <div class="form-group mb-2 mb20">
                                    <strong>Nota:</strong>
                                    {{ $evento->nota }}
                                </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>

        function ocultarElemento() {
        var elemento = document.querySelector('.nav-link[data-widget="navbar-search"]');
        if (elemento) {
            elemento.style.display = 'none';
        }
        }

        document.addEventListener("DOMContentLoaded", function() {
            ocultarElemento()
        });

        document.getElementById('cancelButton').addEventListener('click', function(event) {
            event.preventDefault(); // Evita el comportamiento por defecto del botón
            window.history.back();  // Regresa a la página anterior
            });
    </script>
@endsection
