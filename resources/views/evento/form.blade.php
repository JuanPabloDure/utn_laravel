<div class="row padding-1 p-1">
    <div class="col-md-12">
        <div class="form-group mb-2 mb20">
            <label for="fecha" class="form-label">Fecha</label>
            <input type="date" name="fecha" class="form-control @error('fecha') is-invalid @enderror" value="{{ old('fecha', $evento?->fecha) }}" id="fecha">
            {!! $errors->first('fecha', '<div class="invalid-feedback" role="alert"><strong>:message</strong></div>') !!}
        </div>

        <div class="form-group mb-2 mb20">
            <label for="tipo">Tipo</label>
            <select name="tipo" id="tipo" class="form-control"  required>
                <option value="anual">Anual</option>
                <option value="primer">Primer Semestre</option>
                <option value="segundo">Segundo Semestre</option>
            </select>
        </div>

        <div class="form-group mb-2 mb20">
            <label for="aula_id" class="form-label">Aula</label>
            <select id="aula_id" name="aula_id" class="form-control @error('aula_id') is-invalid @enderror" value="{{ old('aula_id', $evento?->aula_id) }}" id="aula_id">
                @foreach ($aulas as $aula)    
                    <option value="{{ $aula->id }}">{{ $aula->name}}</option>
                @endforeach
            </select>
        </div>

        <div class="form-group mb-2 mb20">
            <label for="idDocente" class="form-label">Docente</label>
            <select name="idDocente" id="idDocente" class="form-control @error('idDocente') is-invalid @enderror" value="{{ old('idDocente', $evento?->idDocente) }}">
                @foreach ($docentes as $docente)    
                    <option value="{{ $docente->idDocente }}">{{ $docente->apellido}}, {{ $docente->nombre}}</option>
                @endforeach
            </select>
        </div>

        <div class="form-group mb-2 mb20">
            <label for="dias_semana">Dias</label>
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

        <div class="form-group mb-2 mb20">
            <label for="idHorario" class="form-label">Horario</label>
            <select name="idHorario" id="idHorario" class="form-control @error('idHorario') is-invalid @enderror" value="{{ old('idHorario', $evento?->idHorario) }}" id="idHorario">
                @foreach ($horarios as $horario)    
                    <option value="{{ $horario->idHorario }}">{{ $horario->rangoHorario}}</option>
                @endforeach
            </select>
        </div>

        <div class="form-group mb-2 mb20">
            <label for="nota" class="form-label">Nota</label>
            <input type="text" name="nota" id="nota" class="form-control @error('nota') is-invalid @enderror" value="{{ old('nota', $evento?->nota) }}" id="nota" placeholder="Nota">
            {!! $errors->first('nota', '<div class="invalid-feedback" role="alert"><strong>:message</strong></div>') !!}
        </div>

    </div>
    <div class="col-md-12 mt20 mt-2">
        <button type="submit" class="btn btn-primary">{{ __('Submit') }}</button>
        <button class="btn btn-danger" onclick="window.location.href='/eventos'"> Cancelar </button>
    </div>
    <input type="hidden" id="dia_actual" value="{{ old('dia_semana', $evento?->dia_semana) }}">
    <input type="hidden" id="semestre" value="{{ old('tipo', $evento?->tipo) }}">
    <input type="hidden" id="horario_a" value="{{ old('idHorario', $evento?->idHorario) }}">
    <input type="hidden" id="aula_a" value="{{ old('aula_id', $evento?->aula_id) }}">
    <input type="hidden" id="docente_a" value="{{ old('idDocente', $evento?->idDocente) }}">
</div>

<script>
    function eliminarCampo(idCampo) {
        var campo = document.getElementById(IdCampo);
        campo.parentNode.removeChild(campo);
    }

    function traerCampoViejo(nuevo,viejo) {
        // Obtener el valor del campo "dia_actual"
        var Viejo = document.getElementById(viejo).value;

        // Obtener el campo select "dia_semana"
        var selectDiaSemana = document.getElementById(nuevo);
        // Establecer el valor del select en base al valor de "dia_actual"
        selectDiaSemana.value = Viejo;
    }

    document.addEventListener("DOMContentLoaded", function() {
        traerCampoViejo("dia_semana","dia_actual")
        traerCampoViejo("tipo","semestre")
        traerCampoViejo("aula_id","aula_a")
        traerCampoViejo("idHorario","horario_a")
        traerCampoViejo("idDocente","docente_a")
    });
</script>