<template>
<div>
<home-header :homeTitle="homeTitle"></home-header>
<div class="headlist" ref="wrapper">
<div>
<home-swiper :list="swiperList"></home-swiper>
<home-server :list="serverList"></home-server>
<home-share :list="shareList"></home-share>
</div>
</div>
<transition name="service" tag="div">
<router-view></router-view>
</transition>
</div>
</template>

<script>
import Bscroll from 'better-scroll'
import HomeHeader from './components/Header'
import HomeSwiper from './components/Swiper'
import HomeServer from './components/Server'
import HomeShare from './components/Share'
import axios from 'axios'
export default {
  name: 'Home',
  components: {HomeHeader,
    HomeSwiper,
    HomeServer,
    HomeShare
  },
  data() {
    return {
      homeTitle: '',
      swiperList: [],
      serverList: [],
      shareList: []
    }
  },
  methods: {
    getHomeInfo () {
      axios.get('/static/mock/index.json')
        .then(this.getHomeInfoSucc)
    },
    getHomeInfoSucc (res) {
      res = res.data
      if (res.ret && res.data) {
        const data = res.data
        this.homeTitle = data.homeTitle
        this.swiperList = data.swiperList
        this.serverList = data.serverList
        this.shareList = data.shareList
      }
    }
  },
  mounted () {
    this.scroll = new Bscroll(this.$refs.wrapper)
    this.getHomeInfo()
  }
}
</script>

<style lang="stylus" scoped>
.headlist
  overflow: hidden
  position: absolute
  top: 1.25rem
  left: 0
  right: 0
  bottom: 1.5rem
  z-index:2
.service-enter-active,.service-leave-active
  transition: all 0.3s
.service-enter, .service-leave-to
  transform: translate3d(100%, 0, 0)
</style>
