<template>
<div>
<router-view></router-view>
  <div>
    <div class="header">
      <div class="header-right iconfont icon-left"></div>
      <div class="header-title">
        发现
      </div>
    </div>
  </div> <!--header-->
<div class="headlist" ref="wrapper">
<div>
<siri-list></siri-list>
<div class="content"></div>
</div>
</div>
</div>
</template>

<script>
import Bscroll from 'better-scroll'
import SiriList from './components/List'
export default {
  name: 'Siri',
  components: {
    SiriList
  },
  mounted () {
    this.scroll = new Bscroll(this.$refs.wrapper)
  }
}
</script>

<style lang="stylus" scoped>
  .headlist
    overflow: hidden
    position: absolute
    top: 1.2rem
    left: 0
    right: 0
    bottom: 1.5rem
  .content
    height: 6.37rem
    //header
  .header
    display: flex
    line-height: 1.1rem
    background: #333
    color: white
  .header-title
    width:.86rem
    flex: 1
    text-align: center
    font-size: .45rem
    margin-bottom: -.2rem
    margin-left: -.9rem
  .header-right
    font-size:.5rem
    margin-left: .3rem
    color: #333
</style>
