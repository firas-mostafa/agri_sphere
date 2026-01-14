<?php

namespace App\Services;

use App\Http\Requests\user\StoreUserRequest;
use App\Http\Requests\user\UpdateUserRequest;
use App\Models\Address;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserService
{
    // This method will show all users
    public static function showAllUsers() {
        $users = User::orderBy('created_at')->get();

        return $users;
    }

    // This method will return complete user info
    public static function userInfo(Request $request) {

        // $user = User::select(
        //     'users.username',
        //     'users.email',
        //     'users.first_name',
        //     'users.last_name',
        //     'users.phone_number',
        //     'A.*',
        // )
        // ->join('addresses as A', 'users.user_id', '=', 'A.user_id')
        // ->where([
        //     'users.user_id' => $request->user()->user_id,
        //     'A.address_type' => "user_address",
        // ])
        // ->get();

        $user = User::with([
            'addresses' => function ($query) {
                $query->where('address_type', 'user_address');
            }
        ])
        ->where([
            'user_id' => $request->user()->user_id,
        ])
        ->get();

        return $user;
    }

    // This method will update complete user info
    public static function updateUserInfo(Request $request) {
        $userId = $request->user()->user_id;
        $user = User::find($userId);

        if ( $user == null ) return null;

        $user = UserService::saveUserInfo($request, $user);

        return $user;
    }

    // This method will store a single user in DB
    public static function storeUser(StoreUserRequest $request) {
        $data = $request->validated();

        $user = new User();

        $user->username = $data['username'];
        $user->email = $data['email'];
        $user->password = Hash::make($data['password']);
        $user->first_name = $request->first_name;
        $user->last_name = $request->last_name;
        $user->phone_number = $request->phone_number;

        $user->save();

        return $user;
    }

    // This method will update a single user with specific ID
    public static function updateUserById(UpdateUserRequest $request, string $id) {
        $user = user::find($id);

        if ( $user == null ) return null;

        $user = UserService::editUserInfo($request, $user);

        $user->syncRoles($request->roles ?? []);

        return $user;
    }
    
    // This method will delete a single user with specific ID
    public static function deleteUserById(string $id) {
        $user = user::find($id);

        if ( $user == null ) return null;

        $user->delete();

        return $user;
    }

    // This method will validate update user requirement
    public static function validateUpdateUser($request) {
        $userRules = [
            'username' => 'required|string',
            'email' => "required|email|unique:users,email,". $request->user()->user_id.',user_id',
            'password' => "sometimes|required|same:password_confirmation|min:6", // 'password' => 'sometimes|required|confirmed|min:6',
            'password_confirmation' => "sometimes|required",
            'first_name' => 'nullable|string',
            'last_name' => 'nullable|string',
            'phone_number' => 'nullable|string|max:20',
        ];

        $validator = Validator::make($request->all(), $userRules);
        
        return $validator;
    }

    // ========================= Private Static Methods =========================

    private static function saveUserInfo(Request $request, User $user) {

        $user->username = $request->username;
        $user->email = $request->email;

        if (isset($request->password) && !empty($request->password)) {
            $user->password = Hash::make($request->password);
        }

        $user->first_name = $request->first_name;
        $user->last_name = $request->last_name;
        $user->phone_number = $request->phone_number;

        $user->save();

        return $user;
    }

    private static function editUserInfo(UpdateUserRequest $request, User $user) {
        $data = $request->validated();

        $user->username = $data['username'];
        $user->email = $data['email'];
        if (isset($data['password']) && !empty($data['password'])) {
            $user->password = Hash::make($data['password']);
        }
        $user->first_name = $request->first_name;
        $user->last_name = $request->last_name;
        $user->phone_number = $request->phone_number;

        $user->save();

        return $user;
    }
}
