<template>
<div>
<div class="footer">
   <div class="function">
     <div class="thumb border-right">
      <div class="iconfont icon-like"></div>
      <div class="desc">点赞</div>
     </div>
     <div class="like">
      <div class="iconfont icon-shoucang1"></div>
      <div class="desc">收藏</div>
     </div>
   </div>
   <div class="talk">聊一聊</div>
   <div class="jion">加入</div>
</div>
</div>
</template>

<script>
export default {
  name: 'ServiceDetailFooter'
}
</script>

<style lang="stylus" scoped>
.footer
  height: 1.1rem
.function
  float: left
  height: 1.1rem
  width: 33.3%
  background: #eee
  color: #aaa
.iconfont
  margin-top:.1rem
  font-size: .4rem
.thumb
  float: left
  height: 1.1rem
  line-height: 1.9em
  width: 50%
  text-align: center
.like
  float: left
  height: 1.1rem
  line-height: 1.9em
  width: 50%
  text-align: center
.talk
  float: left
  height: 1.1rem
  line-height: 1.1rem
  width: 33.3%
  background: #00BFFF
  color: #fff
  text-align: center
.jion
  float: left
  height: 1.1rem
  line-height: 1.1rem
  width: 33.3%
  background: #333
  color: #fff
  text-align: center
</style>
