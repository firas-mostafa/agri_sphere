<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\user\StoreUserRequest;
use App\Http\Requests\user\UpdateUserRequest;
use App\Models\User;
use App\Services\ResponseService;
use App\Services\UserService;

class UserController extends Controller
{
    private $itemName = "User";

    // This method will return all users
    public function index() {
        $users = UserService::showAllUsers();

        return ResponseService::allItemsResponse($users);
    }

    // This method will store a single user in DB
    public function store(StoreUserRequest $request) {
        $user = UserService::storeUser($request);

        $user->syncRoles($request->roles ?? []);

        // $validator = Validator::make($request->all(), [
        //     'address_line1' => 'required|string',
        //     'address_line2' => 'nullable|string',
        //     'city' => 'required|string',
        //     'state' => 'nullable|string',
        //     'postal_code' => 'nullable|string',
        //     'country' => 'required|string',
        //     'address_type' => 'required|string',
        // ]);

        // if ( $validator->fails() ) {
        //     return response()->json([
        //         'status' => 400,
        //         'errors' => $validator->errors(),
        //     ], 400);
        // }

        // $address = new Address();

        // $address->user_id = $user->id;
        // $address->address_line1 = $request->address_line1;
        // $address->address_line2 = $request->address_line2;
        // $address->city = $request->city;
        // $address->state = $request->state;
        // $address->postal_code = $request->postal_code;
        // $address->country = $request->country;
        // $address->address_type = $request->address_type;

        // $address->save();

        return ResponseService::successInsertItemResponse($this->itemName, $user);
    }

    // This method will return a single user with specific ID
    public function show(string $id) {
        $user = User::find($id);

        if ( $user == null ) return ResponseService::itemNotFoundResponse($this->itemName, $id);

        return ResponseService::singleItemsResponse($user);
    }

    // This method will update a single user with specific ID
    public function update(UpdateUserRequest $request, string $id) {
        $user = UserService::updateUserById($request, $id);

        if ( $user == null ) return ResponseService::itemNotFoundResponse($this->itemName, $id);

        return ResponseService::successUpdateItemResponse($this->itemName, $id, $$user);
    }

    // This method will delete a single user with specific ID
    public function destroy(string $id) {
        $user = UserService::deleteUserById($id);

        if ( $user == null ) return ResponseService::itemNotFoundResponse($this->itemName, $id);

        return ResponseService::successDeleteItemResponse($this->itemName, $id);
    }
}
