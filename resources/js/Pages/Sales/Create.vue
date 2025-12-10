<template>
  <div class="max-w-5xl mx-auto p-6 bg-white rounded shadow">
    <h1 class="text-2xl font-bold mb-6">Create Sale</h1>
    <!-- Debug Blocks (commented out for production) -->
    <!--
    <div class="mb-4">
      <h2 class="font-bold">Debug: Page Props</h2>
      <pre>{{ page.props }}</pre>
    </div>

    <div class="mb-4">
      <h2 class="font-bold">Debug: Dealers</h2>
      <pre>{{ dealers }}</pre>
    </div>

    <div class="mb-4">
      <h2 class="font-bold">Debug: Lots</h2>
      <pre>{{ lots }}</pre>
    </div>

    <div class="mt-4">
      <h2 class="font-bold">Debug: Form Data</h2>
      <pre>{{ form }}</pre>
    </div>
    -->

    <!-- Sale Date -->
    <div class="mb-4">
      <label for="sale_date" class="block font-medium text-gray-700">Sale Date</label>
      <input
        type="date"
        id="sale_date"
        v-model="form.sale_date"
        class="mt-1 block w-full border-gray-300 rounded-md shadow-sm"
      />
      <span v-if="errors.sale_date" class="text-red-500 text-sm">{{ errors.sale_date }}</span>
    </div>

    <!-- Invoice Number -->
    <div class="mb-4">
      <label class="block font-medium text-gray-700">Invoice Number</label>
      <input
        type="text"
        v-model="form.invoice_no"
        readonly
        class="mt-1 block w-full border-gray-300 rounded-md bg-gray-100"
      />
    </div>

    <!-- Dealer Dropdown -->
    <div class="mb-4">
      <label for="dealer" class="block font-medium text-gray-700">Dealer</label>
      <select
        id="dealer"
        v-model="form.dealer_id"
        class="mt-1 block w-full border-gray-300 rounded-md shadow-sm"
      >
        <option value="">Select Dealer</option>
        <option v-for="dealer in dealers" :key="dealer.id" :value="dealer.id">
          {{ dealer.name }} - {{ dealer.contact_person }}
        </option>
      </select>
      <span v-if="errors.dealer_id" class="text-red-500 text-sm">{{ errors.dealer_id }}</span>
    </div>

    <!-- Items Table -->
    <div class="mb-4">
      <h2 class="font-medium mb-2">Items</h2>
      <table class="w-full table-auto border-collapse border border-gray-300">
        <thead>
          <tr class="bg-gray-100">
            <th class="border px-2 py-1 text-left">Lot</th>
            <th class="border px-2 py-1 text-left">Unit Price</th>
            <th class="border px-2 py-1 text-left">Quantity</th>
            <th class="border px-2 py-1 text-left">Total</th>
            <th class="border px-2 py-1 text-center">Actions</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(item, index) in form.items" :key="index">
            <td class="border px-2 py-1">
              <select
                v-model="item.lot_id"
                @change="updateUnitPrice(index)"
                class="border rounded px-1 py-1 w-full"
              >
                <option value="">Select Lot</option>
                <option v-for="lot in lots" :key="lot.id" :value="lot.id">
                  {{ lot.lot_number }} ({{ lot.cylinder_size.name }}) - Remaining: {{ lot.remaining_quantity }}
                </option>
              </select>
              <span v-if="errors.items?.[index]?.lot_id" class="text-red-500 text-sm">
                {{ errors.items[index].lot_id }}
              </span>
            </td>
            <td class="border px-2 py-1">
              <input
                type="number"
                min="0"
                v-model.number="item.unit_price"
                class="border rounded px-1 py-1 w-full"
                readonly
              />
            </td>
            <td class="border px-2 py-1">
              <input
                type="number"
                min="1"
                v-model.number="item.quantity"
                class="border rounded px-1 py-1 w-full"
              />
              <span v-if="errors.items?.[index]?.quantity" class="text-red-500 text-sm">
                {{ errors.items[index].quantity }}
              </span>
            </td>
            <td class="border px-2 py-1 text-right">
              {{ (item.quantity * item.unit_price).toFixed(2) }}
            </td>
            <td class="border px-2 py-1 text-center">
              <button type="button" @click="removeItem(index)" class="text-red-500">Remove</button>
            </td>
          </tr>
        </tbody>
        <tfoot>
          <tr class="bg-gray-100 font-bold">
            <td colspan="3" class="text-right px-2 py-1">Grand Total:</td>
            <td class="text-right px-2 py-1">{{ grandTotal.toFixed(2) }}</td>
            <td></td>
          </tr>
        </tfoot>
      </table>

      <button
        type="button"
        @click="addItem"
        class="mt-2 px-3 py-1 bg-blue-600 text-white rounded hover:bg-blue-700"
      >
        Add Item
      </button>
    </div>

    <!-- Submit -->
    <div class="mt-6">
<button
  type="button"
  @click="submit"
  class="px-4 py-2 bg-green-600 text-white rounded hover:bg-green-700"
>
  Save Sale
</button>

<Link
  type="button"
  :href="route('sales.index')"
  class="inline-flex items-center px-4 py-2 bg-gray-800 text-white font-medium rounded-lg shadow hover:bg-gray-900 transition ml-3"
>
  ← Cancel
</Link>



    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue';
import { usePage, router } from '@inertiajs/vue3';
import { Link } from '@inertiajs/vue3';


// Get props from Inertia
const page = usePage();
const dealers = page.props.dealers || [];
const lots = page.props.lots || [];

// Errors from backend
const errors = ref(page.props.errors || {});

// Form state
const form = ref({
  sale_date: new Date().toISOString().substr(0, 10),
  invoice_no: page.props.invoice_no || '',
  dealer_id: '',
  items: [
    { lot_id: '', quantity: 1, unit_price: 0 },
  ],
});

// Add/remove item
function addItem() {
  form.value.items.push({ lot_id: '', quantity: 1, unit_price: 0 });
}
function removeItem(index) {
  form.value.items.splice(index, 1);
}

// Update unit price when lot changes
function updateUnitPrice(index) {
  const lotId = form.value.items[index].lot_id;
  const lot = lots.find(l => l.id === lotId);
  if (lot) {
    form.value.items[index].unit_price = parseFloat(lot.purchase_price);
  } else {
    form.value.items[index].unit_price = 0;
  }
}

// Computed: grand total
const grandTotal = computed(() => {
  return form.value.items.reduce((sum, item) => sum + (item.quantity * item.unit_price), 0);
});

// Submit form
function submit() {
  router.post('/sales', form.value, {
    onError: (err) => {
      errors.value = err;
    },
    preserveScroll: true,
  });
}
</script>

<style scoped>
table tr:hover {
  background-color: #f3f4f6;
}
</style>
