<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sales extends Model
{
    protected $table = 'sales';

    // Only use created_at
    const UPDATED_AT = null;
    protected $fillable = [
        'dealer_id',
        'invoice_no',
        'sale_date',
        'total_amount',
        'discount_amount',
        'vat_amount',
        'paid_amount',
        'status',
        'created_by',
        'remarks'
    ];

    public function items()
    {
        return $this->hasMany(SaleItems::class, 'sale_id', 'id');
    }

    public function dealer()
    {
        return $this->belongsTo(Dealers::class);
    }

    public function cylinderSize()
    {
        return $this->belongsTo(CylinderSize::class, 'cylinder_size_id');
    }

}
