<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\TaskController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::post('/autenticate', [AuthController::class, "login"]);
Route::post('/register', [AuthController::class, 'register']);

Route::middleware(['auth:sanctum'])->group(function () {
    
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
    Route::get("/tasks", [TaskController::class,"index"]);
    Route::post("/tasks", [TaskController::class,"store"]);
    Route::put("/tasks/{task}", [TaskController::class,"update"]);
    Route::delete("/tasks/{task}", [TaskController::class,"destroy"]);
});

