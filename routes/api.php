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

Route::middleware('auth:api')->group(function () {

    Route::post('logout', 'AuthController@logout');

    //accounts routes
    Route::get('/accounts', 'AccountController@index');
    Route::post('/account/add', 'AccountController@store');
    Route::put('/account/{account}/update', 'AccountController@update');
    Route::post('/account/{account}/deactivate', 'AccountController@deactivateAccount');

    //Currency routes
    Route::get('/currencies', 'CurrencyController@index');
    //bank routes
    Route::get('/banks', 'BankController@index');
    //account types routes
    Route::get('/account_types', 'AccountTypeController@index');


});
