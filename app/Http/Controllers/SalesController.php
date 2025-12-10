<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Dealers;
use App\Models\Lot;
use App\Models\Sales;
use App\Models\SaleItems;
use Carbon\Carbon;

class SalesController extends Controller
{
    public function index()
    {
        $sales = Sales::with('items.lot', 'items.cylinderSize')
            ->orderBy('id', 'desc')
            ->get();

        return Inertia::render('Sales/Index', [
            'sales' => $sales
        ]);
    }

    public function create()
    {
        // Fetch dealers and lots
        $dealers = Dealers::all();
        $lots = Lot::with('cylinder_size')->get();

        // Generate auto invoice number
        $invoice_no = 'INV-' . now()->format('YmdHis');


        return Inertia::render('Sales/Create', [
            'dealers' => $dealers,
            'lots' => $lots,
            'invoice_no' => $invoice_no,
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'sale_date' => 'required|date',
            'dealer_id' => 'required|exists:dealers,id',
            'items' => 'required|array|min:1',
            'items.*.lot_id' => 'required|exists:lots,id',
            'items.*.quantity' => 'required|numeric|min:1',
        ]);

        $total_quantity = 0;
        $total_price = 0;

        foreach ($request->items as $item) {
            $lot = Lot::find($item['lot_id']);
            if (!$lot) continue;

            $unit_price = $lot->purchase_price;
            $quantity = $item['quantity'];
            $amount = $unit_price * $quantity;

            $total_quantity += $quantity;
            $total_price += $amount;
        }

        $sale = Sales::create([
            'invoice_no' => $request->invoice_no,
            'sale_date' => $request->sale_date,
            'dealer_id' => $request->dealer_id,
            'total_amount' => $total_price, // make sure this column exists
        ]);

        $total_quantity = 0;

        foreach ($request->items as $item) {
            $lot = Lot::find($item['lot_id']);
            if (!$lot) continue;

            $unit_price = $lot->purchase_price; // Use lot price
            $quantity = $item['quantity'];
            $sub_total = $unit_price * $quantity;

            SaleItems::create([
                'sale_id' => $sale->id,
                'lot_id' => $lot->id,
                'cylinder_size_id' => $lot->cylinder_size_id,
                'quantity' => $quantity,
                'unit_price' => $unit_price,
                'subtotal' => $sub_total,
            ]);

        }
        /*
        $sale->update([
            'total_quantity' => $total_quantity,
            'total_price' => $total_price,
        ]);

        */

        return redirect()->route('sales.index')->with('success', 'Sale created successfully!');
    }

    public function show($id)
    {
        $sale = Sales::with(['dealer', 'items.lot'])
            ->findOrFail($id);

        return Inertia::render('Sales/Show', [
            'sale' => [
                'id' => $sale->id,
                'invoice_no' => $sale->invoice_no,
                'sale_date' => $sale->sale_date,
                'dealer_name' => $sale->dealer->name ?? '',
                'total_amount' => $sale->total_amount,
                'items' => $sale->items->map(function ($item) {
                    return [
                        'lot_no' => $item->lot->lot_no ?? '',
                        'cylinder_size_id' => $item->cylinder_size_id,
                        'quantity' => $item->quantity,
                        'unit_price' => $item->unit_price,
                        'total' => $item->unit_price * $item->quantity,
                    ];
                })
            ]
        ]);
    }

}
