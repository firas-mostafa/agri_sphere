<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $data = $request->validate([
            'email' => ['required', 'email', 'max:255', 'unique:users,email'],
            'username' => ['required', 'string', 'max:50', 'unique:users,username'],
            'first_name' => ['required', 'string', 'max:100'],
            'last_name' => ['required', 'string', 'max:100'],
            'phone_number' => ['nullable', 'string', 'max:30'],
            'password' => ['required', 'string', 'min:8'],
            'role' => ['required', Rule::in(['farmer', 'engineer', 'dealer', 'admin'])],
        ]);

        // تأكد أن الـ role موجود في جدول roles
        $role = Role::where('name', $data['role'])->first();
        if (!$role) {
            return response()->json(['message' => 'Role غير موجود. شغّل RoleSeeder أولًا.'], 422);
        }

        $user = User::create([
            'email' => $data['email'],
            'username' => $data['username'],
            'first_name' => $data['first_name'],
            'last_name' => $data['last_name'],
            'phone_number' => $data['phone_number'] ?? null,
            'password' => Hash::make($data['password']),
        ]);

        // ربط المستخدم بالـ role عبر pivot: user_has_roles
        $user->roles()->attach($role->role_id);

        $token = $user->createToken('api')->plainTextToken;

        return response()->json([
            'user' => $user->load('roles'),
            'token' => $token,
        ], 201);
    }

    public function login(Request $request)
    {
        $data = $request->validate([
            'email' => ['required', 'email'],
            'password' => ['required', 'string'],
        ]);

        $user = User::where('email', $data['email'])->first();

        if (!$user || !Hash::check($data['password'], $user->password)) {
            return response()->json(['message' => 'بيانات الدخول غير صحيحة'], 401);
        }

        $token = $user->createToken('api')->plainTextToken;

        return response()->json([
            'user' => $user->load('roles'),
            'token' => $token,
        ]);
    }

    public function me(Request $request)
    {
        return response()->json($request->user()->load('roles'));
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response()->json(['message' => 'تم تسجيل الخروج']);
    }
}