<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();
Route::resource('aulas', App\Http\Controllers\AulaController::class);
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
