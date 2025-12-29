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
        Schema::create('orders', function (Blueprint $table) {
            $table->id('order_id');

            $table->unsignedBigInteger('user_id'); // or uuid()
            $table->foreign('user_id')->references('user_id')->on('users');

            $table->enum('order_type', ['purchased', 'rental'])->default('purchased');
            $table->date('order_date');
            $table->decimal('discount_amount', 10, 2)->nullable();

            $table->timestamp('canelled_at')->nullable();
            $table->string('cancellation_reason')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
