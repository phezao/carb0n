<template>
  <div class="form-control">
    <label class="block text-xl font-semibold mb-16">{{question}}</label>
    <select class="select select-bordered select-primary w-full" :value="value" @change="updateValue">
      <option
        v-for="(option, index) in options"
        :key="index"
        :value="option"
        :selected="option === value"
      >
        {{option}}
      </option>
    </select>
  </div>
</template>

<script>
  export default {
    props: {
      question: {
        type: String,
        required: true
      },
      options: {
        type: Array,
        required: true
      },
      value: [String, Number]
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
