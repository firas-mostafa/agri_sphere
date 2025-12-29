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
        Schema::create('messages', function (Blueprint $table) {
            $table->id('message_id');

            $table->unsignedBigInteger('conversation_id'); // or uuid()
            $table->foreign('conversation_id')->references('conversation_id')->on('conversations');

            $table->unsignedBigInteger('sender_id'); // or uuid()
            $table->foreign('sender_id')->references('user_id')->on('users');

            $table->unsignedBigInteger('receiver_id'); // or uuid()
            $table->foreign('receiver_id')->references('user_id')->on('users');

            $table->timestamp('read_at')->nullable();

            // Delete Actions
            $table->timestamp('receiver_deleted_at')->nullable();
            $table->timestamp('sender_deleted_at')->nullable();

            $table->text('body')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('messages');
    }
};
