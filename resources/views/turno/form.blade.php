<div class="row padding-1 p-1">
    <div class="col-md-12">
        
        <div class="form-group mb-2 mb20">
            <label for="id_turno" class="form-label">{{ __('Idturno') }}</label>
            <input type="text" name="idTurno" class="form-control @error('idTurno') is-invalid @enderror" value="{{ old('idTurno', $turno?->idTurno) }}" id="id_turno" placeholder="Idturno">
            {!! $errors->first('idTurno', '<div class="invalid-feedback" role="alert"><strong>:message</strong></div>') !!}
        </div>
        <div class="form-group mb-2 mb20">
            <label for="descripcion" class="form-label">{{ __('Descripcion') }}</label>
            <input type="text" name="descripcion" class="form-control @error('descripcion') is-invalid @enderror" value="{{ old('descripcion', $turno?->descripcion) }}" id="descripcion" placeholder="Descripcion">
            {!! $errors->first('descripcion', '<div class="invalid-feedback" role="alert"><strong>:message</strong></div>') !!}
        </div>
        <div class="form-group mb-2 mb20">
            <label for="rango_horario" class="form-label">{{ __('Rangohorario') }}</label>
            <input type="text" name="rangoHorario" class="form-control @error('rangoHorario') is-invalid @enderror" value="{{ old('rangoHorario', $turno?->rangoHorario) }}" id="rango_horario" placeholder="Rangohorario">
            {!! $errors->first('rangoHorario', '<div class="invalid-feedback" role="alert"><strong>:message</strong></div>') !!}
        </div>

    </div>
    <div class="col-md-12 mt20 mt-2">
        <button type="submit" class="btn btn-primary">{{ __('Submit') }}</button>
    </div>
</div>