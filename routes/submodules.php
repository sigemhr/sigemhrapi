<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ModuleManagementController;

Route::prefix('modules/submodules')->controller(ModuleManagementController::class)->group(function () {
    Route::get('/by-module/{moduleId}', 'getSubmodules');
    Route::get('/{id}', 'showSubmodule');
    Route::post('/', 'storeSubmodule');
    Route::match(['put', 'patch'], '/{id}', 'updateSubmodule');
    Route::delete('/{id}', 'destroySubmodule');
    Route::put('/{id}/toggle-status', 'toggleSubmoduleStatus');
});
   