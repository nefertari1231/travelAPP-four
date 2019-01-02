import 'babel-polyfill'
import Vue from 'vue'
import App from './App'
import router from './router'
import fastClick from 'fastclick'
import store from './store/store.js'
import './assets/styles/reset.css'
import './assets/styles/border.css'
import './assets/styles/iconfont.css'
import VueAwesomeSwiper from 'vue-awesome-swiper'
import 'swiper/dist/css/swiper.css'
import animated from 'animate.css'
import Vant from 'vant'
import 'vant/lib/index.css'

Vue.use(Vant)
Vue.config.productionTip = false
fastClick.attach(document.body)
Vue.use(VueAwesomeSwiper)
Vue.use(animated)
Vue.prototype.$toast.setDefaultOptions({
  duration: 500,
  loadingType: 'spinner'
})

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
