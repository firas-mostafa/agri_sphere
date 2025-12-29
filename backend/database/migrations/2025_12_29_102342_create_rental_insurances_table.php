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
        Schema::create('rental_insurances', function (Blueprint $table) {
            $table->id('rental_insurance_id');
            $table->double('daily_rate_applied',10,2)->nullable();
            $table->integer('number_of_days')->nullable();
            $table->double('total_cost',10,2)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('rental_insurances');
    }
};
