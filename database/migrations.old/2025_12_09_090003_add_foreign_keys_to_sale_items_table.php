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
        Schema::table('sale_items', function (Blueprint $table) {
            $table->foreign(['sale_id'], 'sale_items_ibfk_1')->references(['id'])->on('sales')->onUpdate('no action')->onDelete('no action');
            $table->foreign(['lot_id'], 'sale_items_ibfk_2')->references(['id'])->on('lots')->onUpdate('no action')->onDelete('no action');
            $table->foreign(['cylinder_size_id'], 'sale_items_ibfk_3')->references(['id'])->on('cylinder_sizes')->onUpdate('no action')->onDelete('no action');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('sale_items', function (Blueprint $table) {
            $table->dropForeign('sale_items_ibfk_1');
            $table->dropForeign('sale_items_ibfk_2');
            $table->dropForeign('sale_items_ibfk_3');
        });
    }
};
