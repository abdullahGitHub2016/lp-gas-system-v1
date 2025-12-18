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
        Schema::create('sale_items', function (Blueprint $table) {
            $table->integer('id', true);
            $table->integer('sale_id')->index('sale_id');
            $table->integer('lot_id')->index('lot_id');
            $table->integer('cylinder_size_id')->index('cylinder_size_id');
            $table->integer('quantity');
            $table->decimal('unit_price', 14);
            $table->decimal('subtotal', 14);
            $table->timestamp('created_at')->nullable()->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sale_items');
    }
};
