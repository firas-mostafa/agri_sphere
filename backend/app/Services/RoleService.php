<?php

namespace App\Services;

use App\Http\Requests\role\StoreRoleRequest;
use App\Http\Requests\role\UpdateRoleRequest;
use Spatie\Permission\Models\Role;

class RoleService
{
    // This static method will return all categories
    public static function showAllCategoies() {
        $roles = Role::orderBy('created_at', 'DESC')->get();

        return $roles;
    }

    // This static method will store a single role
    public static function storeRole(StoreRoleRequest $request) {
        $data = $request->validated();

        $role = new Role();
        $role->name = $data['name'];

        $role->save();

        if ( !empty($request->permissions) ) {
            foreach ( $request->permissions as $permission ) {
                $role->givePermissionTo($permission);
            }
        }

        return $role;
    }

    // This static method will update a single role with specific ID
    public static function updateRoleById(UpdateRoleRequest $request, string $id) {
        $role = Role::find($id);

        if ( $role == null ) return null;

        $data = $request->validated();

        $role->name = $data['name'];

        $role->save();

        if ( !empty( $request->permissions ) ) {
            $role->syncPermissions($request->permissions);
        } else {
            $role->syncPermissions([]);
        }

        return $role;
    }

    // This static method will delete a single role with specific ID
    public static function deleteRoleById(string $id) {
        $role = Role::find($id);

        if ( $role == null ) return null;

        $role->delete();
    }
}
