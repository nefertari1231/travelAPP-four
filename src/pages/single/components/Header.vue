<template>
<div>
  <div class="header-fixed" :style="opacityStyle" v-show="showHeader">
    <div class="header-right iconfont icon-left"></div>
    <div class="header-title">
      我
    </div>
  </div>
</div>
</template>

<script>
export default {
  name: 'SingleHeader',
  data () {
    return {
      showHeader: true,
      opacityStyle: {
        opacity: 0
      }
    }
  },
  methods: {
    handleTouchMove () {
      const top = document.documentElement.scrollTop
      if (top > 60) {
        let opacity = top / 140
        opacity = opacity > 1 ? 1 : opacity
        this.opacityStyle = {opacity}
        this.showHeader = true
      } else {
        this.showHeader = false
      }
    }
  },
  mounted () {
    window.addEventListener('scroll', this.handleTouchMove)
  }
}
</script>

<style lang="stylus" scoped>
.header-fixed
  z-index: 99
  position: fixed
  top: 0
  left: 0
  right: 0
  display: flex
  line-height: 1.25rem
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
  color: #FFF
</style>
