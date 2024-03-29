<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    
public function login(Request $request)
    {
        $validation = request()->validate([
            'email'    => 'required|string|email',
            'password' => 'required|string',
        ]);

        if (!auth()->attempt($request->only('email', 'password'))) {
            return \response()->json([
                'message' => 'Usuário ou senha incorretos.',
                'success' => false,
            ]);

        } else {
            $user = User::where('email', $request->email)->first();
            if ($user) {
                return \response()->json([
                    'message' => 'Sucesso!',
                    'success' => true,
                    'token'   => $user->createToken(md5($user->email) . $user->email)->plainTextToken,
                ]);
            }
        }
        return \response()->json([
            'message' => 'Erro inesperado',
            'success' => false,
        ]);
    }

    public function register(Request $request)
    {
        $request->validate([
            'email' => 'required|string|email|unique:users',
            'password' => 'required|string|min:6',
        ]);

        $user = new User([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        $user->save();

        return response()->json(['message' => 'User created successfully'], 201);
    }
}
