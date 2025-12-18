<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Purchase;
use App\Models\Supplier;
use App\Models\Lot;
use Inertia\Inertia;

class PurchasesController extends Controller
{

    public function index()
    {
        $purchases = Purchase::with('supplier')
            ->latest()
            ->get();

        return Inertia::render('Purchases/Index', [
            'purchases' => $purchases,
        ]);
    }
    /**
     * Display a listing of the resource.
     */
    public function create()
    {
        $suppliers = Supplier::all();
        $lots = Lot::with('cylinderSize')->get();

        return Inertia::render('Purchases/Create', [
            'suppliers' => $suppliers,
            'lots' => $lots,
            'invoice_no' => 'INV-' . now()->format('YmdHis')
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'supplier_id' => 'required|exists:suppliers,id',
            'purchase_date' => 'required|date',
            'items.*.lot_id' => 'required|exists:lots,id',
            'items.*.quantity' => 'required|numeric|min:1',
            'items.*.unit_price' => 'required|numeric|min:0',
        ]);

        $purchase = Purchase::create([
            'invoice_no' => $request->invoice_no,
            'purchase_date' => $request->purchase_date,
            'lot_id' => 1,
            'supplier_id' => $request->supplier_id,
            'total_amount' => array_sum(array_map(function ($item) {
                return $item['quantity'] * $item['unit_price'];
            }, $request->items)),
        ]);

        foreach ($request->items as $item) {
            //$lot = Lot::find($item['lot_id']);
            $purchase->items()->create([
                'lot_id' => $item['lot_id'],
                //'cylinder_size_id' => $lot->cylinder_size_id,
                'quantity' => $item['quantity'],
                'unit_price' => $item['unit_price'],
            ]);
        }

        return redirect()->route('purchases.index')->with('success', 'Purchase created successfully');
    }


    /**
     * Display the specified resource.
     */
    public function show(Purchase $purchase)
    {
        // Load all required relations
        $purchase->load([
            'supplier',
            'items.lot.cylinderSize',
        ]);

        return Inertia::render('Purchases/Show', [
            'purchase' => $purchase,
        ]);
    }

    // app/Http/Controllers/PurchasesController.php

    public function edit($id)
    {
        // Eager load the supplier and items with their lots
        $purchase = Purchase::with(['supplier', 'items.lot'])->findOrFail($id);
        $suppliers = Supplier::all();
        $lots = Lot::all();

        return Inertia::render('Purchases/Edit', [
            'purchase' => $purchase,
            'suppliers' => $suppliers,
            'lots' => $lots,
        ]);
    }

    public function update(Request $request, $id)
    {
        $purchase = Purchase::findOrFail($id);

        // 1. Validate
        $validated = $request->validate([
            'supplier_id' => 'required|exists:suppliers,id',
            'purchase_date' => 'required|date',
            'items' => 'required|array|min:1',
            'items.*.lot_id' => 'required|exists:lots,id',
            'items.*.quantity' => 'required|numeric|min:1',
            'items.*.unit_price' => 'required|numeric|min:0',
        ]);

        // 2. Update the main purchase
        $purchase->update([
            'supplier_id' => $request->supplier_id,
            'purchase_date' => $request->purchase_date,
            'total_amount' => collect($request->items)->sum(fn($item) => $item['quantity'] * $item['unit_price']),
        ]);

        // 3. Update Items (Simplest way: Delete old items and recreate)
        $purchase->items()->delete();
        foreach ($request->items as $item) {
            $purchase->items()->create([
                'lot_id' => $item['lot_id'],
                'quantity' => $item['quantity'],
                'unit_price' => $item['unit_price'],
            ]);
        }

        return redirect()->route('purchases.index')->with('success', 'Purchase updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
