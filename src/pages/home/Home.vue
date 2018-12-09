<template>
<div>
<home-header @search="search"></home-header>
<div class="headlist" ref="wrapper">
<div>
<home-swiper></home-swiper>
<home-server @select="selectService"></home-server>
<home-share></home-share>
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
export default {
  name: 'Home',
  components: {HomeHeader,
    HomeSwiper,
    HomeServer,
    HomeShare
  },
  mounted () {
    this.scroll = new Bscroll(this.$refs.wrapper)
  },
  methods: {
    selectService(home) {
      this.$router.push({
        path: `home/service`
      })
    },
    search(home) {
      this.$router.push({
        path: `home/search`
      })
    }
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
