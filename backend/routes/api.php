<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\MatchingController;
use App\Http\Controllers\MediaFileController;
use App\Http\Controllers\UserController;
use App\Http\Middleware\Authenticate;
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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::prefix('auth')->group(function () {
    Route::post('login', [AuthController::class, 'login']);
    Route::post('register', [AuthController::class, 'register']);
    Route::post('logout', [AuthController::class, 'logout']);
    Route::post('refresh', [AuthController::class, 'refresh']);
});

Route::prefix('users')->group(function () {
    Route::middleware(Authenticate::class)->group(function (){
        Route::get('suggestions', [UserController::class, 'getSuggestions']);
        Route::prefix('profile')->group(function () {
            Route::get('', [UserController::class, 'getProfile']);
            Route::patch('', [UserController::class, 'updateProfile']);
        });
        Route::get('{id}', [UserController::class, 'getUser']);
        Route::patch('{id}', [UserController::class, 'updateUser']);
    });
});

Route::prefix('matchings')->group(function () {
    Route::middleware(Authenticate::class)->group(function (){
        Route::post('{id}', [MatchingController::class, 'match']);
    });
});

Route::prefix('medias')->group(function () {
    Route::middleware(Authenticate::class)->group(function (){
        Route::post('', [MediaFileController::class, 'upload']);
        Route::post('{id}', [MediaFileController::class, 'update']);
    });
});
