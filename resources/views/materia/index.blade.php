@extends('adminlte::page')

@section('template_title')
    Materias
@endsection

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <div style="display: flex; justify-content: space-between; align-items: center;">

                            <span id="card_title">
                                {{ __('Materias') }}
                            </span>

                             <div class="float-right">
                                <a href="{{ route('materias.create') }}" class="btn btn-primary btn-sm float-right"  data-placement="left">
                                  {{ __('Create New') }}
                                </a>
                              </div>
                        </div>
                    </div>
                    @if ($message = Session::get('success'))
                        <div class="alert alert-success m-4">
                            <p>{{ $message }}</p>
                        </div>
                    @endif

                    <div class="card-body bg-white">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead class="thead">
                                    <tr>
                                        <th>No</th>
                                        
									<th >Idmateria</th>
									<th >Idarea</th>
									<th >Nombre</th>
									<th >Anio</th>

                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($materias as $materia)
                                        <tr>
                                            <td>{{ ++$i }}</td>
                                            
										<td >{{ $materia->idMateria }}</td>
										<td >{{ $materia->idArea }}</td>
										<td >{{ $materia->nombre }}</td>
										<td >{{ $materia->anio }}</td>

                                            <td>
                                                <form action="{{ route('materias.destroy', $materia->idMateria) }}" method="POST">
                                                    <a class="btn btn-sm btn-primary " href="{{ route('materias.show', $materia->idMateria) }}"><i class="fa fa-fw fa-eye"></i> {{ __('Show') }}</a>
                                                    <a class="btn btn-sm btn-success" href="{{ route('materias.edit', $materia->idMateria) }}"><i class="fa fa-fw fa-edit"></i> {{ __('Edit') }}</a>
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-danger btn-sm" onclick="event.preventDefault(); confirm('Are you sure to delete?') ? this.closest('form').submit() : false;"><i class="fa fa-fw fa-trash"></i> {{ __('Delete') }}</button>
                                                </form>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                {!! $materias->withQueryString()->links() !!}
            </div>
        </div>
    </div>
@endsection
