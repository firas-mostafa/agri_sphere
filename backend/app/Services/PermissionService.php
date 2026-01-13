<?php

namespace App\Services;

use App\Http\Requests\permission\StorePermissionRequest;
use App\Http\Requests\permission\UpdatePermissionRequest;
use Spatie\Permission\Models\Permission;

class PermissionService
{
    // This method will show all permissions
    public static function showAllPermissions() {
        $permissions = Permission::orderBy('created_at')->get();

        return $permissions;
    }

    // This method will store a single permission in DB
    public static function storePermission(StorePermissionRequest $request) {
        $data = $request->validated();

        $permission = new Permission();
        $permission->name = $data['name'];

        $permission->save();

        return $permission;
    }

    // This method will update a single permission with specific ID
    public static function updatePermissionById(UpdatePermissionRequest $request, string $id) {
        $permission = Permission::find($id);

        if ( $permission == null ) return null;

        $data = $request->validated();

        $permission->name = $data['name'];

        $permission->save();

        return $permission;
    }
    
    // This method will delete a single permission with specific ID
    public static function deletePermissionById(string $id) {
        $permission = Permission::find($id);

        if ( $permission == null ) return null;

        $permission->delete();

        return $permission;
    }
}
