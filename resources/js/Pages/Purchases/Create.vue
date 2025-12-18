<script setup>
// 1. Added Link to the imports
import { Head, useForm, Link } from '@inertiajs/vue3';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import InputLabel from '@/Components/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import SelectInput from '@/Components/SelectInput.vue';
import DangerButton from '@/Components/DangerButton.vue';
import InputError from '@/Components/InputError.vue'; // Added to ensure errors display
import { computed, ref } from 'vue';

const props = defineProps({
    suppliers: Array,
    lots: Array,
    invoice_no: String,
});

// For the Debug Div toggle
const showDebug = ref(false);

const form = useForm({
    invoice_no: props.invoice_no,
    supplier_id: null,
    purchase_date: new Date().toISOString().slice(0, 10),
    items: [
        {
            lot_id: null,
            cylinder_size_id: null,
            quantity: 1,
            unit_price: 0,
        }
    ],
});

const totalAmount = computed(() => {
    return form.items.reduce((sum, item) => sum + (item.quantity * item.unit_price), 0);
});

const addItem = () => {
    form.items.push({ lot_id: null, cylinder_size_id: null, quantity: 1, unit_price: 0 });
};

const removeItem = (index) => {
    if (form.items.length > 1) {
        form.items.splice(index, 1);
    }
};

const updateLotData = (index) => {
    const selectedLotId = form.items[index].lot_id;
    const selectedLot = props.lots.find(lot => lot.id === selectedLotId);
    if (selectedLot) {
        form.items[index].cylinder_size_id = selectedLot.cylinder_size_id;
    }
};

const submit = () => {
    form.post(route('purchases.store'), {
        preserveScroll: true,
        onSuccess: () => form.reset('supplier_id', 'items'),
    });
};
</script>

<template>
    <Head title="Create Purchase" />

    <AuthenticatedLayout>
        <template #header>
            <div class="flex justify-between items-center">
                <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                    Create New Purchase
                </h2>
                <Link
                    :href="route('purchases.index')"
                    class="text-sm font-medium text-gray-600 hover:text-indigo-600 flex items-center transition"
                >
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
                    </svg>
                    Back to List
                </Link>
            </div>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg p-6 border border-gray-200">
                    <form @submit.prevent="submit">
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
                            <div>
                                <InputLabel for="invoice_no" value="Invoice No." />
                                <TextInput id="invoice_no" :model-value="form.invoice_no" disabled class="mt-1 block w-full bg-gray-50 border-gray-200 text-gray-500" />
                            </div>

                            <div>
                                <InputLabel for="supplier_id" value="Supplier" />
                                <SelectInput
                                    id="supplier_id"
                                    v-model="form.supplier_id"
                                    :options="suppliers"
                                    label-key="name"
                                    value-key="id"
                                    class="mt-1 block w-full"
                                    required
                                />
                                <InputError :message="form.errors.supplier_id" class="mt-2" />
                            </div>

                            <div>
                                <InputLabel for="purchase_date" value="Purchase Date" />
                                <TextInput id="purchase_date" type="date" v-model="form.purchase_date" class="mt-1 block w-full" required />
                                <InputError :message="form.errors.purchase_date" class="mt-2" />
                            </div>
                        </div>

                        <h3 class="text-lg font-bold text-gray-800 mb-4 border-b pb-2">Purchase Items</h3>

                        <div class="overflow-x-auto">
                            <table class="min-w-full divide-y divide-gray-200 border rounded-lg">
                                <thead class="bg-gray-50">
                                    <tr>
                                        <th class="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Lot / Size</th>
                                        <th class="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Quantity</th>
                                        <th class="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Unit Price</th>
                                        <th class="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Subtotal</th>
                                        <th class="px-6 py-3"></th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-200">
                                    <tr v-for="(item, index) in form.items" :key="index">
                                        <td class="px-6 py-4">
                                            <SelectInput
                                                v-model="item.lot_id"
                                                :options="lots"
                                                label-key="lot_number"
                                                value-key="id"
                                                @update:modelValue="updateLotData(index)"
                                                class="w-full"
                                            />
                                            <p v-if="item.lot_id" class="text-[10px] text-indigo-600 font-bold mt-1">
                                                ID: {{ item.cylinder_size_id }}
                                            </p>
                                        </td>
                                        <td class="px-6 py-4">
                                            <TextInput type="number" v-model.number="item.quantity" class="w-24" />
                                        </td>
                                        <td class="px-6 py-4">
                                            <TextInput type="number" step="0.01" v-model.number="item.unit_price" class="w-32 text-right" />
                                        </td>
                                        <td class="px-6 py-4 font-bold text-gray-700">
                                            {{ (item.quantity * item.unit_price).toFixed(2) }}
                                        </td>
                                        <td class="px-6 py-4 text-center">
                                            <button type="button" @click="removeItem(index)" class="text-red-500 hover:text-red-700" :disabled="form.items.length === 1">
                                                Remove
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="flex justify-between items-center mt-6">
                            <PrimaryButton type="button" @click="addItem" class="bg-gray-800 text-xs">
                                + Add Row
                            </PrimaryButton>
                            <div class="text-2xl font-black text-gray-900">
                                Total: <span class="text-indigo-600">${{ totalAmount.toFixed(2) }}</span>
                            </div>
                        </div>

                        <div class="flex items-center justify-end mt-10 border-t pt-6">
                            <PrimaryButton class="ml-4" :disabled="form.processing">
                                Save Purchase Record
                            </PrimaryButton>
                        </div>
                    </form>

                    <div class="mt-12 border-t-2 border-dashed pt-8">
                        <label class="flex items-center text-xs text-gray-500 mb-2 cursor-pointer">
                            <input type="checkbox" v-model="showDebug" class="mr-2 rounded"> Show Live Data Debugger
                        </label>
                        <div v-if="showDebug" class="bg-gray-900 p-4 rounded-lg shadow-inner overflow-auto max-h-64">
                            <pre class="text-[10px] text-green-400 font-mono">{{ JSON.stringify(form.data(), null, 2) }}</pre>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
