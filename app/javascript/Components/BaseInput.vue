<template>
  <div class="form-control">
    <label class="block text-xl font-semibold mb-8 md:mb-16">{{question}}</label>
    <input
      v-bind="$attrs"
      class="input input-bordered input-primary w-full"
      :value="value"
      @input="updateValue"
      min="0"
    />
  </div>
</template>

<script>
  export default {
    inheritAttrs: false,
    props: {
      question: {
        type: String,
        required: true
      },
      value:  [String, Number],
    },
    methods: {
      updateValue(event){
        this.$emit('input', event.target.value);
      }
    }
  }
</script>

<style lang="scss" scoped>

</style>
