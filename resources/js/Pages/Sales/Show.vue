<template>
  <div class="p-6">
    <!--
    <div class="mb-4">
        <h2 class="font-bold">Debug: Page Props</h2>
        <pre>{{ page.props }}</pre>
        </div>
    -->

    <div class="flex justify-between items-center mb-6">
      <h1 class="text-2xl font-bold">Sale Details</h1>
      <div>
            <Link
            :href="route('sales.index')"
            class="inline-flex items-center px-4 py-2 bg-gray-800 text-white font-medium rounded-lg shadow hover:bg-gray-900 transition"
            >
            ← Back
            </Link>
      </div>
    </div>

    <div class="bg-white shadow rounded p-6 mb-6">
      <h2 class="text-xl font-semibold mb-4">Basic Information</h2>

      <p><strong>Invoice No:</strong> {{ sale.invoice_no }}</p>
      <p><strong>Dealer Name:</strong> {{ sale.dealer_name }}</p>
      <p><strong>Sale Date:</strong> {{ sale.sale_date }}</p>
      <p><strong>Total Amount:</strong> {{ sale.total_amount }}</p>
    </div>

    <div class="bg-white shadow rounded p-6">
      <h2 class="text-xl font-semibold mb-4">Sale Items</h2>

      <table class="min-w-full border">
        <thead>
          <tr>
            <th class="px-4 py-2 border">Lot No</th>
            <th class="px-4 py-2 border">Cylinder Size ID</th>
            <th class="px-4 py-2 border">Quantity</th>
            <th class="px-4 py-2 border">Unit Price</th>
            <th class="px-4 py-2 border">Total</th>
          </tr>
        </thead>

        <tbody>
          <tr v-for="item in sale.items" :key="item.lot_no">
            <td class="px-4 py-2 border">{{ item.lot_no }}</td>
            <td class="px-4 py-2 border">{{ item.cylinder_size_id }}</td>
            <td class="px-4 py-2 border">{{ item.quantity }}</td>
            <td class="px-4 py-2 border">{{ item.unit_price }}</td>
            <td class="px-4 py-2 border">{{ item.total }}</td>
          </tr>
        </tbody>
      </table>
    </div>

  </div>
</template>

<script setup>
import { Link, usePage } from "@inertiajs/vue3";

const page = usePage();
const sale = page.props.sale;
</script>
