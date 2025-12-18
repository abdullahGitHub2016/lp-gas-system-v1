<script setup>
import { computed } from 'vue';

const props = defineProps({
    modelValue: [String, Number, null],
    options: {
        type: Array,
        required: true,
    },
    valueKey: {
        type: String,
        default: 'id',
    },
    labelKey: {
        type: String,
        default: 'name',
    },
    placeholder: {
        type: String,
        default: 'Please select...',
    },
});

const emit = defineEmits(['update:modelValue']);

const proxyValue = computed({
    get() {
        return props.modelValue;
    },
    set(val) {
        emit('update:modelValue', val);
    },
});
</script>

<template>
    <select
        :class="'border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm ' + $attrs.class"
        v-model="proxyValue"
    >
        <option :value="null" disabled>{{ placeholder }}</option>

        <option
            v-for="option in options"
            :key="option[valueKey]"
            :value="option[valueKey]"
        >
            {{ option[labelKey] }}
        </option>
    </select>
</template>

<style scoped>
/* Optional: Add custom styling if needed */
</style>
