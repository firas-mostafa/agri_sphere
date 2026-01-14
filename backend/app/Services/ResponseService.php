<?php

namespace App\Services;

use App\Http\Requests\brand\StoreBrandRequest;
use App\Models\Brand;

class ResponseService
{
    // This method will return all items response
    public static function allItemsResponse($items) {
        return response()->json([
            'status' => 200,
            'data' => $items,
        ], 200);
    }

    // This method will return a single item response
    public static function singleItemsResponse($item) {
        return response()->json([
            'status' => 200,
            'data' => $item,
        ], 200);
    }

    // This method will return a success response for insert item in DB
    public static function successInsertItemResponse($itemName, $item) {

        return response()->json([
            'status' => 200,
            'message' => $itemName.' has been added succesfully',
            'data' => $item,
        ], 200);
    }

    // This method will return a success response for update item in DB
    public static function successUpdateItemResponse($itemName, $id, $item) {
        return response()->json([
            'status' => 200,
            'message' => $itemName.' with ID: '.$id.' has been updated succesfully',
            'data' => $item,
        ], 200);
    }

    // This method will return a success response for delete item in DB
    public static function successDeleteItemResponse($itemName, $id) {
        return response()->json([
            'status' => 200,
            'message' => $itemName.' with ID: '.$id.' has been deleted successfully',
        ], 200);
    }

    // This method will return item not found response
    public static function itemNotFoundResponse($itemName, $id) {
        return response()->json([
            'status'=> 404,
            'message' => $itemName.' with ID: '.$id.' not found',
            'data' => [],
        ], 404);
    }

    // This method will return a failed response for failed validation
    public static function faliedValidationResponse($validator) {
        return response()->json([
            'status' => 400,
            'errors' => $validator->errors(),
        ], 400);
    }
}
