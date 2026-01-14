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
        Schema::create('products', function (Blueprint $table) {
            $table->id('product_id');

            $table->unsignedBigInteger('category_id'); // or uuid()
            $table->foreign('category_id')->references('category_id')->on('categories')->onDelete('cascade');

            $table->unsignedBigInteger('brand_id')->nullable(); // or uuid()
            $table->foreign('brand_id')->references('brand_id')->on('brands')->onDelete('cascade');

            $table->enum('product_type', ['purchased_product', 'rental_product'])->default('purchased_product');

            $table->string('name');
            $table->string('description')->nullable();
            $table->string('short_description')->nullable();
            $table->string('image')->nullable();
            $table->string('barcode')->nullable();
            $table->string('sku')->unique();
            $table->integer('stock_quantity')->nullable();
            $table->decimal('average_rating',3,2)->nullable();
            $table->integer('total_reviews')->nullable();

            $table->timestamps();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
