<template>
<div>
  <div class="header">
    <div class="header-right iconfont icon-left"></div>
    <div class="header-title">
      发现
    </div>
  </div>
</div>
</template>

<script>
export default {
  name: 'SiriHeader'
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
  color: #333
</style>
