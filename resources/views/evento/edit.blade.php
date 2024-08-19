@extends('adminlte::page')

@section('template_title')
    {{ __('Update') }} Evento
@endsection

@section('content')
    <section class="content container-fluid">
        <div class="">
            <div class="col-md-12">

                <div class="card card-default">
                    <div class="card-header">
                        <span class="card-title">{{ __('Update') }} Evento</span>
                    </div>
                    <div class="card-body bg-white">
                        <form method="POST" action="{{ route('eventos.update', $evento->id) }}"  role="form" enctype="multipart/form-data">
                            {{ method_field('PATCH') }}
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
