import axios from 'axios'
import Vue from 'vue'

import { app, plugin } from '@inertiajs/inertia-vue'
import { InertiaProgress } from '@inertiajs/progress'
import VueApexCharts from 'vue-apexcharts';
import Layout from '../Components/Layout.vue'

document.addEventListener('DOMContentLoaded', () => {
  const csrfToken = document.querySelector('meta[name=csrf-token]').content
  axios.defaults.headers.common['X-CSRF-Token'] = csrfToken

  InertiaProgress.init();
  const el = document.getElementById('app')
  const images = require.context('../images', true)
  const imagePath = (name) => images(`./${name}`, true)
  Vue.prototype.imagePath = imagePath


  Vue.use(plugin)
  Vue.use(VueApexCharts)

  Vue.component('apexchart', VueApexCharts);

  new Vue({
    render: h => h(app, {
      props: {
        initialPage: JSON.parse(el.dataset.page),
        resolveComponent: name => {
          let page = require(`../Pages/${name}`).default;
          page.layout = Layout;

          return page;
        },
      },
    }),
  }).$mount(el)
})
