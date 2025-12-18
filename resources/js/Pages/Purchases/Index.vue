<script setup>
import { Link } from '@inertiajs/vue3';

defineProps({
  purchases: Array,
});
</script>

<template>
  <div class="max-w-7xl mx-auto p-6 bg-white shadow rounded">

    <!-- Header -->
    <div class="flex justify-between items-center mb-6">
      <h1 class="text-2xl font-bold">Purchases</h1>

      <Link
        :href="route('purchases.create')"
        class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700"
      >
        + New Purchase
      </Link>
    </div>

    <!-- Table -->
    <div class="overflow-x-auto">
      <table class="min-w-full border border-gray-200">
        <thead class="bg-gray-100">
          <tr>
            <th class="border px-3 py-2 text-left">Invoice</th>
            <th class="border px-3 py-2 text-left">Supplier</th>
            <th class="border px-3 py-2 text-left">Date</th>
            <th class="border px-3 py-2 text-right">Total</th>
            <th class="border px-3 py-2 text-center">Action</th>
          </tr>
        </thead>

        <tbody>
          <tr
            v-for="purchase in purchases"
            :key="purchase.id"
            class="hover:bg-gray-50"
          >
            <td class="border px-3 py-2 font-medium">
              {{ purchase.invoice_no }}
            </td>

            <td class="border px-3 py-2">
              {{ purchase.supplier?.name ?? 'N/A' }}
            </td>

            <td class="border px-3 py-2">
              {{ purchase.purchase_date }}
            </td>

            <td class="border px-3 py-2 text-right">
              {{ purchase.total_amount }}
            </td>

            <td class="border px-3 py-2 text-center space-x-2">
              <Link
                :href="route('purchases.show', purchase.id)"
                class="text-blue-600 hover:underline"
              >
                View
              </Link>

              <Link
                :href="route('purchases.edit', purchase.id)"
                class="text-green-600 hover:underline"
              >
                Edit
              </Link>
            </td>
          </tr>

          <tr v-if="purchases.length === 0">
            <td colspan="5" class="text-center py-4 text-gray-500">
              No purchases found
            </td>
          </tr>
        </tbody>
      </table>
    </div>

  </div>
</template>
