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
        Schema::create('lots', function (Blueprint $table) {
            $table->integer('id', true);
            $table->integer('company_id');
            $table->integer('cylinder_size_id')->index('cylinder_size_id');
            $table->string('lot_number', 100);
            $table->decimal('purchase_price', 14);
            $table->integer('quantity');
            $table->integer('remaining_quantity');
            $table->date('purchase_date');
            $table->date('expiry_date')->nullable();
            $table->text('remarks')->nullable();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->useCurrentOnUpdate()->nullable()->useCurrent();

            $table->unique(['company_id', 'cylinder_size_id', 'lot_number'], 'company_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('lots');
    }
};
