<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\permission\StorePermissionRequest;
use App\Http\Requests\permission\UpdatePermissionRequest;
use App\Services\PermissionService;
use App\Services\ResponseService;
use Spatie\Permission\Models\Permission;

class PermissionController extends Controller
{
    private $itemName = "Permission";
    
    // This method will return all permissions
    public function index() {
        $permissions = PermissionService::showAllPermissions();

        return ResponseService::allItemsResponse($permissions);
    }

    // This method will store a single permission in DB
    public function store(StorePermissionRequest $request) {
        $permission = PermissionService::storePermission($request);

        return ResponseService::successInsertItemResponse($this->itemName, $permission);
    }

    // This method will return a single permission with specific ID
    public function show(string $id) {
        $permission = Permission::findById($id);

        if ( $permission == null ) return ResponseService::itemNotFoundResponse($this->itemName, $id);

        return ResponseService::singleItemsResponse($permission);
    }

    // This method will update a single permission with specific ID
    public function update(UpdatePermissionRequest $request, string $id) {
        $permission = PermissionService::updatePermissionById($request, $id);

        if ( $permission == null ) return ResponseService::itemNotFoundResponse($this->itemName, $id);

        return ResponseService::successUpdateItemResponse($this->itemName, $id, $permission);
    }

    // This method will delete a single permission with specific ID
    public function destroy(string $id) {
        $permission = PermissionService::deletePermissionById($id);

        if ($permission == null) return ResponseService::itemNotFoundResponse($this->itemName, $id);

        return ResponseService::successDeleteItemResponse($this->itemName, $id);
    }
}
