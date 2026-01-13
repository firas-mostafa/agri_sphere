<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RoleHasPermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Assign permissions to 'superadmin' role
        $superAdminRole = Role::where('name', 'superadmin')->first();
        $superAdminRole->givePermissionTo(Permission::all()->pluck('name')->toArray());

        // Assign permissions to 'admin' role
        $adminRole = Role::where('name', 'admin')->first();
        $adminRole->givePermissionTo(Permission::orderBy('created_at', 'ASC')->get());
    }
}
