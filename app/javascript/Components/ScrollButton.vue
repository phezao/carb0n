<template>
  <div
    @click="goToElement"
    class="btn btn-primary"
  >
    {{ placeholder }}
  </div>
</template>

<script>
  export default {
    props: {
      id: Number,
      placeholder: {
        type: String,
        required: true
      }
    },
    methods: {
      goToElement(){
        if(this.placeholder === 'Anterior'){
          this.$emit('goToElement', `question-${this.id - 1}`)
        } else{
          this.$emit('goToElement', `question-${this.id + 1}`)
        }
      }
    }
  }
</script>

<style lang="scss" scoped>

</style>
