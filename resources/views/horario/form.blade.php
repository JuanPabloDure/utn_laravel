<div class="row padding-1 p-1">
    <div class="col-md-12">
        
        <div class="form-group mb-2 mb20">
            <label for="nombre" class="form-label">{{ __('Inicio') }}</label>
            <input type="text" name="horarioInicio" class="form-control @error('horarioInicio') is-invalid @enderror" value="{{ old('horarioInicio', $horario?->horarioInicio) }}" id="horarioInicio" placeholder="Nombre">
            {!! $errors->first('horarioInicio', '<div class="invalid-feedback" role="alert"><strong>:message</strong></div>') !!}
        </div>
        <div class="form-group mb-2 mb20">
            <label for="horarioFin" class="form-label">{{ __('Fin') }}</label>
            <input type="text" name="horarioFin" class="form-control @error('horarioFin') is-invalid @enderror" value="{{ old('horarioFin', $horario?->horarioFin) }}" id="horarioFin" placeholder="horarioFin">
            {!! $errors->first('horarioFin', '<div class="invalid-feedback" role="alert"><strong>:message</strong></div>') !!}
        </div>
        <div class="form-group mb-2 mb20">
            <label for="hora" class="form-label">{{ __('hora') }}</label>
            <input type="text" name="hora" class="form-control @error('hora') is-invalid @enderror" value="{{ old('hora', $horario?->hora) }}" id="hora" placeholder="hora">
            {!! $errors->first('hora', '<div class="invalid-feedback" role="alert"><strong>:message</strong></div>') !!}
        </div>
        <div class="form-group mb-2 mb20">
            <label for="activo" class="form-label">{{ __('Activo') }}</label>
            <select name="activo" class="form-control @error('activo') is-invalid @enderror" value="{{ old('activo', $horario?->activo) }}" id="activo" placeholder="Si">
                <option value="Si">Si</option>
                <option value="No">No</option>
            </select>
        </div>

    </div>
    <div class="col-md-12 mt20 mt-2">
        <button type="submit" class="btn btn-primary">{{ __('Submit') }}</button>
    </div>
</div>