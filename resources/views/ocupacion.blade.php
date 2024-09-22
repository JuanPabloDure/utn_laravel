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
                                    <label for="dias_semana" class="form-label" style="margin-right: 10px;">Dia</label>
                                    <select name="dia_semana" id="dia_semana" class="form-control" required>
                                        <option value="Lunes">Lunes</option>
                                        <option value="Martes">Martes</option>
                                        <option value="Miércoles">Miércoles</option>
                                        <option value="Jueves">Jueves</option>
                                        <option value="Viernes">Viernes</option>
                                        <option value="Sábado">Sábado</option>
                                        <option value="Domingo">Domingo</option>
                                    </select>
                                </div>

                                <div class="form-group mb-4 mb20" style="display: flex; align-items: center;">
                                    <label for="TurnoFiltro" class="form-label" style="margin-right: 10px;">Turno</label>
                                    <select name="TurnoFiltro" id="TurnoFiltro" class="form-control" required>
                                        <option value="0">Todos</option>
                                        <option value="1">Mañana</option>
                                        <option value="2">Tarde</option>
                                        <option value="3">Noche</option>
                                    </select>
                                </div>

                                <div class="form-group mb-4 mb20" style="display: flex; align-items: center;">
                                    <label for="tipo"  class="form-label" style="margin-right: 10px;">Tipo</label>
                                    <select name="tipo" id="tipoSemestre" class="form-control"  required>
                                        <option value="anual">Anual</option>
                                        <option value="primer">Primer Semestre + Anual</option>
                                        <option value="segundo">Segundo Semestre + Anual</option>
                                    </select>
                                </div>

                            </div>

                        </div>
                        <div id="resultados"></div>
                    </div>

                    <div class="card-body bg-white">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover" id="tablaOcupacion" style="border-collapse: collapse; width: 100%;">
                                
                            </table>
                        </div>
                    </div>

                    <div id="notificationsContainer" style="position: fixed; top: 20px; right: 20px; z-index: 1050;"></div>
    
                </div>
            </div>
        </div>
    </div>

@stop

@section('css')
    {{-- Add here extra stylesheets --}}
    {{-- <link rel="stylesheet" href="/css/admin_custom.css"> --}}
    <style>
    /* Estilos para los bordes de las celdas */
    table#tablaOcupacion td, table#tablaOcupacion th {
        border: 1px solid #010101; /* Color negro para los bordes */
        padding: 8px; /* Añadir algo de padding para mejor legibilidad */
    }

    /* Estilo opcional para centrar el contenido de las celdas */
    table#tablaOcupacion td {
        text-align: center;
    }
</style>
@stop

