<script setup lang="ts">

interface Props {
  title: string;
  description: string;
}

const props = defineProps<Props>();

</script>

<template>
  <div class="my-3 rounded bg-red-100 px-4 py-3">
    <div class="relative flex flex-row items-center gap-2  text-red-700">
      <inline-svg
        :src="require('images/icons/cross.svg')"
        class="h-4 w-4 fill-red-400"
      />
      <h1 class="text-xl">
        {{ props.title }}
      </h1>
    </div>
    <ul class="list-inside list-disc">
      <li class="px-6 text-sm text-red-700">
        {{ props.description }}
      </li>
    </ul>
  </div>
</template>
