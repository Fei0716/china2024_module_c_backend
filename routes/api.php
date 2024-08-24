<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\KnowledgeController;
use App\Http\Controllers\TagController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/


Route::prefix('v1')->group(function(){
    Route::get('test', function(){
        return response('working', 200);
    });
    Route::post('admin/login' , [AdminController::class, 'login']);
    //guest routes
    Route::apiResource('knowledge' , KnowledgeController::class)->only('index', 'show');
    Route::apiResource('tag' , TagController::class)->only('index', 'show');
    //routes that require tokens and auth
    Route::middleware('check.token')->group(function(){
        Route::post('admin/logout', [AdminController::class, 'logout']);
        Route::apiResource('knowledge' , KnowledgeController::class)->only('store', 'destroy');
        Route::apiResource('tag' , TagController::class)->only('store', 'index');

    });
});
