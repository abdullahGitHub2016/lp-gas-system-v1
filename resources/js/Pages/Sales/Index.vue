<template>
  <div class="p-6">

    <div class="flex justify-between items-center mb-6">
      <h1 class="text-2xl font-bold">Sales</h1>

      <Link
        :href="route('sales.create')"
        class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700"
      >
        New Sale
      </Link>
    </div>


    <table class="w-full border">
      <thead class="bg-gray-100">
        <tr>
          <th class="border px-3 py-2">Invoice</th>
          <th class="border px-3 py-2">Date</th>
          <th class="border px-3 py-2">Total</th>
          <th class="border px-3 py-2">Items</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="sale in sales" :key="sale.id" class="border-b">
          <td class="px-3 py-2">{{ sale.invoice_no }}</td>
          <td class="px-3 py-2">{{ sale.sale_date }}</td>
          <td class="px-3 py-2">{{ sale.total_amount }}</td>
          <td class="px-3 py-2">
            <ul>
              <li v-for="item in sale.items" :key="item.id">
                {{ item.cylinder_size.name }} - {{ item.quantity }} pcs
              </li>
            </ul>
          </td>
    <td class="px-4 py-2 border text-center">
      <Link
        :href="route('sales.show', sale.id)"
        class="px-3 py-1 bg-green-600 text-white rounded hover:bg-green-700"
      >
        View
      </Link>
    </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script setup>
import { Link } from '@inertiajs/vue3';
defineProps({
  sales: Array
});
</script>
