<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lot extends Model
{
    use HasFactory;

    protected $fillable = [
        'company_id',
        'cylinder_size_id',
        'lot_number',
        'purchase_price',
        'quantity',
        'remaining_quantity',
        'purchase_date',
        'expiry_date',
        'remarks',
    ];

    // FIXED — Add this relationship
    public function company()
    {
        return $this->belongsTo(Company::class);
    }

    // Additional relationship (needed for your app)
    public function cylinderSize()
    {
        return $this->belongsTo(CylinderSize::class);
    }

    public function cylinder_size()
    {
        return $this->belongsTo(CylinderSize::class, 'cylinder_size_id');
    }


	public function purchases()
	{
		return $this->hasMany(Purchase::class);
	}
    public function saleItems()
    {
        return $this->hasMany(SaleItems::class, 'lot_id', 'id');
    }

}
