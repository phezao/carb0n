<template>
  <div class="max-w-screen-lg md:mx-auto mx-4 h-full">
    <div class="w-full h-full">
      <div :ref="`question-${questions[0].id}`" class="h-screen flex flex-col justify-center">
        <BaseSelect
          :question="questions[0].question"
          :options="questions[0].options"
          v-model="carbon_footprint.state_residence"
          :value="carbon_footprint.state_residence"
        />
       <ScrollButton class="mt-8 w-24 btn-sm" :id="questions[0].id" placeholder="Próximo" @goToElement="scrollToElement"/>
      </div>
      <div :ref="`question-${questions[1].id}`" class="h-screen flex flex-col justify-center">
        <BaseSelect
          :question="questions[1].question"
          :options="questions[1].options"
          v-model="carbon_footprint.gas_type"
          :value="carbon_footprint.gas_type"
        />
        <div class="flex gap-4">
          <ScrollButton class="mt-8 w-24 btn-sm" :id="questions[1].id" placeholder="Anterior" @goToElement="scrollToElement"/>
          <ScrollButton class="mt-8 w-24 btn-sm" :id="questions[1].id" placeholder="Próximo" @goToElement="scrollToElement"/>
        </div>
      </div>
      <div :ref="`question-${questions[2].id}`" class="h-screen flex flex-col justify-center">
        <BaseInput
          v-model="carbon_footprint.gas_spending"
          :value="carbon_footprint.gas_spending"
          :question="questions[2].question"
          placeholder="Sua resposta..."
          type="number"
        />
        <div class="flex gap-4">
          <ScrollButton class="mt-8 w-24 btn-sm" :id="questions[2].id" placeholder="Anterior" @goToElement="scrollToElement"/>
          <ScrollButton class="mt-8 w-24 btn-sm" :id="questions[2].id" placeholder="Próximo" @goToElement="scrollToElement"/>
        </div>
      </div>
      <div :ref="`question-${questions[3].id}`" class="h-screen flex flex-col justify-center">
        <BaseInput
          v-model="carbon_footprint.electricity_spending"
          :value="carbon_footprint.electricity_spending"
          :question="questions[3].question"
          placeholder="Sua resposta..."
          type="number"
        />
        <div class="flex gap-4">
          <ScrollButton class="mt-8 w-24 btn-sm" :id="questions[3].id" placeholder="Anterior" @goToElement="scrollToElement"/>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import BaseInput from '../Components/BaseInput.vue';
  import BaseSelect from '../Components/BaseSelect.vue';
  import ScrollButton from '../Components/ScrollButton.vue';
  import ESTADOS from '../sources/estados';

  export default {
    components: {
      BaseInput,
      BaseSelect,
      ScrollButton,
    },
    props: {
      carbon_footprint: {
        energy_footprint_attributes: {
          state_residence: String,
          gas_type: String,
          gas_spending: Number,
          electricity_spending: Number
        },
      }
    },
    data(){
      return {
        questions: [
          {
            id: 1,
            question: "Em qual estado você mora?",
            options: Object.values(ESTADOS)
          },
          {
            id: 2,
            question: "Você usa gás encanado ou botijão?",
            options: ['encanado','botijão'],
          },
          {
            id: 3,
            question: "Quanto você gasta com gás por mês?",
          },
          {
            id: 4,
            question: "Quanto você gasta com eletricidade por mês?",
          },
        ]
      }
    },
    methods: {
      scrollToElement(refName){
        const element = this.$refs[refName]

        element.scrollIntoView();
      },
    }
  }
</script>

<style lang="scss" scoped>

</style>
