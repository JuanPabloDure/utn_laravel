@extends('adminlte::page')

@section('title', 'UTN Rosario')

@section('content_header')
    <h1>UTN Rosario</h1>
@stop
@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <div style="display: flex; justify-content: space-between; align-items: center;">

                            <span id="card_title">
                                {{ __('Comisiones') }}
                            </span>

                             <div class="float-right">
                                <a href="{{ route('comisiones.create') }}" class="btn btn-primary btn-sm float-right"  data-placement="left">
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
                                        <th>Comision</th>
                                        
									<th >Name</th>
									<th >Codigo</th>
									<th >Tipo</th>

                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($comisiones as $comisione)
                                        <tr>
                                            <td>{{ $comisione->comisionNro }}</td>
                                            
										<td >{{ $comisione->name }}</td>
										<td >{{ $comisione->codigo }}</td>
										<td >{{ $comisione->tipo }}</td>
										<td >{{ $comisione->activo }}</td>

                                            <td>
                                                <form action="{{ route('comisiones.destroy', $comisione->idComision) }}" method="POST">
                                                    <a class="btn btn-sm btn-primary " href="{{ route('comisiones.show', $comisione->idComision) }}"><i class="fa fa-fw fa-eye"></i> {{ __('Show') }}</a>
                                                    <a class="btn btn-sm btn-success" href="{{ route('comisiones.edit', $comisione->idComision) }}"><i class="fa fa-fw fa-edit"></i> {{ __('Edit') }}</a>
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
                {!! $comisiones->withQueryString()->links() !!}
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
