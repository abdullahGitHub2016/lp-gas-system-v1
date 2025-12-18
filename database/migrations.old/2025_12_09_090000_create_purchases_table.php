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
        Schema::create('purchases', function (Blueprint $table) {
            $table->integer('id', true);
            $table->foreignId('supplier_id')->constrained('suppliers')->onDelete('cascade');
            $table->integer('lot_id')->index('lot_id');
            $table->string('invoice_no', 100)->nullable();
            $table->date('purchase_date');
            $table->string('supplier_reference')->nullable();
            $table->decimal('total_amount', 10, 2)->default(0);
            $table->integer('created_by')->nullable();
            $table->timestamp('created_at')->nullable()->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('purchases');
    }
};
