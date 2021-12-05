<template>
  <div class="bg-neutral text-white pt-12 pb-8 px-4">
    <div class="max-w-screen-lg mx-auto flex gap-28">
      <div class="self-center hidden md:block">Logo</div>
      <div class="flex md:flex-row flex-col md:justify-between w-full gap-12">
        <div class="flex flex-col gap-2">
          <h5 class="footer-title">A empresa</h5>
          <a class="link link-hover" href="">A Breeze</a>
          <a class="link link-hover" href="">Sobre nós</a>
          <a class="link link-hover" href="">Nosso Marketplace</a>
          <a class="link link-hover" href="">FAQ</a>
          <a class="link link-hover" href="">Entre em contato</a>
        </div>
        <div class="flex flex-col gap-2">
          <h5 class="footer-title">Projetos</h5>
          <a href="">Como escolhemos</a>
          <a href="">Quais são</a>
          <a href="">Nossos portfólios</a>
        </div>
        <div class="flex flex-col gap-2">
          <h5 class="footer-title">Impacto</h5>
          <a href="">Seu impacto</a>
          <a href="">Nosso impacto</a>
        </div>
        <div class="flex flex-col gap-2">
          <h5 class="footer-title">Seja carbono neutro</h5>
          <a href="">Neutralizar para mim</a>
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
  export default {

  }
</script>

<style lang="scss" scoped>
  a {
    &:hover{
      text-decoration: underline;
    }
  }

</style>
