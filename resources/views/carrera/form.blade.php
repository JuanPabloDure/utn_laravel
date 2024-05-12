<div class="row padding-1 p-1">
    <div class="col-md-12">
        
        <div class="form-group mb-2 mb20">
            <label for="carrera" class="form-label">{{ __('Carrera') }}</label>
            <input type="text" name="carrera" class="form-control @error('carrera') is-invalid @enderror" value="{{ old('carrera', $carrera?->carrera) }}" id="carrera" placeholder="Carrera">
            {!! $errors->first('carrera', '<div class="invalid-feedback" role="alert"><strong>:message</strong></div>') !!}
        </div>

        <div class="form-group mb-2 mb20">
            <label for="tipo" class="form-label">{{ __('Tipo') }}</label>
            <select name="tipo" class="form-control @error('tipo') is-invalid @enderror" value="{{ old('tipo', $carrera?->tipo) }}" id="tipo" placeholder="Si">
                <option value="Grado">Grado</option>
                <option value="Postgrado">Postgrado</option>
            </select>
        </div>

        <div class="form-group mb-2 mb20">
            <label for="activo" class="form-label">{{ __('Activo') }}</label>
            <select name="activo" class="form-control @error('activo') is-invalid @enderror" value="{{ old('activo', $carrera?->activo) }}" id="activo" placeholder="Si">
                <option value="Si">Si</option>
                <option value="No">No</option>
            </select>
        </div>

    </div>
    <div class="col-md-12 mt20 mt-2">
        <button type="submit" class="btn btn-primary">{{ __('Submit') }}</button>
    </div>
</div>