<script setup>
import { Link } from '@inertiajs/vue3';

defineProps({
  purchase: Object,
});
</script>

<template>
  <div class="max-w-6xl mx-auto p-6 bg-white shadow rounded">

    <!-- Header -->
    <div class="flex justify-between items-center mb-6">
      <h1 class="text-2xl font-bold">Purchase Details</h1>

      <Link
        :href="route('purchases.index')"
        class="inline-flex items-center px-4 py-2 bg-gray-800 text-white rounded-lg hover:bg-gray-900 transition"
      >
        ← Back
      </Link>
    </div>

    <!-- Purchase Info -->
    <div class="grid grid-cols-2 gap-4 mb-6">
      <div><strong>Invoice:</strong> {{ purchase.invoice_no }}</div>
      <div><strong>Date:</strong> {{ purchase.purchase_date }}</div>
      <div><strong>Supplier:</strong> {{ purchase.supplier.name }}</div>
      <div><strong>Total Amount:</strong> {{ purchase.total_amount }}</div>
    </div>

    <!-- Items Table -->
    <div class="overflow-x-auto">
      <table class="min-w-full border border-gray-200">
        <thead class="bg-gray-100">
          <tr>
            <th class="border px-3 py-2 text-left">Lot Number</th>
            <th class="border px-3 py-2 text-left">Cylinder Size</th>
            <th class="border px-3 py-2 text-right">Quantity</th>
            <th class="border px-3 py-2 text-right">Unit Price</th>
            <th class="border px-3 py-2 text-right">Subtotal</th>
          </tr>
        </thead>

        <tbody>
          <tr
            v-for="item in purchase.items"
            :key="item.id"
            class="hover:bg-gray-50"
          >
            <td class="border px-3 py-2">
              {{ item.lot?.lot_number ?? 'N/A' }}
            </td>

            <td class="border px-3 py-2">
              {{ item.lot?.cylinderSize?.name ?? 'N/A' }}
            </td>

            <td class="border px-3 py-2 text-right">
              {{ item.quantity }}
            </td>

            <td class="border px-3 py-2 text-right">
              {{ item.unit_price }}
            </td>

            <td class="border px-3 py-2 text-right font-semibold">
              {{ item.quantity * item.unit_price }}
            </td>
          </tr>

          <tr v-if="purchase.items.length === 0">
            <td colspan="5" class="text-center py-4 text-gray-500">
              No items found
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>
