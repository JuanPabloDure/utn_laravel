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
                            <!--<div class="float-right">
                                <button class="btn btn-sm btn-primary"> Buscar</button>
                            </div>-->
                        </div>
                        <div id="resultados"></div>
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
                                                <div dub="calendario" dia="Lunes" hora="{{ $horario->idHorario }}"> - </div>
                                            </td>
                                            <td >
                                                <div dub="calendario" dia="Martes" hora="{{ $horario->idHorario }}"> - </div>
                                            </td>
                                            <td >
                                                <div dub="calendario"  dia="Miércoles" hora="{{ $horario->idHorario }}"> - </div>
                                            </td>
                                            <td >
                                                <div dub="calendario"  dia="Jueves" hora="{{ $horario->idHorario }}"> - </div>
                                            </td>
                                            <td >
                                                <div dub="calendario"  dia="Viernes" hora="{{ $horario->idHorario }}"> - </div>
                                            </td>
                                            <td >
                                                <div dub="calendario"  dia="Sábado" hora="{{ $horario->idHorario }}"> - </div>
                                            </td>
                                            <td >
                                                <div dub="calendario"  dia="Domingo" hora="{{ $horario->idHorario }}"> - </div>
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
        resetearContenidoACalendarios()

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
                    let materia = obtenerTextoDeSeleccion("idMateria",evento.idMateria)
                    limpiarYCrearDiv(materia, evento.idDocente, evento.dia_semana, evento.idHorario )
                    var tmp = `Docente: ${evento.idDocente}, Materia: ${evento.idMateria}`;
                    console.log(tmp)
                });
                //////////////////////////////COMENTAR EN PRODUCCION//////////////////////////////////////////
                const eventoElement = document.createElement('div');
                eventoElement.textContent = "Se encontraron resultados";
                resultadosDiv.appendChild(eventoElement);
                ////////////////////////////////////////////////////////////////////////////////////////////
            }
        })
        .catch(error => console.error('Error:', error));
    }

    idMateriaSelect.addEventListener('change', realizarConsulta);
    idDocenteSelect.addEventListener('change', realizarConsulta);
    });

    function obtenerTextoDeSeleccion(idSelect, Valor) {
        // Encuentra el elemento select por su ID
        let valor = Valor.toString();
        const selectElement = document.getElementById(idSelect);
        console.log(idSelect + " "+ valor)

        // Busca el option que tenga el valor especificado
        const option = Array.from(selectElement.options).find(option => option.value === valor);
        // Devuelve el texto del option encontrado o un mensaje por defecto
        return option ? option.textContent : 'Opción no encontrada';
    }

    function limpiarYCrearDiv(titulo, texto, dia, hora) {
        // Selecciona todos los divs con los atributos especificados
        const divs = document.querySelectorAll(`div[dia="${dia}"][hora="${hora}"]`);

        // Elimina los divs encontrados
        divs.forEach(div => div.textContent = '');
        //Lo movi a otra funcion mira a bajo

        // Crea un nuevo div
        const nuevoDiv = document.createElement('div');

        // Crea el título y el texto
        const h6 = document.createElement('h6');
        h6.textContent = titulo;
        const h8 = document.createElement('h8');
        h8.textContent = texto;

        // Añade el título y el texto al nuevo div
        nuevoDiv.appendChild(h6);
        nuevoDiv.appendChild(h8);

        // Añade el nuevo div al body (o a un contenedor específico)
        divs.forEach(div => div.appendChild(nuevoDiv));
        //document.body.appendChild(nuevoDiv);
    }

    function resetearContenidoACalendarios() {
        // Selecciona todos los divs con el atributo dub="calendario"
        const calendarios = document.querySelectorAll('div[dub="calendario"]');

        // Reemplaza el contenido de cada div con un "-"
        calendarios.forEach(div => {
            div => div.remove() //Elimino las busquedas anteriores
            div.textContent = '-';//Pongo el mismo texto defecto que puse en php
        });
    }

    </script>
@stop
