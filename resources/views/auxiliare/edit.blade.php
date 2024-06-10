@extends('adminlte::page')

@section('template_title')
    {{ __('Update') }} Auxiliare
@endsection

@section('content')
    <section class="content container-fluid">
        <div class="">
            <div class="col-md-12">

                <div class="card card-default">
                    <div class="card-header">
                        <span class="card-title">{{ __('Update') }} Auxiliare</span>
                    </div>
                    <div class="card-body bg-white">
                        <form method="POST" action="{{ route('auxiliares.update', $auxiliare->id) }}"  role="form" enctype="multipart/form-data">
                            {{ method_field('PATCH') }}
                            @csrf

                            @include('auxiliare.form')

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
