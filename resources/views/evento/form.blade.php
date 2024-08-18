<div class="row padding-1 p-1">
    <div class="col-md-12">
        <div class="form-group mb-2 mb20">
            <label for="fecha" class="form-label">Fecha</label>
            <input type="date" name="fecha" class="form-control @error('fecha') is-invalid @enderror" value="{{ old('fecha', $evento?->fecha) }}" id="fecha">
            {!! $errors->first('fecha', '<div class="invalid-feedback" role="alert"><strong>:message</strong></div>') !!}
        </div>

        <div class="form-group mb-2 mb20">
            <label for="tipo">Tipo</label>
            <select name="tipo" id="tipo" class="form-control" required>
                <option value="anual">Anual</option>
                <option value="primer">Primer Semestre</option>
                <option value="segundo">Segundo Semestre</option>
            </select>
        </div>

        <div class="form-group mb-2 mb20">
            <label for="aula_id" class="form-label">Aula</label>
            <select name="aula_id" class="form-control @error('aula_id') is-invalid @enderror" value="{{ old('aula_id', $evento?->aula_id) }}" id="aula_id">
                @foreach ($aulas as $aula)    
                    <option value="{{ $aula->id }}">{{ $aula->name}}</option>
                @endforeach
            </select>
        </div>

        <div class="form-group mb-2 mb20">
            <label for="idDocente" class="form-label">Docente</label>
            <select name="idDocente" class="form-control @error('idDocente') is-invalid @enderror" value="{{ old('idDocente', $evento?->idDocente) }}" id="idDocente">
                @foreach ($docentes as $docente)    
                    <option value="{{ $docente->idDocente }}">{{ $docente->apellido}}, {{ $docente->nombre}}</option>
                @endforeach
            </select>
        </div>

        <div class="form-group mb-2 mb20">
            <label for="dias_semana">Dias</label>
            <select name="dia_semana" id="dias_semana" class="form-control" required>
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
            <select name="idHorario" class="form-control @error('idHorario') is-invalid @enderror" value="{{ old('idHorario', $evento?->idHorario) }}" id="idHorario">
                @foreach ($horarios as $horario)    
                    <option value="{{ $horario->idHorario }}">{{ $horario->rangoHorario}}</option>
                @endforeach
            </select>
        </div>

        <div class="form-group mb-2 mb20">
            <label for="nota" class="form-label">Nota</label>
            <input type="text" name="nota" class="form-control @error('nota') is-invalid @enderror" value="{{ old('nota', $evento?->nota) }}" id="nota" placeholder="Nota">
            {!! $errors->first('nota', '<div class="invalid-feedback" role="alert"><strong>:message</strong></div>') !!}
        </div>

    </div>
    <div class="col-md-12 mt20 mt-2">
        <button type="submit" class="btn btn-primary">{{ __('Submit') }}</button>
    </div>
</div>