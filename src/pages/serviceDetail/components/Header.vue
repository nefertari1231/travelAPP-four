<template>
<div>
  <div class="header">
    <div class="header-left iconfont icon-left" @click="back()"></div>
    <div class="header-title">
      服务详情
    </div>
    <div class="header-right iconfont icon-reload"></div>
  </div>
</div>
</template>

<script>
export default {
  name: 'ServiceDetailHeader',
  methods: {
    back() {
      this.$emit('hide')
    }
  }
}
</script>

<style lang="stylus" scoped>
.header
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
