<template>
  <div class="form-control">
    <label class="block text-xl font-semibold">{{question}}</label>
    <input
      v-bind="$attrs"
      class="input input-bordered w-full"
      :value="value"
      @input="updateValue"
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
