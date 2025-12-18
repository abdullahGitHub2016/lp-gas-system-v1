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
        Schema::table('lot_price_history', function (Blueprint $table) {
            $table->foreign(['lot_id'], 'lot_price_history_ibfk_1')->references(['id'])->on('lots')->onUpdate('no action')->onDelete('no action');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('lot_price_history', function (Blueprint $table) {
            $table->dropForeign('lot_price_history_ibfk_1');
        });
    }
};
