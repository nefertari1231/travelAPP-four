<template>
<div>
  <div class="header-fixed" :style="opacityStyle" v-show="showHeader">
    <div class="header-left iconfont icon-left" @click="back"></div>
    <div class="header-title">
      Wo的主页
    </div>
  <div class="header-right iconfont icon-edit-square" ></div>
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
    },
    back() {
      this.$router.back()
    }
  },
  mounted () {
    window.addEventListener('scroll', this.handleTouchMove)
  }
}
</script>

<style lang="stylus" scoped>
.header-fixed
  position: fixed
  top: 0
  left: 0
  right: 0
  display: flex
  line-height: 1.26rem
  background: #333
  color: white
.header-title
  width:.86rem
  flex: 1
  text-align: center
  font-size: .45rem
  margin-bottom: -.2rem
.header-left
  font-size:.5rem
  margin-left: .3rem
  color: #FFF
.header-right
  font-size:.5rem
  margin-right: .3rem
  color: #FFF
</style>
