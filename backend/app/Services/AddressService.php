<?php

namespace App\Services;

use App\Http\Requests\address\StoreAddressRequest;
use App\Models\Address;
use Illuminate\Support\Facades\Validator;
use ReflectionFunctionAbstract;

class AddressService
{
    // This method will show all addresss
    public static function showAllUserAddressses(string $id) {
        $addresss = Address::orderBy('created_at')->get();

        return $addresss;
    }

    // This method will store a single address in DB
    public static function storeAddress($request) {

        $address = AddressService::saveAddressInfo($request, new Address());

        return $address;
    }

    // This method will store a single address in DB
    public static function storeUserAddress($request) {

        $address = Address::where([
                'user_id' => $request->user()->user_id,
                'address_type' => "user_address",
            ])
            ->first();

        $address = AddressService::saveUserAddressInfo($request, $address);

        return $address;
    }

    // This method will update a single address with specific ID
    public static function updateAddressById($request, string $id) {
        $address = Address::find($id);

        if ( $address == null ) return null;

        $address = AddressService::saveAddressInfo($request, $address);

        return $address;
    }
    
    // This method will delete a single address with specific ID
    public static function deleteAddressById(string $id) {
        $address = Address::find($id);

        if ( $address == null ) return null;

        $address->delete();

        return $address;
    }

    // This method will validate the requirement of store specific address along with arguments in DB
    public static function validateStoreAddress($request, $address_type) {
        $addressRules = [
            'address_line1' => "required|string",
            'address_line2' => "nullable|string",
            'city' => "required|string",
            'state' => "nullable|string",
            'country' => "required|string",
            'postal_code' => "nullable|string",
            'address_type' => "required|string|in:".implode(',', $address_type),
        ];

        $validator = Validator::make($request->all(), $addressRules);

        return $validator;
    }


    // ========================= Private Static Methods =========================

    private static function saveAddressInfo($request, $address) {

        $address->user_id = $request->user()->user_id;
        $address->address_line1 = $request->address_line1;
        $address->address_line2 = $request->address_line2;
        $address->city = $request->city;
        $address->state = $request->state;
        $address->postal_code = $request->postal_code;
        $address->country = $request->country;
        $address->address_type = $request->address_type;

        $address->save();

        return $address;
    }

    private static function saveUserAddressInfo($request, $address) {

        $address->user_id = $request->user()->user_id;
        $address->address_line1 = $request->address_line1;
        $address->address_line2 = $request->address_line2;
        $address->city = $request->city;
        $address->state = $request->state;
        $address->postal_code = $request->postal_code;
        $address->country = $request->country;
        $address->address_type = "user_address";

        $address->save();

        return $address;
    }
}
