<div class="row padding-1 p-1">
    <div class="col-md-12">
        
        <div class="form-group mb-2 mb20">
            <label for="id_materia" class="form-label">{{ __('Idmateria') }}</label>
            <input type="text" name="idMateria" class="form-control @error('idMateria') is-invalid @enderror" value="{{ old('idMateria', $materia?->idMateria) }}" id="id_materia" placeholder="Idmateria">
            {!! $errors->first('idMateria', '<div class="invalid-feedback" role="alert"><strong>:message</strong></div>') !!}
        </div>
        <div class="form-group mb-2 mb20">
            <label for="id_area" class="form-label">{{ __('Idarea') }}</label>
            <input type="text" name="idArea" class="form-control @error('idArea') is-invalid @enderror" value="{{ old('idArea', $materia?->idArea) }}" id="id_area" placeholder="Idarea">
            {!! $errors->first('idArea', '<div class="invalid-feedback" role="alert"><strong>:message</strong></div>') !!}
        </div>
        <div class="form-group mb-2 mb20">
            <label for="nombre" class="form-label">{{ __('Nombre') }}</label>
            <input type="text" name="nombre" class="form-control @error('nombre') is-invalid @enderror" value="{{ old('nombre', $materia?->nombre) }}" id="nombre" placeholder="Nombre">
            {!! $errors->first('nombre', '<div class="invalid-feedback" role="alert"><strong>:message</strong></div>') !!}
        </div>
        <div class="form-group mb-2 mb20">
            <label for="anio" class="form-label">{{ __('Anio') }}</label>
            <input type="text" name="anio" class="form-control @error('anio') is-invalid @enderror" value="{{ old('anio', $materia?->anio) }}" id="anio" placeholder="Anio">
            {!! $errors->first('anio', '<div class="invalid-feedback" role="alert"><strong>:message</strong></div>') !!}
        </div>

    </div>
    <div class="col-md-12 mt20 mt-2">
        <button type="submit" class="btn btn-primary">{{ __('Submit') }}</button>
    </div>
</div>