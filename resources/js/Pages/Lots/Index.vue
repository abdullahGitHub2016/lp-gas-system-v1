<template>
  <div class="p-6">
    <h1 class="text-2xl font-bold mb-4">All Lots</h1>

    <!-- Debug: check data -->
    <!-- <pre>{{ lots }}</pre> -->

    <table v-if="lots.length" class="min-w-full border border-gray-300">
      <thead class="bg-gray-100">
        <tr>
          <th class="px-4 py-2 border">ID</th>
          <th class="px-4 py-2 border">Lot Number</th>
          <th class="px-4 py-2 border">Company</th>
          <th class="px-4 py-2 border">Cylinder Size</th>
          <th class="px-4 py-2 border">Quantity</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="lot in lots" :key="lot.id" class="border-b">
          <td>{{ lot.id }}</td>
          <td>{{ lot.lot_number }}</td>
          <td>{{ lot.company?.name }}</td>
          <td>{{ lot.cylinder_size?.name }}</td>
          <td>{{ lot.quantity }}</td>
        </tr>
      </tbody>
    </table>

    <p v-else>No lots found.</p>
  </div>
</template>

<script>
export default {
  props: {
    lots: {
      type: Array,
      required: true
    }
  }
}
</script>
