<template>
  <div>
    <h1 :style="{ 'text-align': 'center' }" class="text-red-400 text-4xl font-bold h-full">Hello {{name}}!</h1>
  </div>
</template>

<script>

  export default {


    props: {
      name: { type: String, required: true },
    },
}
</script>
