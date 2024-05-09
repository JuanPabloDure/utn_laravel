<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();
Route::resource('aulas', App\Http\Controllers\AulaController::class);
Route::resource('comisiones', App\Http\Controllers\ComisioneController::class);
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
