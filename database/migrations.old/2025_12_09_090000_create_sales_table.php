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
        Schema::create('sales', function (Blueprint $table) {
            $table->integer('id', true);
            $table->integer('dealer_id')->index('dealer_id');
            $table->string('invoice_no', 100)->unique('invoice_no');
            $table->dateTime('sale_date')->nullable()->useCurrent();
            $table->decimal('total_amount', 14);
            $table->decimal('discount_amount', 14)->nullable()->default(0);
            $table->decimal('vat_amount', 14)->nullable()->default(0);
            $table->decimal('paid_amount', 14)->nullable()->default(0);
            $table->enum('status', ['draft', 'posted', 'paid', 'cancelled'])->nullable()->default('draft');
            $table->integer('created_by')->nullable();
            $table->text('remarks')->nullable();
            $table->timestamp('created_at')->nullable()->useCurrent();
            $table->timestamp('updated_at')->useCurrentOnUpdate()->nullable()->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sales');
    }
};
