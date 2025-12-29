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
        Schema::create('purchased_order_items', function (Blueprint $table) {
            $table->id('purchased_order_item_id');

            $table->unsignedBigInteger('purchased_order_id'); // or uuid()
            $table->foreign('purchased_order_id')->references('purchased_order_id')->on('purchased_orders')->onDelete('cascade');

            $table->unsignedBigInteger('purchased_product_id'); // or uuid()
            $table->foreign('purchased_product_id')->references('purchased_product_id')->on('purchased_products')->onDelete('cascade');

            $table->string('name');
            $table->integer('quantity');
            $table->decimal('price', 10, 2);
            $table->decimal('price_per_unit', 10, 2);

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('purchased_order_items');
    }
};
