<template>
  <div class="h-full">
    <Navbar />
    <div class="wrapper">
      <slot />
    </div>
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
    }
  }
</script>

<style lang="scss" scoped>

</style>
