@extends('adminlte::page')

@section('template_title')
    {{ __('Create') }} Evento
@endsection

@section('content')
    <section class="content container-fluid">
        <div class="row">
            <div class="col-md-12">

                <div class="card card-default">
                    <div class="card-header">
                        <span class="card-title">{{ __('Create') }} Evento</span>
                    </div>
                    <div class="card-body bg-white">
                        <form method="POST" action="{{ route('eventos.store') }}"  role="form" enctype="multipart/form-data">
                            @csrf

                            @include('evento.form')

                        </form>
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
