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
        Schema::create('rental_orders', function (Blueprint $table) {

            $table->unsignedBigInteger('rental_order_id')->primary(); // or uuid()
            $table->foreign('rental_order_id')->references('order_id')->on('orders');

            $table->unsignedBigInteger('rental_product_id'); // or uuid()
            $table->foreign('rental_product_id')->references('rental_product_id')->on('rental_products');

            $table->unsignedBigInteger('pickup_location_id'); // or uuid()
            $table->foreign('pickup_location_id')->references('address_id')->on('addresses');

            $table->unsignedBigInteger('dropoff_location_id'); // or uuid()
            $table->foreign('dropoff_location_id')->references('address_id')->on('addresses');

            $table->string('order_type')->default('rental');
            $table->timestamp('actual_pickup_date')->nullable();
            $table->timestamp('actual_dropoff_date')->nullable();

            $table
                ->enum(
                        'rental_status', ['quote', 'confirmed', 'active', 'completed', 'cancelled', 'no_show']
                    )
                ->default('quote');

            $table
                ->enum(
                    'pick_status', ['pending', 'customer_present', 'vehicle_ready', 'completed']
                    )
                ->default('pending');

            $table
                ->enum(
                        'dropoff_status', ['pending', 'vehicle_returned', 'inspection_pending', 'completed']
                    )
                ->default('pending');

            $table->decimal('base_rental_amount', 10, 2);
            $table->decimal('tax_amount', 10, 2)->default(0);
            $table->decimal('insurance_total', 10, 2)->nullable();
            $table->decimal('total_amount', 10, 2);
            $table->decimal('refund_amount', 10, 2);

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('rental_orders');
    }
};
