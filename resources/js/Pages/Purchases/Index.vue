<template>
  <div class="p-6">
    <h1 class="text-2xl font-bold mb-4">Purchases</h1>

    <table v-if="purchases.length" class="min-w-full border border-gray-300">
      <thead class="bg-gray-100">
        <tr>
          <th class="px-4 py-2 border">Invoice No</th>
          <th class="px-4 py-2 border">Lot Number</th>
          <th class="px-4 py-2 border">Company</th>
          <th class="px-4 py-2 border">Cylinder Size</th>
          <th class="px-4 py-2 border">Quantity</th>
          <th class="px-4 py-2 border">Purchase Date</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="purchase in purchases" :key="purchase.id" class="border-b">
          <td>{{ purchase.invoice_no }}</td>
          <td>{{ purchase.lot.lot_number }}</td>
          <td>{{ purchase.lot.company?.name }}</td>
          <td>{{ purchase.lot.cylinder_size?.name }}</td>
          <td>{{ purchase.lot.quantity }}</td>
          <td>{{ purchase.lot.purchase_date }}</td>
        </tr>
      </tbody>
    </table>

    <p v-else>No purchases found.</p>
  </div>
</template>

<script>
export default {
  props: {
    purchases: {
      type: Array,
      required: true
    }
  }
}
</script>
