@extends('adminlte::page')

@section('template_title')
    Docentes
@endsection

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <div style="display: flex; justify-content: space-between; align-items: center;">

                            <span id="card_title">
                                {{ __('Docentes') }}
                            </span>

                             <div class="float-right">
                                <a href="{{ route('docentes.create') }}" class="btn btn-primary btn-sm float-right"  data-placement="left">
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
                                        
									<th >Nombre</th>
									<th >Cargo</th>
									<th >Apellido</th>
									<th >Nombre y apellido</th>
									<th >Activo</th>

                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($docentes as $docente)
                                        <tr>
                                            <td>{{ ++$i }}</td>
                                            
										<td >{{ $docente->nombre }}</td>
										<td >{{ $docente->cargo }}</td>
										<td >{{ $docente->apellido }}</td>
										<td >{{ $docente->NombreYapellido }}</td>
										<td >{{ $docente->activo }}</td>

                                            <td>
                                                <form action="{{ route('docentes.destroy', $docente->idDocente) }}" method="POST">
                                                    <a class="btn btn-sm btn-primary " href="{{ route('docentes.show', $docente->idDocente) }}"><i class="fa fa-fw fa-eye"></i> {{ __('Show') }}</a>
                                                    <a class="btn btn-sm btn-success" href="{{ route('docentes.edit', $docente->idDocente) }}"><i class="fa fa-fw fa-edit"></i> {{ __('Edit') }}</a>
                                                    <!--@csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-danger btn-sm" onclick="event.preventDefault(); confirm('Are you sure to delete?') ? this.closest('form').submit() : false;"><i class="fa fa-fw fa-trash"></i> {{ __('Delete') }}</button>
                                                    -->
                                                </form>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                {!! $docentes->withQueryString()->links() !!}
            </div>
        </div>
    </div>
@endsection

@section('css')
    {{-- Add here extra stylesheets --}}
    {{-- <link rel="stylesheet" href="/css/admin_custom.css"> --}}
@stop

@section('js')
    <script> console.log("Hi, I'm using the Laravel-AdminLTE package!"); </script>
@stop

