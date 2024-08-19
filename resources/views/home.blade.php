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
                                <div class="form-group mb-2 mb20" style="display: flex; align-items: center;">
                                    <label for="aula_id" class="form-label" style="margin-right: 10px;">Aula:</label>
                                    <select id="aula_id" name="aula_id" class="form-control" style="margin-right: 10px;" >
                                        <option value="0">Selecione un aula</option>
                                        @foreach ($aulas as $aula)    
                                            <option value="{{ $aula->id }}">{{ $aula->name}}</option>
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
                    console.log(evento)
                    let materia = obtenerTextoDeSeleccion("idMateria",evento.idMateria)
                    let docente = obtenerTextoDeSeleccion("idDocente",evento.idDocente)
                    let aula    = "Aula : " + obtenerTextoDeSeleccion("aula_id",evento.aula_id) + " " + evento.dia_semana
                    let tipo    = "Semestre : " + evento.tipo
                    let nota    = evento.nota ? "Nota : " + evento.nota : null;
                    limpiarYCrearDiv(materia, [docente,aula,tipo], evento.dia_semana, evento.idHorario )
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
        //console.log(idSelect + " "+ valor)

        // Busca el option que tenga el valor especificado
        const option = Array.from(selectElement.options).find(option => option.value === valor);
        // Devuelve el texto del option encontrado o un mensaje por defecto
        return option ? option.textContent : 'Opción no encontrada';
    }

    function limpiarYCrearDiv(titulo, texto, dia, hora) {
        // Selecciona todos los divs con los atributos especificados
        const divs = document.querySelectorAll(`div[dia="${dia}"][hora="${hora}"]`);

        // Elimina los divs encontrados
        //divs.forEach(div => div.textContent = '');
        divs.forEach(div => {
            if (div.textContent === '-') {
                div.textContent = '';
            }
        });
        //Lo movi a otra funcion mira a bajo

        // Crea un nuevo div
        const nuevoDiv = document.createElement('div');
        nuevoDiv.style.backgroundColor = generarColorClaroAleatorio(); // Aplica el color de fondo
        nuevoDiv.style.borderRadius = '10px'; // Redondea los bordes del div
        nuevoDiv.style.padding = '10px'; // Añade un poco de espacio interno (opcional)
        // Crea el título
        const h5 = document.createElement('h5');
        h5.textContent = titulo;
        // Estilo para limitar a 20 caracteres por línea
        h5.style.width = '20ch';  // Limita el ancho del contenedor a 20 caracteres
        h5.style.whiteSpace = 'normal';  // Permite que el texto se envuelva en nuevas líneas
        h5.style.wordWrap = 'break-word';  // Corta palabras si es necesario para ajustarse al ancho
        // Añade el título y el texto al nuevo div
        nuevoDiv.appendChild(h5);
        //Añado las lineas de texto
        texto.forEach(Texto => {
            let h8 = document.createElement('span');
            h8.textContent = Texto;
            h8.style.display = 'block'; // Forzar que cada span ocupe una línea
            if (Texto) {
                nuevoDiv.appendChild(h8);
            }
            });

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

    function generarColorClaroAleatorio() {
        const r = Math.floor(Math.random() * 156) + 100; // Rango de 100 a 255
        const g = Math.floor(Math.random() * 156) + 100; // Rango de 100 a 255
        const b = Math.floor(Math.random() * 156) + 100; // Rango de 100 a 255

        return `rgb(${r}, ${g}, ${b})`;
    }

    </script>
@stop
