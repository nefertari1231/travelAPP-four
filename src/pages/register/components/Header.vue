<template>
<div>
  <div class="header">
    <div class="header-right iconfont icon-left" @click="back"></div>
    <div class="header-title">
     注册
    </div>
  </div>
</div>
</template>

<script>
export default {
  name: 'RegisterHeader',
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
  margin-left: -.9rem
.header-right
  font-size:.5rem
  margin-left: .3rem
</style>
