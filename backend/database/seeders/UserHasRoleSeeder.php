<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UserHasRoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Assign 'superadmin' role to Super Admin user
        $superAdmin = User::where('email', 'superadmin@example.com')->first();
        $superAdmin->assignRole('superadmin');

        // Assign 'admin' role to Admin user
        $admin = User::where('email', 'admin@example.com')->first();
        $admin->assignRole('admin');
    }
}
