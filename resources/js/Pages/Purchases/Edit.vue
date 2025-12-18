<script setup>
import { useForm, Link, Head } from '@inertiajs/vue3';
import { computed, onMounted } from 'vue';

const props = defineProps({
    purchase: Object,
    suppliers: Array,
    lots: Array,
});

// INITIALIZATION: We use the optional chaining (?.) and default to an empty array
// to prevent the "length of undefined" error.
const form = useForm({
    supplier_id: props.purchase?.supplier_id ?? '',
    purchase_date: props.purchase?.purchase_date ?? '',
    // Defensive check for items
    items: props.purchase?.items?.map(item => ({
        id: item.id, // Keep the ID for updates
        lot_id: item.lot_id,
        quantity: item.quantity,
        unit_price: item.unit_price
    })) || []
});

const totalAmount = computed(() => {
    return form.items.reduce((total, item) => total + (Number(item.quantity) * Number(item.unit_price)), 0);
});

const addItem = () => {
    form.items.push({ lot_id: '', quantity: 1, unit_price: 0 });
};

const removeItem = (index) => {
    if (form.items.length > 1) {
        form.items.splice(index, 1);
    }
};

const submit = () => {
    form.put(route('purchases.update', props.purchase.id), {
        onSuccess: () => {
            // Optional: Success notification
        }
    });
};
</script>

<template>
    <Head title="Edit Purchase" />

    <div class="max-w-7xl mx-auto p-6 bg-gray-50 min-h-screen">
        <div class="bg-white shadow-sm rounded-lg border border-gray-200 overflow-hidden">

            <div class="px-6 py-4 border-b border-gray-200 flex justify-between items-center bg-gray-50/50">
                <div>
                    <h1 class="text-xl font-bold text-gray-900">Edit Purchase Order</h1>
                    <p class="text-xs text-gray-500">Update details for Invoice: <span class="font-mono font-bold text-indigo-600">{{ purchase.invoice_no }}</span></p>
                </div>
                <Link :href="route('purchases.index')" class="text-sm text-gray-600 hover:text-gray-900 flex items-center">
                    ← Back to List
                </Link>
            </div>

            <form @submit.prevent="submit" class="p-6 space-y-8">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label class="block text-sm font-semibold text-gray-700 mb-2">Supplier</label>
                        <select v-model="form.supplier_id" class="w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500">
                            <option value="">Select Supplier</option>
                            <option v-for="supplier in suppliers" :key="supplier.id" :value="supplier.id">
                                {{ supplier.name }}
                            </option>
                        </select>
                        <div v-if="form.errors.supplier_id" class="text-red-500 text-xs mt-1">{{ form.errors.supplier_id }}</div>
                    </div>

                    <div>
                        <label class="block text-sm font-semibold text-gray-700 mb-2">Purchase Date</label>
                        <input type="date" v-model="form.purchase_date" class="w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500" />
                        <div v-if="form.errors.purchase_date" class="text-red-500 text-xs mt-1">{{ form.errors.purchase_date }}</div>
                    </div>
                </div>

                <div>
                    <div class="flex justify-between items-center mb-4">
                        <h2 class="text-lg font-bold text-gray-800">Order Items</h2>
                        <button type="button" @click="addItem" class="px-3 py-1.5 bg-indigo-50 text-indigo-700 border border-indigo-200 rounded-md text-xs font-bold uppercase hover:bg-indigo-100 transition">
                            + Add Item
                        </button>
                    </div>

                    <div class="border rounded-lg overflow-hidden">
                        <table class="min-w-full divide-y divide-gray-200">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th class="px-4 py-3 text-left text-xs font-bold text-gray-500 uppercase">Lot / Batch</th>
                                    <th class="px-4 py-3 text-left text-xs font-bold text-gray-500 uppercase w-32">Qty</th>
                                    <th class="px-4 py-3 text-left text-xs font-bold text-gray-500 uppercase w-40">Unit Price</th>
                                    <th class="px-4 py-3 text-right text-xs font-bold text-gray-500 uppercase">Subtotal</th>
                                    <th class="px-4 py-3"></th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-200 bg-white">
                                <tr v-for="(item, index) in form.items" :key="index">
                                    <td class="px-4 py-3">
                                        <select v-model="item.lot_id" class="w-full border-gray-300 rounded-md text-sm">
                                            <option v-for="lot in lots" :key="lot.id" :value="lot.id">{{ lot.lot_number }}</option>
                                        </select>
                                    </td>
                                    <td class="px-4 py-3">
                                        <input type="number" v-model="item.quantity" class="w-full border-gray-300 rounded-md text-sm text-center" />
                                    </td>
                                    <td class="px-4 py-3">
                                        <input type="number" step="0.01" v-model="item.unit_price" class="w-full border-gray-300 rounded-md text-sm text-right" />
                                    </td>
                                    <td class="px-4 py-3 text-right text-sm font-medium text-gray-900">
                                        ${{ (item.quantity * item.unit_price).toLocaleString() }}
                                    </td>
                                    <td class="px-4 py-3 text-center">
                                        <button type="button" @click="removeItem(index)" class="text-red-400 hover:text-red-600">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                                                <path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd" />
                                            </svg>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                            <tfoot class="bg-gray-50">
                                <tr>
                                    <td colspan="3" class="px-4 py-4 text-right font-bold text-gray-700 uppercase text-xs">Total Amount:</td>
                                    <td class="px-4 py-4 text-right font-black text-lg text-indigo-700">${{ totalAmount.toLocaleString() }}</td>
                                    <td></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>

                <div class="flex justify-end pt-6 border-t border-gray-200">
                    <button type="submit" :disabled="form.processing" class="px-6 py-2 bg-indigo-600 text-white rounded-md font-bold text-sm uppercase tracking-widest hover:bg-indigo-700 active:bg-indigo-900 transition disabled:opacity-50">
                        {{ form.processing ? 'Saving Changes...' : 'Save Purchase' }}
                    </button>
                </div>
            </form>
        </div>
    </div>
</template>
