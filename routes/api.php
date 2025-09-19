<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\MenuController;
use App\Http\Controllers\DatosPersonalesController;
use App\Http\Controllers\UserController;


Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::prefix('auth')->group(function () {
    // Rutas de autenticación en routes/api.php
    Route::post('/register', [App\Http\Controllers\Api\AuthController::class, 'register']);
    Route::post('/login', [App\Http\Controllers\Api\AuthController::class, 'login']);
    
    // Rutas protegidas con autenticación
    Route::middleware('auth:sanctum')->group(function () {
        Route::get('/user', [App\Http\Controllers\Api\AuthController::class, 'user']);
        Route::post('/logout', [App\Http\Controllers\Api\AuthController::class, 'logout']);
        Route::put('/deactivate', [App\Http\Controllers\Api\AuthController::class, 'deactivate']);
        Route::delete('/delete', [App\Http\Controllers\Api\AuthController::class, 'delete']);

        // Route::get('/menu', [MenuController::class, 'getMenu']);
    
        // Ruta para verificar permisos específicos y 
        // Route::post('/verificar-permiso', [MenuController::class, 'verificarPermiso']);
       

        Route::apiResource('personalsigem', DatosPersonalesController::class);
        Route::get('personalsigem/personalwithOutUser', [DatosPersonalesController::class, 'personalwithOutUser']);
        Route::apiResource('users', UserController::class);
    });
});

Route::get('/test', function () {
    return response()->json(['message' => 'Sin autenticación']);
});