<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();
Route::resource('aulas', App\Http\Controllers\AulaController::class);
Route::resource('comisiones', App\Http\Controllers\ComisioneController::class);
Route::resource('docentes', App\Http\Controllers\DocenteController::class);
Route::resource('carreras', App\Http\Controllers\CarreraController::class);
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
