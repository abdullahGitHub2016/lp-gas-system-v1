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
        Schema::create('lot_price_history', function (Blueprint $table) {
            $table->integer('id', true);
            $table->integer('lot_id')->index('lot_id');
            $table->decimal('old_price', 14)->nullable();
            $table->decimal('new_price', 14)->nullable();
            $table->timestamp('changed_at')->nullable()->useCurrent();
            $table->integer('changed_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('lot_price_history');
    }
};
