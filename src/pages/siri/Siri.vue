<template>
<div>
<router-view></router-view>
<siri-header></siri-header>
<div class="headlist" ref="wrapper">
<div>
<siri-list @select="selectSiri"></siri-list>
<div class="content"></div>
</div>
</div>
</div>
</template>

<script>
import Bscroll from 'better-scroll'
import SiriHeader from './components/Header'
import SiriList from './components/List'
export default {
  name: 'Siri',
  components: {SiriHeader,
    SiriList
  },
  mounted () {
    this.scroll = new Bscroll(this.$refs.wrapper)
  },
  methods: {
    selectSiri(siri) {
      if (siri.id !== '0002') {
        this.$router.push({
          path: `/siri/${siri.id}`
        })
      }
    }
  }
}
</script>

<style lang="stylus" scoped>
.headlist
  overflow: hidden
  position: absolute
  top: 1.27rem
  left: 0
  right: 0
  bottom: 1.5rem
.content
  height: 6.37rem
</style>
