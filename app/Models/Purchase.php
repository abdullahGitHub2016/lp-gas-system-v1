<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Purchase extends Model
{
    use HasFactory;

    protected $fillable = [
        'lot_id',
        'invoice_no',
        'supplier_reference',
        'quantity',
        'created_by',
        'created_at'
    ];

    public function lot()
    {
        return $this->belongsTo(Lot::class);
    }
}
