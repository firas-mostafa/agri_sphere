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
        Schema::create('purchased_orders', function (Blueprint $table) {

            $table->unsignedBigInteger('purchased_order_id')->primary(); // or uuid()
            $table->foreign('purchased_order_id')->references('order_id')->on('orders')->onDelete('cascade');

            $table->unsignedBigInteger('shipping_address_id')->nullable(); // or uuid()
            $table->foreign('shipping_address_id')->references('address_id')->on('addresses')->onDelete('cascade');

            $table->unsignedBigInteger('billing_address_id')->nullable(); // or uuid()
            $table->foreign('billing_address_id')->references('address_id')->on('addresses')->onDelete('cascade');

            $table->enum('order_type', ['purchased_order'])->default('purchased_order');
            $table->decimal('subtotal', 10, 2);
            $table->decimal('grand_total', 10, 2);

            $table
                ->enum(
                        'order_status', ['pending', 'processing', 'shipped', 'delivered', 'cancelled']
                    )
                ->default('pending');

            $table->timestamp('required_date')->nullable();
            $table->timestamp('shipped_date')->nullable();
            $table->decimal('shipping_fee', 10, 2)->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('purchased_orders');
    }
};
