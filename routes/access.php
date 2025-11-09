<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ModuleManagementController;

Route::prefix('modules/access')->controller(ModuleManagementController::class)->group(function () {
    Route::get('/user/{userId}', 'getUserAccess');
    Route::post('/module', 'assignModuleAccess');
    Route::post('/submodule', 'assignSubmoduleAccess');
    Route::post('/bulk', 'bulkAssignAccess');
    Route::delete('/revoke', 'revokeAccess');
    Route::delete('/user/{userId}/revoke-all', 'revokeAllUserAccess');
});
