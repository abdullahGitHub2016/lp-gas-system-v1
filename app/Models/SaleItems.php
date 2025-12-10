<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SaleItems extends Model
{
    protected $table = 'sale_items';

    // Only use created_at
    const UPDATED_AT = null;

    protected $fillable = [
        'sale_id',
        'lot_id',
        'cylinder_size_id',
        'quantity',
        'unit_price',
        'subtotal'
    ];

    public function sale()
    {
        return $this->belongsTo(Sales::class, 'sale_id', 'id');
    }

    public function lot()
    {
        return $this->belongsTo(Lot::class);
    }

    public function cylinderSize()
    {
        return $this->belongsTo(CylinderSize::class, 'cylinder_size_id');
    }
}
