<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PurchaseItem extends Model
{
    use HasFactory;

    protected $fillable = [
        'purchase_id',
        'lot_id',
        'cylinder_size_id',
        'quantity',
        'unit_price',
    ];

    public function purchase()
    {
        return $this->belongsTo(Purchase::class);
    }

    public function lot()
    {
        return $this->belongsTo(Lot::class);
    }

    public function cylinderSize()
    {
        return $this->belongsTo(CylinderSize::class);
    }
}
