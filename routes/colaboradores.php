<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ColaboradoresController;

Route::prefix('colaboradores')->controller(ColaboradoresController::class)->group(function () {
    Route::get('/', 'index');
    Route::post('/', 'store');
});