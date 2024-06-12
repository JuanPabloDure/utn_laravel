@extends('adminlte::page')

@section('template_title')
    Eventos
@endsection

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <div style="display: flex; justify-content: space-between; align-items: center;">

                            <span id="card_title">
                                {{ __('Eventos') }}
                            </span>

                             <div class="float-right">
                                <a href="{{ route('eventos.create') }}" class="btn btn-primary btn-sm float-right"  data-placement="left">
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
                                        
									<th >Aula Id</th>
									<th >Iddocente</th>
									<th >Idhorario</th>
									<th >Nota</th>

                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($eventos as $evento)
                                        <tr>
                                            <td>{{ ++$i }}</td>
                                            
										<td >{{ $evento->AulaView->name }}</td>
										<td >{{ $evento->DocenteView->nombre }} {{ $evento->DocenteView->apellido }}</td>
										<td >{{ $evento->HorarioView->rangoHorario }}</td>
										<td >{{ $evento->nota }}</td>

                                            <td>
                                                <form action="{{ route('eventos.destroy', $evento->id) }}" method="POST">
                                                    <a class="btn btn-sm btn-primary " href="{{ route('eventos.show', $evento->id) }}"><i class="fa fa-fw fa-eye"></i> {{ __('Show') }}</a>
                                                    <a class="btn btn-sm btn-success" href="{{ route('eventos.edit', $evento->id) }}"><i class="fa fa-fw fa-edit"></i> {{ __('Edit') }}</a>
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
                {!! $eventos->withQueryString()->links() !!}
            </div>
        </div>
    </div>
@endsection
