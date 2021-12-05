<template>
  <nav class="bg-white fixed top-0 w-full z-20 py-6 md:py-0">
    <div class="max-w-screen-lg md:mx-auto flex justify-between items-center md:py-4 mx-4">
      <div class="font-bold">
        <Link href="/">
          CARBON<span class="text-primary">0</span>
        </Link>
      </div>
      <div class="md:hidden my-auto">
        <button @click="setMobileNavIsOpen(!mobileNavIsOpen)">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="inline-block w-6 h-6 stroke-current">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
          </svg>
        </button>
      </div>
      <div class="md:flex gap-8 hidden">
        <a class="border-b-2 hover:border-primary border-white" href="/">Sobre Nós</a>
        <a class="border-b-2 hover:border-primary border-white" href="/">Como funciona</a>
        <a class="border-b-2 hover:border-primary border-white" href="/">Projetos</a>
        <a class="border-b-2 hover:border-primary border-white" href="/">Impacto</a>
      </div>
      <div class="md:flex gap-4 hidden">
        <button class="btn btn-outline rounded-full btn-sm transform hover:-translate-y-2">Log in</button>
        <button class="btn btn-primary rounded-full btn-sm transform hover:-translate-y-2 hover:bg-primary">
          <Link href="/calculator">Neutralizar</Link>
        </button>
      </div>
    </div>
    <div :class="{ open: mobileNavIsOpen }" class="px-4 bg-white absolute top-20 left-0 w-full h-screen mobile-navbar">
      <ul class="text-primary font-semibold text-xl mt-4">
        <li><Link class="nav-link" href="/calculator" @click="setMobileNavIsOpen(!mobileNavIsOpen)">Netrualizar</Link></li>
        <li><Link class="nav-link" href="/" @click="setMobileNavIsOpen(!mobileNavIsOpen)">Sobre Nós</Link></li>
        <li><Link class="nav-link" href="/" @click="setMobileNavIsOpen(!mobileNavIsOpen)">Como funciona</Link></li>
        <li><Link class="nav-link" href="/" @click="setMobileNavIsOpen(!mobileNavIsOpen)">Projetos</Link></li>
        <li><Link class="nav-link" href="/" @click="setMobileNavIsOpen(!mobileNavIsOpen)">Impacto</Link></li>
      </ul>
    </div>
  </nav>
</template>

<script>
  import { Link } from '@inertiajs/inertia-vue'

  export default {
    components: {
      Link
    },
    data(){
      return {
        mobileNavIsOpen: false
      }
    },
    methods: {
      setMobileNavIsOpen(value){
        return this.mobileNavIsOpen = value;
      }
    }
  }
</script>

<style lang="scss" scoped>
  .mobile-navbar {
    opacity: 0;
    transition-property: transform, opacity;
    transition-duration: 300ms;
    transform: translateX(-100%);
  }

  li{
    margin-bottom: 2rem;
  }

  .nav-link {
    opacity: 0;
  }

  .open .nav-link {
    transition: opacity 1000ms;
    opacity: 1;
  }

  .open.mobile-navbar {
    opacity: 1;
    transition: transform 300ms ease-in-out;
    transform: translateX(0);
  }
</style>
