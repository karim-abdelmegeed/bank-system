<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string'
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        if (!Auth::attempt(['email'=>$request->email,
            'password'=>$request->password])) {
            return response()->json([
                'message' => 'Unauthorized'
            ], 401);
        }
        $tokenResult = auth()->user()->createToken('Personal Access Token');
        $token = $tokenResult->token;
        $token->save();
        return response()->json([
           'access_token'=>$tokenResult->accessToken,
            'user'=> auth()->user()
        ],200);
    }
}
