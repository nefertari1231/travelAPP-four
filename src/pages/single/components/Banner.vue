<template>
<div>
<div class="banner">
  <img class="banner-img" src="@/image/geren1.jpg">
    <div class="single-content">
      <div class="item-header">
        <img class="item-img"  src="@/image/touxiang1.jpg" @click="Login()" />
        <div class="icon-m">
        <div class="iconfont icon-man"></div>
        </div>
      <div class="item-info">
      <p class="item-title">爱你会上瘾丶</p>
      <div class="iconfont icon-right" @click="Click()"></div>
      </div>
      </div>
    </div>
</div>
</div>
</template>

<script>
export default {
  name: 'SingleBanner',
  methods: {
    Click() {
      this.$emit('select')
    },
    Login() {
      this.$emit('login')
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
