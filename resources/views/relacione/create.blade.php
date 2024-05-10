@extends('adminlte::page')

@section('template_title')
    {{ __('Create') }} Relacione
@endsection

@section('content')
    <section class="content container-fluid">
        <div class="row">
            <div class="col-md-12">

                <div class="card card-default">
                    <div class="card-header">
                        <span class="card-title">{{ __('Create') }} Relacione</span>
                    </div>
                    <div class="card-body bg-white">
                        <form method="POST" action="{{ route('relaciones.store') }}"  role="form" enctype="multipart/form-data">
                            @csrf

                            @include('relacione.form')

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
