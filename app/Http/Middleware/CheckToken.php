<?php

namespace App\Http\Middleware;

use App\Models\Admin;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckToken
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        //check validity of token
        $token = $request->bearerToken();

        if(!$token){
            return response()->json([
                'message' => 'Invalid Token'
            ],401);
        }
        $tokenIsValid = Admin::where('token', $token)->exists();

        if(!$tokenIsValid){
            return response()->json([
                'message' => 'Invalid Token'
            ],401);
        }
        //add the admin info to request object
        $admin = Admin::where('token', $token)->first();
        $request->admin = $admin;
        return $next($request);
    }
}
