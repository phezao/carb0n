<template>
  <nav class="bg-white fixed top-0 w-full z-20">
    <div class="max-w-screen-lg mx-auto flex justify-between items-center py-4">
      <div class="font-bold">
        <Link href="/">
          CARBON<span class="text-primary">0</span>
        </Link>
      </div>
      <div class="flex gap-8">
        <a class="border-b-2 hover:border-primary border-white" href="/">Sobre Nós</a>
        <a class="border-b-2 hover:border-primary border-white" href="/">Como funciona</a>
        <a class="border-b-2 hover:border-primary border-white" href="/">Projetos</a>
        <a class="border-b-2 hover:border-primary border-white" href="/">Impacto</a>
      </div>
      <div class="flex gap-4">
        <button class="btn btn-outline rounded-full btn-sm transform hover:-translate-y-2">Log in</button>
        <button class="btn btn-primary rounded-full btn-sm transform hover:-translate-y-2 hover:bg-primary">
          <Link href="/calculator">Neutralizar</Link>
        </button>
      </div>
    </div>
  </nav>
</template>

<script>
  import { Link } from '@inertiajs/inertia-vue'

  export default {
    components: {
      Link
    }
  }
</script>

<style lang="scss" scoped>

</style>
