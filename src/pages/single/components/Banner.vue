<template>
<div>
<div class="banner">
  <img class="banner-img" src="@/image/geren1.jpg">
    <div class="single-content">
      <div class="item-header">
        <router-link tag="img" to="/login" class="item-img" :src="src"></router-link>
        <div class="icon-m">
        <div class="iconfont icon-man"></div>
        </div>
      <div class="item-info">
      <p class="item-title">爱你会上瘾丶</p>
      <router-link tag="div" to="single/detail" class="iconfont icon-right"></router-link>
      </div>
      </div>
    </div>
</div>
</div>
</template>

<script>
export default {
  name: 'SingleBanner',
  data() {
    return {
      src: require('@/image/touxiang1.jpg')
    }
  }
}
</script>

<style lang="stylus" scoped>
.banner
  overflow: hidden
  height: 0
  padding-bottom: 50%
.banner-img
  width: 100%
.single-content
  width: 90%
  position: absolute
  left: .5rem
  top: 1.4rem
.item-header
  overflow: hidden
  display: flex
  height: 1.7rem
.item-img
  border-radius:50%
  width: 1.5rem
  height: 1.5rem
  margin-top: .2rem
  margin-left: .2rem
  margin-right: .1rem
.icon-m
  position: absolute
  top: 1.2rem
  left: 1.2rem
  right: 0
  bottom: 0
  width: .4rem
  height: .4rem
  background: skyblue
  border-radius:50%
  border: .03rem solid #FFF
.icon-man
  position: absolute
  top: 0.05rem
  left: 0.04rem
  right: 0
  bottom: 0
  color: #FFF
.item-info
  flex: 1
  padding: .1rem
  color: #fff
.item-title
  margin-top: .2rem
  line-height: .54rem
  font-size: .34rem
.icon-right
  font-size: .4rem
  float: right
  margin-right: .2rem
  margin-top: -.1rem
</style>
