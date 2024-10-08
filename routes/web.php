<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ConsultaHomeController;

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::resource('aulas', App\Http\Controllers\AulaController::class);
Route::resource('comisiones', App\Http\Controllers\ComisioneController::class);
Route::resource('docentes', App\Http\Controllers\DocenteController::class);
Route::resource('carreras', App\Http\Controllers\CarreraController::class);
Route::resource('asignaturas', App\Http\Controllers\AsignaturaController::class);
Route::resource('horarios', App\Http\Controllers\HorarioController::class);
Route::resource('relaciones', App\Http\Controllers\RelacioneController::class);
Route::resource('roles', App\Http\Controllers\RoleController::class);
Route::resource('auxiliares', App\Http\Controllers\AuxiliareController::class);
Route::resource('turnos', App\Http\Controllers\TurnoController::class);
Route::resource('materias', App\Http\Controllers\MateriaController::class);
Route::resource('eventos', App\Http\Controllers\EventoController::class);


Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::middleware('auth')->post('/api_v1/consulta_home', [ConsultaHomeController::class, 'consulta']);
