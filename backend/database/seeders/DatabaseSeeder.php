<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        User::factory()->create([
            'username' => 'Super Admin',
            'email' => 'superadmin@example.com',
        ]);

        User::factory()->create([
            'username' => 'Admin',
            'email' => 'admin@example.com',
        ]);

        $this->call([
            PermissionSeeder::class,
            RoleSeeder::class,
        ]);

        $this->call([
            RoleHasPermissionSeeder::class,
            UserHasRoleSeeder::class,
        ]);

        $this->call([
            CategorySeeder::class,
        ]);
    }
}
