<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
Schema::create('user_has_permission', function (Blueprint $table) {
    $table->unsignedBigInteger('user_id');
    $table->unsignedBigInteger('permission_id');

    $table->primary(['user_id', 'permission_id']);

    $table->foreign('user_id')->references('id')->on('users')->cascadeOnDelete();
    $table->foreign('permission_id')->references('permission_id')->on('permissions')->cascadeOnDelete();
});

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_has_permission');
    }
};
