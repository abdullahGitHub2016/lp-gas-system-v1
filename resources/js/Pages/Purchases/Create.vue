<script setup>
import { Head, useForm } from '@inertiajs/vue3';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import InputLabel from '@/Components/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import SelectInput from '@/Components/SelectInput.vue';
import DangerButton from '@/Components/DangerButton.vue';
// FIX: Add 'computed' to the import from 'vue'
import { computed } from 'vue'; // <--- ADD THIS LINE

const props = defineProps({
    suppliers: Array,
    lots: Array,
    invoice_no: String,
});

const form = useForm({
    invoice_no: props.invoice_no,
    supplier_id: null,
    purchase_date: new Date().toISOString().slice(0, 10), // Default to today
    items: [
        {
            lot_id: null,
            cylinder_size_id: null, // We'll infer this from the selected lot
            quantity: 1,
            unit_price: 0,
        }
    ],
});

// Computed property to calculate the total amount of the entire purchase
const totalAmount = computed(() => {
    return form.items.reduce((sum, item) => sum + (item.quantity * item.unit_price), 0);
});

// Function to add a new blank item row
const addItem = () => {
    form.items.push({
        lot_id: null,
        cylinder_size_id: null,
        quantity: 1,
        unit_price: 0,
    });
};

// Function to remove an item row
const removeItem = (index) => {
    if (form.items.length > 1) {
        form.items.splice(index, 1);
    }
};

// Function to handle lot selection and update cylinder_size_id
const updateLotData = (index) => {
    const selectedLotId = form.items[index].lot_id;
    const selectedLot = props.lots.find(lot => lot.id === selectedLotId);

    if (selectedLot) {
        // Set the size ID based on the selected lot's data (Crucial for backend validation/storage)
        form.items[index].cylinder_size_id = selectedLot.cylinder_size_id;
    }
};

const submit = () => {
    form.post(route('purchases.store'), {
        preserveScroll: true,
        // The total_amount is calculated in the controller, but we include it here for completeness
        onSuccess: () => form.reset('supplier_id', 'items'),
    });
};
</script>

<template>
    <Head title="Create Purchase" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Create New Purchase</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg p-6">
                    <form @submit.prevent="submit">
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
                            <div>
                                <InputLabel for="invoice_no" value="Invoice No." />
                                <TextInput id="invoice_no" :model-value="form.invoice_no" disabled class="mt-1 block w-full bg-gray-100" />
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
                                <TextInput
                                    id="purchase_date"
                                    type="date"
                                    v-model="form.purchase_date"
                                    class="mt-1 block w-full"
                                    required
                                />
                                <InputError :message="form.errors.purchase_date" class="mt-2" />
                            </div>
                        </div>

                        <h3 class="text-lg font-medium text-gray-900 mb-4">Purchase Items</h3>

                        <div class="overflow-x-auto">
                            <table class="min-w-full divide-y divide-gray-200">
                                <thead class="bg-gray-50">
                                    <tr>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Lot / Size</th>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Quantity</th>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Unit Price</th>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Subtotal</th>
                                        <th class="px-6 py-3"></th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-200">
                                    <tr v-for="(item, index) in form.items" :key="index">
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <SelectInput
                                                v-model="item.lot_id"
                                                :options="lots"
                                                label-key="lot_number"
                                                value-key="id"
                                                @update:modelValue="updateLotData(index)"
                                                :placeholder="'Select Lot (' + item.lot_id + ')'"
                                                class="w-48"
                                                required
                                            />
                                            <p v-if="item.lot_id" class="text-xs text-gray-500 mt-1">
                                                Size: {{ lots.find(l => l.id === item.lot_id)?.cylinder_size?.name }}
                                            </p>
                                            <InputError :message="form.errors[`items.${index}.lot_id`]" class="mt-2" />
                                        </td>

                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <TextInput
                                                type="number"
                                                v-model.number="item.quantity"
                                                min="1"
                                                class="w-24"
                                                required
                                            />
                                            <InputError :message="form.errors[`items.${index}.quantity`]" class="mt-2" />
                                        </td>

                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <TextInput
                                                type="number"
                                                v-model.number="item.unit_price"
                                                step="0.01"
                                                min="0"
                                                class="w-32"
                                                required
                                            />
                                            <InputError :message="form.errors[`items.${index}.unit_price`]" class="mt-2" />
                                        </td>

                                        <td class="px-6 py-4 whitespace-nowrap font-medium">
                                            {{ (item.quantity * item.unit_price).toFixed(2) }}
                                        </td>

                                        <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                            <DangerButton @click="removeItem(index)" :disabled="form.items.length === 1">
                                                Remove
                                            </DangerButton>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="flex justify-between items-center mt-6 pt-4 border-t border-gray-200">
                            <div>
                                <PrimaryButton type="button" @click="addItem">
                                    Add Item
                                </PrimaryButton>
                            </div>
                            <div class="text-xl font-bold">
                                Total Amount: <span class="text-green-600">{{ totalAmount.toFixed(2) }}</span>
                            </div>
                        </div>

                        <div class="flex items-center justify-end mt-8">
                            <PrimaryButton :disabled="form.processing || !form.supplier_id || form.items.length === 0">
                                Create Purchase
                            </PrimaryButton>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
