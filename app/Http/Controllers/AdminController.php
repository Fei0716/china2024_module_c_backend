<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{
    public function login(Request $request){
        $validated = $request->validate([
            'name' => 'required',
            'password' => 'required',
        ]);

        $admin = Admin::where('name', $validated['name'])->first();

        if($admin && Hash::check($validated['password'], $admin->password)){
            //generate a token
            $token =  hash('sha256', $admin->name);

            //store the token in the row
            $admin->token = $token;
            $admin->save();

            //return the token
            return response()->json([
                'token' => $token,
                'name' => $admin->name,
            ], 200);
        }

        return response()->json([
            'message' => 'Invalid name or password',
        ], 400);
    }

    public function logout(Request $request){
        $token = $request->bearerToken();
        $admin = Admin::where('token', $token)->first();

        $admin->token = null;
        $admin->save();

        return response('Logout successfully' , 200);
    }
}
