@extends('adminlte::page')

@section('title', 'UTN Rosario')

@section('content_header')
    <h1>UTN Rosario</h1>
@stop

@section('content')
<div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <div style="display: flex; justify-content: space-between; align-items: center;">
                            <div>
                                <div class="form-group mb-4 mb20" style="display: flex; align-items: center;">  
                                    <label for="idDocente" class="form-label" style="margin-right: 10px;">Docente: </label>
                                    <select name="idDocente" id="idDocente" class="form-control @error('idDocente') is-invalid @enderror">
                                        <option value="0">Selecione un docente</option>
                                        @foreach ($docentes as $docente)    
                                            <option value="{{ $docente->idDocente }}">{{ $docente->apellido}}, {{ $docente->nombre}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group mb-4 mb20" style="display: flex; align-items: center;">
                                    <label for="idMateria" class="form-label" style="margin-right: 10px;">Materia: </label>
                                    <select  name="idMateria" class="form-control" id="idMateria">
                                        <option value="0">Selecione una materia</option>
                                        @foreach ($materias as $mat)    
                                            <option value="{{ $mat->idMateria }}">{{ $mat->nombre}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="float-right">
                                <button class="btn btn-sm btn-primary"> Buscar</button>
                            </div>
                        </div>
                    </div>
                    <div id="resultados">

                    </div>

                    <div class="card-body bg-white">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead class="thead">
                                    <tr>
                                        <th></th>
                                        <th>Lunes</th>    
                                        <th>Martes</th>
                                        <th>Miércoles</th>
                                        <th>Jueves</th>
                                        <th>Viernes</th>
                                        <th>Sábado</th>
                                        <th>Domingo</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($horarios as $horario)
                                        <tr>
                                            <td >{{ $horario->rangoHorario }}</td>
                                            <td >
                                                <div dia="Lunes" hora="{{ $horario->idHorario }}"> - </div>
                                            </td>
                                            <td >
                                                <div dia="Martes" hora="{{ $horario->idHorario }}"> - </div>
                                            </td>
                                            <td >
                                                <div dia="Miércoles" hora="{{ $horario->idHorario }}"> - </div>
                                            </td>
                                            <td >
                                                <div dia="Jueves" hora="{{ $horario->idHorario }}"> - </div>
                                            </td>
                                            <td >
                                                <div dia="Viernes" hora="{{ $horario->idHorario }}"> - </div>
                                            </td>
                                            <td >
                                                <div dia="Sábado" hora="{{ $horario->idHorario }}"> - </div>
                                            </td>
                                            <td >
                                                <div dia="Domingo" hora="{{ $horario->idHorario }}"> - </div>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
    
                </div>
            </div>
        </div>
    </div>

@stop

@section('css')
    {{-- Add here extra stylesheets --}}
    {{-- <link rel="stylesheet" href="/css/admin_custom.css"> --}}
@stop

@section('js')
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

            

    document.addEventListener('DOMContentLoaded', function() {
    
    const idMateriaSelect = document.getElementById('idMateria');
    const idDocenteSelect = document.getElementById('idDocente');
    const resultadosDiv = document.getElementById('resultados');

    function realizarConsulta() {
        const idMateria = idMateriaSelect.value;
        const idDocente = idDocenteSelect.value;

        fetch('/api_v1/consulta_home', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            body: JSON.stringify({
                idMateria: idMateria,
                idDocente: idDocente
            })
        })
        .then(response => response.json())
        .then(data => {
            // Lógica para redibujar la vista con los datos recibidos
            resultadosDiv.innerHTML = '';

            if (data.data.length === 0) {
                resultadosDiv.textContent = data.message; // Muestra el mensaje si no hay resultados
            } else {
                data.data.forEach(evento => {
                    const eventoElement = document.createElement('div');
                    eventoElement.textContent = `Docente: ${evento.idDocente}, Materia: ${evento.idMateria}`;
                    console.log(evento)
                    resultadosDiv.appendChild(eventoElement);
                });
            }
        })
        .catch(error => console.error('Error:', error));
    }

    idMateriaSelect.addEventListener('change', realizarConsulta);
    idDocenteSelect.addEventListener('change', realizarConsulta);
    });



    </script>
@stop
