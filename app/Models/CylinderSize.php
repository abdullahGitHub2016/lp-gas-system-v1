<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CylinderSize extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'weight_kg', 'description'];

    public function lots()
    {
        return $this->hasMany(Lot::class);
    }
}
 