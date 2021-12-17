<template>
  <div class="max-w-screen-lg md:mx-auto mx-4 h-full">
    <div class="w-full h-full">
      <div :ref="`question-${questions[0].id}`" class="h-screen flex flex-col justify-center">
        <BaseInput
          v-model="carbon_footprint.house_size"
          :question="questions[0].question"
          placeholder="Sua resposta..."
          type="number"
        />
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
          house_size: '',
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
      scrollToElement(refName){
        console.log(this.$refs[refName]);
        const element = this.$refs[refName]

        element.scrollIntoView();
      },
    }
  }
</script>

<style lang="scss" scoped>

</style>
