<template>
  <div>
    <h1 class="text-2xl font-bold mb-4">Lots</h1>
    <table class="min-w-full border">
      <thead>
        <tr class="bg-gray-100 border-b">
          <th>ID</th>
          <th>Lot Number</th>
          <th>Company</th>
          <th>Cylinder Size</th>
          <th>Quantity</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="lot in lots" :key="lot.id" class="border-b">
          <td>{{ lot.id }}</td>
          <td>{{ lot.lot_number }}</td>
          <td>{{ lot.company.name }}</td>
          <td>{{ lot.cylinderSize.name }}</td>
          <td>{{ lot.quantity }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  props: {
    lots: Array
  }
}
</script>
