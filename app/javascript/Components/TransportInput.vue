<template>
  <div class="flex flex-col justify-center h-full form-control">
    <label class="block text-xl font-semibold" :for="name">{{question}}</label>
    <input
      v-if="inputType !== 'select'"
      :type="inputType"
      placeholder="Sua resposta..."
      :name="name"
      class="input input-bordered"
      v-model="value"
    />
    <!-- <select v-if="inputType === 'select'" :name="name" :id="name" class="select select-bordered select-primary w-full" v-model="question.value">
      <option v-for="(option, index) in options" :key="index" :value="option">
        {{option}}
      </option>
    </select> -->
    <div
      v-if="id > firstId"
      @click="scrollToElement(`question-${id - 1}`)"
      class="self-start btn btn-primary"
    >
      anterior
    </div>
    <div
      v-if="id < lastId"
      @click="scrollToElement(`question-${id + 1}`)"
      class="self-start btn btn-primary"
    >
      próximo
    </div>
    <button v-if="id === lastId" class="btn btn-primary" type="submit" @click="submitForm">Ver meu resultado!</button>
  </div>
</template>

<script>
  export default {
    props: ['id', 'name', 'inputType', 'question', 'scrollToElement', 'firstId', 'lastId', 'options'],
    data(){
      return {
        value: ''
      }
    },
    methods: {
      submitForm(){
        this.$emit('submitForm');
      }
    }
  }
</script>

<style lang="scss" scoped>

</style>
