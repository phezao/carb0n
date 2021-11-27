<template>
  <h1 :style="{ 'text-align': 'center' }" class="text-red-400 text-xl font-bold">Hello {{name}}!</h1>
</template>

<script>
export default {
  props: {
    name: { type: String, required: true },
  },
}
</script>
