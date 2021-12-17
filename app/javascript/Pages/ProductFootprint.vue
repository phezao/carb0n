<template>
  <div class="max-w-screen-lg md:mx-auto mx-4 h-full">
    <form class="w-full h-full" @submit.prevent="handleSubmit">
      <div :ref="`question-${questions[0].id}`" class="h-screen flex flex-col justify-center">
        <BaseInput
          v-model="carbon_footprint.red_meat_consumption"
          :question="questions[0].question"
          placeholder="Sua resposta..."
          type="number"
        />
       <ScrollButton class="mt-8 w-24 btn-sm" :id="questions[0].id" placeholder="Próximo" @goToElement="scrollToElement"/>
      </div>
      <div :ref="`question-${questions[1].id}`" class="h-screen flex flex-col justify-center">
        <BaseInput
          :question="questions[1].question"
          placeholder="Sua resposta..."
          type="number"
          v-model="carbon_footprint.white_meat_consumption"
        />
        <div class="flex gap-4">
          <ScrollButton class="mt-8 w-24 btn-sm" :id="questions[1].id" placeholder="Anterior" @goToElement="scrollToElement"/>
          <ScrollButton class="mt-8 w-24 btn-sm" :id="questions[1].id" placeholder="Próximo" @goToElement="scrollToElement"/>
        </div>
      </div>
      <div :ref="`question-${questions[2].id}`" class="h-screen flex flex-col justify-center">
        <BaseInput
          v-model="carbon_footprint.dairy_consumption"
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
          v-model="carbon_footprint.eggs_consumption"
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
          v-model="carbon_footprint.clothes_spending"
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
          v-model="carbon_footprint.furniture_spending"
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
          v-model="carbon_footprint.service_spending"
          :question="questions[6].question"
          placeholder="Sua resposta..."
          type="number"
        />
       <div class="flex gap-4">
         <ScrollButton class="mt-8 w-24 btn-sm" :id="questions[6].id" placeholder="Anterior" @goToElement="scrollToElement"/>
       </div>
      </div>
    </form>
  </div>
</template>

<script>
  import BaseInput from '../Components/BaseInput.vue';
  import ScrollButton from '../Components/ScrollButton.vue';

  export default {
    components: {
      BaseInput,
      ScrollButton,
    },
    props: {
      carbon_footprint: {
        product_footprint_attributes: {
          red_meat_consumption: Number,
          white_meat_consumption: Number,
          dairy_consumption: Number,
          eggs_consumption: Number,
          clothes_spending: Number,
          furniture_spending: Number,
          service_spending: Number,
        },
      }
    },
    data(){
      return {
        questions: [
          {
            id: 1,
            question: "Quantas vezes na semana você consome carne vermelha?",
          },
          {
            id: 2,
            question: "Quantas vezes na semana você consome carne branca?",
          },
          {
            id: 3,
            question: "Quantas vezes na semana você consome derivados do leite?",
          },
          {
            id: 4,
            question: "Quantas vezes na semana você consome ovos?",
          },
          {
            id: 5,
            question: "Quanto reais você gasta por mês com roupas?",
          },
          {
            id: 6,
            question: "Quanto reais você gasta por mês com móveis etc?",
          },
          {
            id: 7,
            question: "Quanto reais você gasta por mês com demais serviços?",
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
