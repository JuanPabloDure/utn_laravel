<div class="row padding-1 p-1">
    <div class="col-md-12">
        
        <div class="form-group mb-2 mb20">
            <label for="nombre" class="form-label">{{ __('Nombre') }}</label>
            <input type="text" name="nombre" class="form-control @error('nombre') is-invalid @enderror" value="{{ old('nombre', $relacione?->nombre) }}" id="nombre" placeholder="Nombre">
            {!! $errors->first('nombre', '<div class="invalid-feedback" role="alert"><strong>:message</strong></div>') !!}
        </div>
        <div class="form-group mb-2 mb20">
            <label for="desde" class="form-label">{{ __('Desde') }}</label>
            <input type="text" name="desde" class="form-control @error('desde') is-invalid @enderror" value="{{ old('desde', $relacione?->desde) }}" id="desde" placeholder="Desde">
            {!! $errors->first('desde', '<div class="invalid-feedback" role="alert"><strong>:message</strong></div>') !!}
        </div>
        <div class="form-group mb-2 mb20">
            <label for="hasta" class="form-label">{{ __('Hasta') }}</label>
            <input type="text" name="hasta" class="form-control @error('hasta') is-invalid @enderror" value="{{ old('hasta', $relacione?->hasta) }}" id="hasta" placeholder="Hasta">
            {!! $errors->first('hasta', '<div class="invalid-feedback" role="alert"><strong>:message</strong></div>') !!}
        </div>

    </div>
    <div class="col-md-12 mt20 mt-2">
        <button type="submit" class="btn btn-primary">{{ __('Submit') }}</button>
    </div>
</div>