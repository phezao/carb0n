<template>
  <div class="max-w-screen-lg md:mx-auto mx-4 h-full">
    <div class="w-full h-full">
      <div :ref="`question-${questions[0].id}`" class="h-screen flex flex-col justify-center">
        <BaseInput
          v-model.number="carbon_footprint.house_size"
          :value="carbon_footprint.house_size"
          :question="questions[0].question"
          placeholder="Sua resposta..."
          type="number"
        />
        <div class="flex gap-4">
          <button @click="previous" class="mt-8 w-24 btn-sm btn-wide btn btn-secondary previous-button">Anterior</button>
          <button @click="next" class="mt-8 w-24 btn-sm btn-wide btn btn-secondary next-button">Próximo</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import BaseInput from '../Components/BaseInput.vue';

  export default {
    components: {
      BaseInput,
    },
    props: {
      carbon_footprint: {
        home_footprint_attributes: {
          house_size: Number,
        },
      }
    },
    data(){
      return {
        questions: [
          {
            id: 1,
            question: "Qual o tamanho da sua residência (m²)?",
          },
        ]
      }
    },
    methods: {
      previous(){
        this.$emit('onPreviousClick')
      },
      next(){
        this.$emit('onNextClick')
      }
    }
  }
</script>

<style lang="scss" scoped>

</style>
