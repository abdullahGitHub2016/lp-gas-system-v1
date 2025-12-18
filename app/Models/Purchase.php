<?php

namespace App\Models;

use App\Models\Lot;
use App\Models\PurchaseItem;
use App\Models\Supplier;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Purchase extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'lot_id',
        'supplier_id',
        'invoice_no',
        'supplier_reference',
        'quantity',
        'purchase_date',
        'created_by',
        'total_amount',
        'created_at'
    ];
    public function lot()
    {
        return $this->hasMany(Lot::class);
    }

    public function supplier()
    {
        return $this->belongsTo(Supplier::class);
    }

    public function items()
    {
        return $this->hasMany(PurchaseItem::class);
    }
}
