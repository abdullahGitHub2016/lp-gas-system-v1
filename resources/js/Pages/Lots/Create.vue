<template>
  <div class="p-6">
    <h1 class="text-2xl font-bold mb-4">Add New Lot</h1>

    <form @submit.prevent="submit">
      <div class="mb-4">
        <label>Lot Number</label>
        <input v-model="form.lot_number" type="text" class="border px-3 py-2 w-full" />
      </div>

      <div class="mb-4">
        <label>Company</label>
        <select v-model="form.company_id" class="border px-3 py-2 w-full">
          <option v-for="c in companies" :key="c.id" :value="c.id">{{ c.name }}</option>
        </select>
      </div>

      <div class="mb-4">
        <label>Cylinder Size</label>
        <select v-model="form.cylinder_size_id" class="border px-3 py-2 w-full">
          <option v-for="cs in cylinderSizes" :key="cs.id" :value="cs.id">{{ cs.name }}</option>
        </select>
      </div>

      <div class="mb-4">
        <label>Quantity</label>
        <input v-model="form.quantity" type="number" class="border px-3 py-2 w-full" />
      </div>

      <div class="mb-4">
        <label>Purchase Price</label>
        <input v-model="form.purchase_price" type="number" class="border px-3 py-2 w-full" />
      </div>

      <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded">Save</button>
    </form>
  </div>
</template>

<script>
import { Inertia } from '@inertiajs/inertia';

export default {
  props: {
    companies: Array,
    cylinderSizes: Array
  },
  data() {
    return {
      form: {
        lot_number: '',
        company_id: null,
        cylinder_size_id: null,
        quantity: 0,
        purchase_price: 0
      }
    };
  },
  methods: {
    submit() {
      Inertia.post('/lots', this.form);
    }
  }
}
</script>
