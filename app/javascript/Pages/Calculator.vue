<template>
  <div class="relative">
    <component
      :is="steps[currentStep].component"
      :carbon_footprint="carbon_footprint[steps[currentStep].label]"
      @onPreviousClick="previous"
      @onNextClick="next"
      @onSubmit="submit"
    />
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
    props: {
      origin: String,
      id: Number,
      weekly_km_car: Number,
      vehicle_fuel: String,
      vehicle_efficiency: Number,
      weekly_km_bus: Number,
      weekly_km_train: Number,
      weekly_km_metro: Number,
      short_flights_year: Number,
      long_flights_year: Number,
      state_residence: String,
      gas_type: String,
      gas_spending: Number,
      electricity_spending: Number,
      house_size: Number,
      red_meat_consumption: Number,
      white_meat_consumption: Number,
      dairy_consumption: Number,
      eggs_consumption: Number,
      clothes_spending: Number,
      furniture_spending: Number,
      service_spending: Number,
    },
    data(){
      return {
        carbon_footprint: {
          transport_footprint_attributes: {
            weekly_km_car: this.weekly_km_car,
            vehicle_fuel: this.vehicle_fuel,
            vehicle_efficiency: this.vehicle_efficiency,
            weekly_km_bus: this.weekly_km_bus,
            weekly_km_train: this.weekly_km_train,
            weekly_km_metro: this.weekly_km_metro,
            short_flights_year: this.short_flights_year,
            long_flights_year: this.long_flights_year,
          },
          energy_footprint_attributes: {
            state_residence: this.state_residence,
            gas_type: this.gas_type,
            gas_spending: this.gas_spending,
            electricity_spending: this.electricity_spending,
          },
          home_footprint_attributes: {
            house_size: this.house_size,
          },
          product_footprint_attributes: {
            red_meat_consumption: this.red_meat_consumption,
            white_meat_consumption: this.white_meat_consumption,
            dairy_consumption: this.dairy_consumption,
            eggs_consumption: this.eggs_consumption,
            clothes_spending: this.clothes_spending,
            furniture_spending: this.furniture_spending,
            service_spending: this.service_spending,
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
        window.scrollTo(0,0);
        return this.currentStep += 1;
      },
      previous(){
        window.scrollTo(0,0);
        return this.currentStep -= 1;
      },
      submit(){
        const values = {
          carbon_footprint: {
            ...this.carbon_footprint,
            'finished?': true
          }
        };

        if(this.origin === "new"){
          this.$inertia.post('/carbon_footprints', values)
        }

        this.$inertia.put(`/carbon_footprints/${this.id}`, values)

      }
    }
  }
</script>

<style lang="scss" scoped>

</style>
