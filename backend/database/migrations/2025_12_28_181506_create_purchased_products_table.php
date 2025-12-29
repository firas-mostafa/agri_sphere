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
        Schema::create('purchased_products', function (Blueprint $table) {

            // purchased_product_id is primary and foreign key at the same time, WoW!
            $table->unsignedBigInteger('purchased_product_id')->primary(); // or uuid()
            $table->foreign('purchased_product_id')->references('product_id')->on('products');

            $table->string('product_type')->default('purchased');

            $table->double('price',10,2);
            $table->double('compare_price',10,2)->nullable();
            $table->boolean('is_active')->default(true);

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('purchased_products');
    }
};
