<?php

namespace App\Http\Controllers;

use App\Models\Lot;
use App\Models\Company;
use App\Models\CylinderSize;
use Inertia\Inertia;
use Illuminate\Http\Request;

class LotsController extends Controller
{
    // Display all lots
    public function index()
    {
		$lots = Lot::with(['company', 'cylinderSize'])->get();
		//dd($lots->toArray());
        return Inertia::render('Lots/Index', [
            'lots' => $lots
        ]);
		

    }

    // Show create form
    public function create()
    {
        return Inertia::render('Lots/Create', [
            'companies' => Company::all(),
            'cylinderSizes' => CylinderSize::all(),
        ]);
    }

    // Store a new lot
    public function store(Request $request)
    {
        $request->validate([
            'lot_number' => 'required|unique:lots,lot_number',
            'company_id' => 'required|exists:companies,id',
            'cylinder_size_id' => 'required|exists:cylinder_sizes,id',
            'quantity' => 'required|integer|min:1',
            'purchase_price' => 'required|numeric|min:0'
        ]);

        Lot::create([
            'lot_number' => $request->lot_number,
            'company_id' => $request->company_id,
            'cylinder_size_id' => $request->cylinder_size_id,
            'quantity' => $request->quantity,
            'remaining_quantity' => $request->quantity,
            'purchase_price' => $request->purchase_price,
            'purchase_date' => now(),
        ]);

        return redirect()->route('lots.index');
    }
}
