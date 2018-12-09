<template>
<div>
<single-header></single-header>
<div class="singlelist" ref="wrapper">
<div>
<single-banner @select="enterSingle" @login="login"></single-banner>
<single-thumb></single-thumb>
<single-list></single-list>
<div class="content"></div>
</div>
</div>
<router-view></router-view>
</div>
</template>

<script>
import Bscroll from 'better-scroll'
import SingleBanner from './components/Banner'
import SingleHeader from './components/Header'
import SingleThumb from './components/Thumb'
import SingleList from './components/List'
export default {
  name: 'Single',
  components: {SingleBanner,
    SingleHeader,
    SingleThumb,
    SingleList
  },
  mounted () {
    this.scroll = new Bscroll(this.$refs.wrapper)
  },
  methods: {
    enterSingle(single) {
      this.$router.push({
        path: `/single/detail`
      })
    },
    login(single) {
      this.$router.push({
        path: `/single/login`
      })
    }
  }
}
</script>

<style lang="stylus" scoped>
// .singlelist
//   overflow: hidden
//   position: absolute
//   top: 0
//   left: 0
//   right: 0
//   bottom: 1.2rem
.content
  height: 5rem
</style>
