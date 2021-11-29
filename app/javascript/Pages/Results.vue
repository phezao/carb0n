<template>
  <div>
    <h1>Results page!</h1>
    {{carbon_footprint}}
    {{transport_footprint}}
  </div>
</template>

<script>
  export default {
    props: ['carbon_footprint', 'transport_footprint']
  }
</script>

<style lang="scss" scoped>

</style>
