<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ModuleManagementController;

Route::prefix('modules')->controller(ModuleManagementController::class)->group(function () {
    Route::get('/', 'index');
    Route::get('/user/{userId}', 'getByUser');
    Route::get('/user/{userId}/for-assignment', 'getForPermissionAssignment');
    Route::get('/{id}', 'show');
    Route::post('/', 'store');
    Route::match(['put', 'patch'], '/{id}', 'update');
    Route::delete('/{id}', 'destroy');
    Route::put('/{id}/toggle-status', 'toggleStatus');
    Route::put('/reorder', 'reorder');
});
