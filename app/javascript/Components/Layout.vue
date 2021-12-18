<template>
  <div class="h-full">
    <Navbar />
    <transition name="slide-fade" mode="out-in">
      <div v-if="contentTrigger" class="wrapper">
          <slot />
      </div>
    </transition>
    <Footer />
  </div>
</template>

<script>

  import Navbar from './Navbar.vue'
  import Footer from './Footer.vue'

  export default {
    components: {
      Navbar,
      Footer
    },
    data(){
      return {
        contentTrigger: false
      }
    },
    mounted(){
      this.contentTrigger = true;
    }
  }
</script>

<style lang="scss" scoped>
  .slide-fade-enter {
    transform: translateX(10px);
    opacity: 0;
}
  .slide-fade-enter-active,
  .slide-fade-leave-active {
      transition: all .2s ease;
  }
  .slide-fade-leave-to{
    transform: translateX(-10px);
    opacity: 0;
  }
</style>
