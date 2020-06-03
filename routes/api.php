<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('login', 'AuthController@login');
Route::middleware('auth:api')->group(function(){
    Route::get('/accounts','AccountController@index');
    Route::post('/account/add','AccountController@index');
    Route::put('/account/update/{account}','AccountController@index');
    Route::post('/account/deactivate/{account}','AccountController@index');
});
