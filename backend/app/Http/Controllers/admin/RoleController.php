<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\role\StoreRoleRequest;
use App\Http\Requests\role\UpdateRoleRequest;
use App\Services\ResponseService;
use App\Services\RoleService;
use Spatie\Permission\Models\Role;

class RoleController extends Controller
{
    private $itemName = "Role";

    // This method will return all roles
    public function index() {
        $roles = Role::orderBy('created_at', 'DESC')->get();

        return ResponseService::allItemsResponse($roles);
    }

    // This method will store a single role in DB
    public function store(StoreRoleRequest $request) {
        $role = RoleService::storeRole($request);

        return ResponseService::successInsertItemResponse($this->itemName, $role);
    }

    // This method will return a single role with specific ID
    public function show(string $id) {
        $role = Role::find($id);

        if ( $role == null ) return ResponseService::itemNotFoundResponse($this->itemName, $id);

        return ResponseService::singleItemsResponse($role);
    }

    // This method will update a single role with specific ID
    public function update(UpdateRoleRequest $request, string $id) {
        $role = RoleService::updateRoleById($request, $id);

        if ( $role == null ) return ResponseService::itemNotFoundResponse($this->itemName, $id);

        return ResponseService::successUpdateItemResponse($this->itemName, $id, $role);
    }

    // This method will delete a single role with specific ID
    public function destroy(string $id) {
        $role = RoleService::deleteRoleById($id);

        if ( $role == null ) return ResponseService::itemNotFoundResponse($this->itemName, $id);

        return ResponseService::successDeleteItemResponse($this->itemName, $id);
    }
}
