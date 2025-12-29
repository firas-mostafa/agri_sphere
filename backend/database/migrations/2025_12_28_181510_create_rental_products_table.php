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
        Schema::create('rental_products', function (Blueprint $table) {

            $table->unsignedBigInteger('rental_product_id')->primary();
            $table->foreign('rental_product_id')->references('product_id')->on('products');

            $table->string('product_type')->default('rental');

            $table->double('hourly_rate',10,2);
            $table->double('daily_rate',10,2);
            $table->double('weekly_rate',10,2);
            $table->double('monthly_rate',10,2);
            
            $table->enum('transmission', ['automatice', 'manual', 'cvt', 'electric'])->default('automatice');
            $table->enum('fuel_type', ['diesel', 'gasoline', 'electric', 'hybrid', 'plug-in_hybrid'])->default('diesel');
            
            $table
                ->enum(
                        'rent_product_status',
                        ['available', 'rented', 'maintenance', 'cleaning', 'out_of_service']
                    )
                ->default('available');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('rental_products');
    }
};
