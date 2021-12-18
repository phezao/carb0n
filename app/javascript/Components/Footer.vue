<template>
  <div class="bg-neutral text-white pt-12 pb-8 px-4">
    <div class="max-w-screen-lg mx-auto flex gap-28">
      <div class="self-center hidden md:block">Logo</div>
      <div class="flex md:flex-row flex-col md:justify-between w-full gap-12">
        <div class="flex flex-col gap-2">
          <h5 class="footer-title">A empresa</h5>
          <a class="link link-hover" href="https://andremcoletta.wixsite.com/carbonoooo">A Breeze</a>
          <a class="link link-hover" href="https://andremcoletta.wixsite.com/carbonoooo/sobre-nós">Sobre nós</a>
          <a class="link link-hover" href="/">Nosso Marketplace</a>
          <a class="link link-hover" href="https://andremcoletta.wixsite.com/carbonoooo/faq">FAQ</a>
          <a class="link link-hover" href="https://andremcoletta.wixsite.com/carbonoooo/sobre-nós">Entre em contato</a>
        </div>
        <div class="flex flex-col gap-2">
          <h5 class="footer-title">Projetos</h5>
          <a href="https://andremcoletta.wixsite.com/carbonoooo/critérios-de-escolha">Como escolhemos</a>
          <a href="https://andremcoletta.wixsite.com/carbonoooo/projetos">Quais são</a>
          <a href="">Nossos portfólios</a>
        </div>
        <div class="flex flex-col gap-2">
          <h5 class="footer-title">Impacto</h5>
          <a href="/">Seu impacto</a>
          <a href="https://andremcoletta.wixsite.com/carbonoooo/nosso-objetivo">Nosso impacto</a>
        </div>
        <div class="flex flex-col gap-2">
          <h5 class="footer-title">Seja carbono neutro</h5>
          <Link href="/calculator">Neutralizar para mim</Link>
          <a href="">Neutralizar para minha empresa</a>
          <a href="">Neutralizar para um evento</a>
        </div>
      </div>
    </div>
    <div class="flex gap-8 mt-12 mx-auto justify-center">
      <p>Copyright	&copy; Breeze Co.</p>
      <a href="">Política de privacidade</a>
    </div>
  </div>
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
  a {
    &:hover{
      text-decoration: underline;
    }
  }

</style>
