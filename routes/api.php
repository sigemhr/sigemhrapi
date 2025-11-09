<?php

use Illuminate\Support\Facades\Route;

// Rutas de autenticación
require __DIR__ . '/auth.php';

// Rutas protegidas con Sanctum
Route::middleware('auth:sanctum')->group(function () {
    require __DIR__ . '/modules.php';
    require __DIR__ . '/submodules.php';
    require __DIR__ . '/access.php';
     require __DIR__ . '/colaboradores.php';
    require __DIR__ . '/departmentsAndGroups.php';
});