@section('js')
<script>
        ///CARGA LA PAGINA E INICIAMOS AUTOMATISMOS
        document.addEventListener('DOMContentLoaded', function() {
            ocultarElemento()
            seleccionarTurno();
            seleccionarDiaHoy();
            seleccionarTipo();
            addNotification("Se selecciono el turno y dia correspondiente puede cambiarlo")
            realizarConsulta();
            document.getElementById('TurnoFiltro').addEventListener('input', realizarConsulta);
            document.getElementById('tipoSemestre').addEventListener('input', realizarConsulta);
            document.getElementById('dia_semana').addEventListener('input', realizarConsulta);
        });


        function ocultarElemento() {
            var elemento = document.querySelector('.nav-link[data-widget="navbar-search"]');
            if (elemento) {
                elemento.style.display = 'none';
            }
        }
        

        function addNotification(message, type = 'info') {
            // Crea un nuevo elemento de alerta
            const alertDiv = $(`
                <div class="alert alert-${type} alert-dismissible fade show" role="alert" style="margin-bottom: 10px;">
                    ${message}
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            `);

            // Agrega la alerta al contenedor
            $('#notificationsContainer').prepend(alertDiv);

            // Opcional: Remueve la alerta después de 5 segundos
            setTimeout(() => {
                alertDiv.alert('close');
            }, 5000);
        }

        function realizarConsulta() {
            const diaSelect = document.getElementById('dia_semana');
            const TurnoSelect = document.getElementById('TurnoFiltro');
            const dia = diaSelect.value;
            const turno = parseInt(TurnoSelect.value,10);
            let seme = document.getElementById('tipoSemestre');
            let semestre = false; 
            if (seme){
                semestre = seme.value; 
            }


            fetch('/api_v1/consulta_ocupacion', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                body: JSON.stringify({
                    turno: turno,
                    dia: dia,
                    semestre :semestre
                })
            })
            .then(response => response.json())
            .then(data => {
                // Lógica para redibujar la vista con los datos recibidos
                //resultadosDiv.innerHTML = '';
                console.log(data)
                if (data.eventos.length === 0) {
                    //resultadosDiv.textContent = data.message; // Muestra el mensaje si no hay resultados
                    addNotification(data.message,"warning");
                } else {
                    addNotification(data.message,"success");
                    generarTablaOcupacion(data)
                }
            })
            .catch(error => {
                console.error('Error:', error)
                addNotification("Se encontro un error al hacer la consulta de tabla","danger")
            });
        }

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

        function seleccionarDiaHoy() {
            // Definir un array con los días de la semana
            const diasSemana = ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"];
            
            // Obtener la fecha actual ajustada a UTC-3
            const hoyUTC3 = new Date(new Date().getTime() - (3 * 60 * 60 * 1000)); // Restar 3 horas para UTC-3
            
            // Obtener el día de la semana (0 es Domingo, 1 es Lunes, etc.)
            const diaHoy = hoyUTC3.getDay();
            
            // Seleccionar el día correspondiente en el select
            const selectDiaSemana = document.getElementById('dia_semana');
            selectDiaSemana.value = diasSemana[diaHoy];
        }

        function seleccionarTurno() {
            // Definir los turnos con sus horas de inicio y fin
            const turnos = [
                { id: 1, nombre: 'Mañana', inicio: '07:15', fin: '13:35' },
                { id: 2, nombre: 'Tarde', inicio: '12:50', fin: '19:15' },
                { id: 3, nombre: 'Noche', inicio: '18:35', fin: '00:10' }
            ];
            
            // Obtener la fecha actual ajustada a UTC-3
            const ahoraUTC3 = new Date(new Date().getTime() - (3 * 60 * 60 * 1000));
            const horaActual = ahoraUTC3.getHours();
            const minutosActual = ahoraUTC3.getMinutes();
            
            // Función para convertir la hora a minutos (para facilitar la comparación)
            function horaEnMinutos(hora) {
                const [h, m] = hora.split(':').map(Number);
                return h * 60 + m;
            }
            
            // Convertir la hora actual a minutos
            const minutosActuales = horaActual * 60 + minutosActual;
            
            // Variable para almacenar el turno encontrado
            let turnoSeleccionado = 0; // Por defecto es "Todos"

            // Recorrer los turnos para encontrar el turno correspondiente
            turnos.forEach(turno => {
                const inicioMinutos = horaEnMinutos(turno.inicio);
                let finMinutos = horaEnMinutos(turno.fin);
                
                // Si el turno termina después de la medianoche, ajustamos el rango
                if (finMinutos < inicioMinutos) {
                    finMinutos += 24 * 60; // Sumar 24 horas para ajustar
                }
                
                if (minutosActuales >= inicioMinutos && minutosActuales <= finMinutos) {
                    turnoSeleccionado = turno.id;
                }
            });
            
            // Seleccionar el turno correspondiente en el select
            const selectTurno = document.getElementById('TurnoFiltro');
            selectTurno.value = turnoSeleccionado;
        }

        function seleccionarTipo() {
            // Obtener la fecha actual
            const fechaActual = new Date();
            
            // Obtener el mes actual (0 = Enero, 11 = Diciembre)
            const mesActual = fechaActual.getMonth();
            
            // Variable para almacenar el tipo de semestre seleccionado
            let tipoSeleccionado = 'anual'; // Por defecto es "Anual"

            // Determinar el semestre según el mes
            if (mesActual >= 0 && mesActual <= 5) {
                // De enero (0) a junio (5), corresponde al "Primer Semestre"
                tipoSeleccionado = 'primer';
            } else if (mesActual >= 6 && mesActual <= 11) {
                // De julio (6) a diciembre (11), corresponde al "Segundo Semestre"
                tipoSeleccionado = 'segundo';
            }

            // Seleccionar el tipo correspondiente en el select
            const selectTipo = document.getElementById('tipoSemestre');
            selectTipo.value = tipoSeleccionado;
        }


        function generarTablaOcupacion(data) {
            const tabla = document.getElementById("tablaOcupacion");
            
            // Crear la fila de encabezados con los turnos
            let thead = '<thead><tr><th>Aulas / Turnos</th>';
            data.turnos.forEach(turno => {
                thead += `<th>${turno.rangoHorario}</th>`;
            });
            thead += '</tr></thead>';
            tabla.innerHTML = thead;

            // Crear las filas para las aulas
            let tbody = '<tbody>';
            data.aulas.forEach(aula => {
                tbody += `<tr><td>${aula.name}</td>`;
                data.turnos.forEach(turno => {
                    // Encontrar si hay un evento para este aula y turno
                    const evento = data.eventos.find(e => e.aula_id === aula.id && e.idHorario === turno.idHorario);

                    // Marcar la celda como "Ocupado" si hay un evento, sino poner fondo verde claro
                    if (evento) {
                        tbody += `<td style="background-color:  #ffff00;">${evento.nombre_materia}</td>`;
                    } else {
                        tbody += `<td style="background-color: #d4edda;"></td>`;
                    }
                });
                tbody += '</tr>';
            });
            tbody += '</tbody>';
            tabla.innerHTML += tbody;
        }



    


    </script>
@stop
