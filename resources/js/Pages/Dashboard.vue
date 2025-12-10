<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, Link } from '@inertiajs/vue3';
</script>

<template>
    <Head title="Dashboard" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="text-xl font-semibold leading-tight text-gray-800">
                Dashboard
            </h2>
        </template>

        <div class="py-12">
            <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">

                <!-- DEFAULT CARD
                <div class="overflow-hidden bg-white shadow-sm sm:rounded-lg mb-8">
                    <div class="p-6 text-gray-900">
                        You're logged in!
                    </div>
                </div>
                -->

                <!-- MENU SECTION -->
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">

                    <!-- Sales Menu -->
                    <Link
                        :href="route('sales.index')"
                        class="block bg-blue-600 hover:bg-blue-700 text-white p-6 rounded-xl shadow-md transition text-center"
                    >
                        <h3 class="text-xl font-semibold">Sales</h3>
                        <p class="mt-2 opacity-80 text-sm">Manage sales, invoices & customers</p>
                    </Link>

                    <!-- Purchase Menu -->
                    <Link
                        :href="route('purchases.index')"
                        class="block bg-green-600 hover:bg-green-700 text-white p-6 rounded-xl shadow-md transition text-center"
                    >
                        <h3 class="text-xl font-semibold">Purchase</h3>
                        <p class="mt-2 opacity-80 text-sm">Manage purchases & suppliers</p>
                    </Link>

                </div>

            </div>
        </div>
    </AuthenticatedLayout>
</template>

