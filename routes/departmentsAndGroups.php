<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DepartmentsController;

Route::prefix('departmentsandgroups')->controller(DepartmentsController::class)->group(function () {
    Route::get('/getDepartmensAnGroups', 'index');
    Route::get('/getActiveUsers', 'getActiveUsers');
   
});