<?php

namespace App\Http\Controllers;

use App\Models\Purchase;
use App\Models\Lot;
use App\Models\Company;
use App\Models\CylinderSize;
use Illuminate\Http\Request;
use Inertia\Inertia;

class PurchasesController extends Controller
{
    // List all purchases
    public function index()
    {
        $purchases = Purchase::with(['lot.company', 'lot.cylinderSize'])->get();
		//dd($purchases->toArray());		

        return Inertia::render('Purchases/Index', [
            'purchases' => $purchases
        ]);
    }

    // Show create form
    public function create()
    {
        $companies = Company::all();
        $lots = Lot::all();

        return Inertia::render('Purchases/Create', [
            'companies' => $companies,
            'lots' => $lots
        ]);
    }

    // Store purchase
    public function store(Request $request)
    {
        $request->validate([
            'lot_id' => 'required|exists:lots,id',
            'quantity' => 'required|integer|min:1',
            'purchase_price' => 'required|numeric|min:0',
            'purchase_date' => 'required|date',
        ]);

        Purchase::create([
            'lot_id' => $request->lot_id,
            'quantity' => $request->quantity,
            'invoice_no' => $request->invoice_no,
            'supplier_reference' => $request->supplier_reference,
            'created_by' => auth()->id(), // optional
            'created_at' => $request->purchase_date,
        ]);

        // Update remaining quantity in lots
        $lot = Lot::find($request->lot_id);
        $lot->remaining_quantity += $request->quantity;
        $lot->save();

        return redirect()->route('purchases.index')->with('success', 'Purchase added successfully.');
    }
}
