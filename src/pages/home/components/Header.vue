<template>
<div>
  <div class="header">
    <div class="header-title">
      {{this.homeTitle}}
    </div>
    <router-link tag="div" to="/home/search" class="header-right iconfont icon-search" ></router-link>
  </div>
</div>
</template>

<script>
export default {
  name: 'HomeHeader',
  props: {
    homeTitle: String
  }
}
</script>

<style lang="stylus" scoped>
.header
  position: relative
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
  margin-right: -.8rem
.header-right
  font-size:.6rem
  margin-right: .2rem
</style>
