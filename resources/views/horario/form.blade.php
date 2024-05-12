<div class="row padding-1 p-1">
    <div class="col-md-12">
        
        <div class="form-group mb-2 mb20">
            <label for="nombre" class="form-label">{{ __('Nombre') }}</label>
            <input type="text" name="nombre" class="form-control @error('nombre') is-invalid @enderror" value="{{ old('nombre', $horario?->nombre) }}" id="nombre" placeholder="Nombre">
            {!! $errors->first('nombre', '<div class="invalid-feedback" role="alert"><strong>:message</strong></div>') !!}
        </div>
        <div class="form-group mb-2 mb20">
            <label for="desde" class="form-label">{{ __('Desde') }}</label>
            <input type="text" name="desde" class="form-control @error('desde') is-invalid @enderror" value="{{ old('desde', $horario?->desde) }}" id="desde" placeholder="Desde">
            {!! $errors->first('desde', '<div class="invalid-feedback" role="alert"><strong>:message</strong></div>') !!}
        </div>
        <div class="form-group mb-2 mb20">
            <label for="hasta" class="form-label">{{ __('Hasta') }}</label>
            <input type="text" name="hasta" class="form-control @error('hasta') is-invalid @enderror" value="{{ old('hasta', $horario?->hasta) }}" id="hasta" placeholder="Hasta">
            {!! $errors->first('hasta', '<div class="invalid-feedback" role="alert"><strong>:message</strong></div>') !!}
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