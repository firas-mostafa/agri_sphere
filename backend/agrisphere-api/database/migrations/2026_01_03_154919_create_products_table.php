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

        $table->foreignId('category_id')
            ->constrained('categories', 'category_id')
            ->cascadeOnDelete();

        $table->foreignId('brand_id')
            ->constrained('brands', 'brand_id')
            ->cascadeOnDelete();

        $table->string('name');
        $table->text('description')->nullable();

        $table->decimal('price', 10, 2)->default(0);
        $table->unsignedInteger('quantity')->default(0);

        $table->enum('status', ['active', 'inactive'])->default('active');

        $table->timestamps();

        $table->unique(['brand_id', 'name']); // يمنع تكرار نفس اسم المنتج داخل نفس البراند
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
