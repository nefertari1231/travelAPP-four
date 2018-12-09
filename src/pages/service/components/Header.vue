<template>
<div>
  <div class="header">
    <div class="header-left iconfont icon-left" @click="back"></div>
    <div class="header-title">
      定位
    </div>
    <div class="header-right">地图</div>
  </div>
</div>
</template>

<script>
export default {
  name: 'ServiceHeader',
  methods: {
    back() {
      this.$router.back()
    }
  }
}
</script>

<style lang="stylus" scoped>
.header
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
.header-left
  font-size:.5rem
  margin-left: .3rem
  color: #FFF
.header-right
  font-size:.4rem
  margin-right: .3rem
  color: #FFF
</style>
