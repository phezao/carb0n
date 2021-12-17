<template>
  <div>
    <component
      :is="steps[currentStep].component"
      :carbon_footprint="carbon_footprint[steps[currentStep].label]"
    />
    <div class="flex gap-4">
      <button v-if="currentStep !== 0" @click="previous" class="mt-8 w-24 btn-sm btn-wide btn btn-secondary">Anterior</button>
      <button v-if="currentStep < steps.length - 1" @click="next" class="mt-8 w-24 btn-sm btn-wide btn btn-secondary">Próximo</button>
      <button v-if="currentStep === steps.length - 1" class="mt-8 w-24 btn-sm btn-wide btn btn-secondary" @click="submit">resultado</button>
    </div>
  </div>
</template>

<script>
import TransportFootprint from './TransportFootprint.vue';
import EnergyFootprint from './EnergyFootprint.vue';
import HomeFootprint from './HomeFootprint.vue';
import ProductFootprint from './ProductFootprint.vue';

  export default {
    components: {
      TransportFootprint,
      EnergyFootprint,
      HomeFootprint,
      ProductFootprint
    },
    data(){
      return {
        carbon_footprint: {
          transport_footprint_attributes: {
            weekly_km_car: '',
            vehicle_fuel: '',
            vehicle_efficiency: '',
            weekly_km_bus: '',
            weekly_km_train: '',
            weekly_km_metro: '',
            short_flights_year: '',
            long_flights_year: '',
          },
          energy_footprint_attributes: {
            state_residence: '',
            gas_type: '',
            gas_spending: '',
            electricity_spending: '',
          },
          home_footprint_attributes: {
            house_size: '',
          },
          product_footprint_attributes: {
            red_meat_consumption: '',
            white_meat_consumption: '',
            dairy_consumption: '',
            eggs_consumption: '',
            clothes_spending: '',
            furniture_spending: '',
            service_spending: '',
          }
        },
        currentStep: 0,
        steps: [
          {
            component: TransportFootprint,
            label: 'transport_footprint_attributes'
          },
          {
            component: EnergyFootprint,
            label: 'energy_footprint_attributes'
          },
          {
            component: HomeFootprint,
            label: 'home_footprint_attributes'
          },
          {
            component: ProductFootprint,
            label: 'product_footprint_attributes'
          },
        ]
      }
    },
    methods: {
      next(){
        return this.currentStep += 1;
      },
      previous(){
        return this.currentStep -= 1;
      },
      submit(){
        const values = {
          carbon_footprint: {
            ...this.carbon_footprint,
            'finished?': true
          }
        };


        this.$inertia.post('/carbon_footprints', values)
      }
    }
  }
</script>

<style lang="scss" scoped>

</style>
