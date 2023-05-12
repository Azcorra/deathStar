<?php

use App\Http\Controllers\UsuarioController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::prefix('v1/Jedis')->group(function () {
    Route::controller(UsuarioController::class)->group(function () {
        Route::middleware(['guest'])->group(function () {
            Route::get('usuarios', 'index')->name('usuarios');
            Route::post('usuarios/crear', 'store')->name('crear');
            // Route::patch('usuarios/actualizar/{usuario}', 'update')->whereNumber('usuario')->name('actualizar');
            // Route::patch('usuarios/actualizar/{Usuario}', 'update')->name('actualizar');
            Route::patch('usuarios/actualizar', 'update')->name('actualizar');
            Route::delete('usuarios/eliminar/{usuario}', 'destroy')->name('eliminar');
        });
    });
});
