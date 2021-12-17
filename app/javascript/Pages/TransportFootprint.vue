<template>
  <div class="max-w-screen-lg md:mx-auto mx-4 h-full">
    <div class="w-full h-full">
      <div :ref="`question-${questions[0].id}`" class="h-screen flex flex-col justify-center">
        <BaseInput
          v-model="carbon_footprint.weekly_km_car"
          :question="questions[0].question"
          placeholder="Sua resposta..."
          type="number"
        />
       <ScrollButton class="mt-8 w-24 btn-sm" :id="questions[0].id" placeholder="Próximo" @goToElement="scrollToElement"/>
      </div>
      <div :ref="`question-${questions[1].id}`" class="h-screen flex flex-col justify-center">
        <BaseSelect
          :question="questions[1].question"
          :options="questions[1].options"
          v-model="carbon_footprint.vehicle_fuel"
        />
        <div class="flex gap-4">
          <ScrollButton class="mt-8 w-24 btn-sm" :id="questions[1].id" placeholder="Anterior" @goToElement="scrollToElement"/>
          <ScrollButton class="mt-8 w-24 btn-sm" :id="questions[1].id" placeholder="Próximo" @goToElement="scrollToElement"/>
        </div>
      </div>
      <div :ref="`question-${questions[2].id}`" class="h-screen flex flex-col justify-center">
        <BaseInput
          v-model="carbon_footprint.vehicle_efficiency"
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
          v-model="carbon_footprint.weekly_km_bus"
          :question="questions[3].question"
          placeholder="Sua resposta..."
          type="number"
        />
        <div class="flex gap-4">
          <ScrollButton class="mt-8 w-24 btn-sm" :id="questions[3].id" placeholder="Anterior" @goToElement="scrollToElement"/>
          <ScrollButton class="mt-8 w-24 btn-sm" :id="questions[3].id" placeholder="Próximo" @goToElement="scrollToElement"/>
        </div>
      </div>
      <div :ref="`question-${questions[4].id}`" class="h-screen flex flex-col justify-center">
        <BaseInput
          v-model="carbon_footprint.weekly_km_train"
          :question="questions[4].question"
          placeholder="Sua resposta..."
          type="number"
        />
        <div class="flex gap-4">
         <ScrollButton class="mt-8 w-24 btn-sm" :id="questions[4].id" placeholder="Anterior" @goToElement="scrollToElement"/>
         <ScrollButton class="mt-8 w-24 btn-sm" :id="questions[4].id" placeholder="Próximo" @goToElement="scrollToElement"/>
        </div>
      </div>
      <div :ref="`question-${questions[5].id}`" class="h-screen flex flex-col justify-center">
        <BaseInput
          v-model="carbon_footprint.weekly_km_metro"
          :question="questions[5].question"
          placeholder="Sua resposta..."
          type="number"
        />
        <div class="flex gap-4">
         <ScrollButton class="mt-8 w-24 btn-sm" :id="questions[5].id" placeholder="Anterior" @goToElement="scrollToElement"/>
         <ScrollButton class="mt-8 w-24 btn-sm" :id="questions[5].id" placeholder="Próximo" @goToElement="scrollToElement"/>
       </div>
      </div>
      <div :ref="`question-${questions[6].id}`" class="h-screen flex flex-col justify-center">
        <BaseInput
          v-model="carbon_footprint.short_flights_year"
          :question="questions[6].question"
          placeholder="Sua resposta..."
          type="number"
        />
       <div class="flex gap-4">
         <ScrollButton class="mt-8 w-24 btn-sm" :id="questions[6].id" placeholder="Anterior" @goToElement="scrollToElement"/>
         <ScrollButton class="mt-8 w-24 btn-sm" :id="questions[6].id" placeholder="Próximo" @goToElement="scrollToElement"/>
       </div>
      </div>
      <div :ref="`question-${questions[7].id}`" class="h-screen flex flex-col justify-center">
        <BaseInput
          v-model="carbon_footprint.long_flights_year"
          :question="questions[7].question"
          placeholder="Sua resposta..."
          type="number"
        />
         <div class="flex gap-4">
          <ScrollButton class="mt-8 w-24 btn-sm" :id="questions[7].id" placeholder="Anterior" @goToElement="scrollToElement"/>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import BaseInput from '../Components/BaseInput.vue';
  import BaseSelect from '../Components/BaseSelect.vue';
  import ScrollButton from '../Components/ScrollButton.vue';

  export default {
    components: {
      BaseInput,
      BaseSelect,
      ScrollButton,
    },
    props: {
      carbon_footprint: {
        transport_footprint_attributes: {
          weekly_km_car: Number,
          vehicle_fuel: String,
          vehicle_efficiency: Number,
          weekly_km_bus: Number,
          weekly_km_train: Number,
          weekly_km_metro: Number,
          short_flights_year: Number,
          long_flights_year: Number,
        },
      }
    },
    data(){
      return {
        questions: [
          {
            id: 1,
            question: "Quantos km anda semanalmente de carro/moto?",
          },
          {
            id: 2,
            question: "Qual combustível você abastece seu veículo regularmente?",
            options: ['gasolina','gnv', 'etanol', 'diesel'],
          },
          {
            id: 3,
            question: "Qual a eficiência do seu veículo?",
          },
          {
            id: 4,
            question: "Quantos km anda semanalmente de ônibus?",
          },
          {
            id: 5,
            question: "Quantos km anda semanalmente de trêm?",
          },
          {
            id: 6,
            question: "Quantos km anda semanalmente de metro?",
          },
          {
            id: 7,
            question: "Quantos vôos curtos por ano você pega?",
          },
          {
            id: 8,
            question: "Quantos vôos longos por ano você pega?",
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
