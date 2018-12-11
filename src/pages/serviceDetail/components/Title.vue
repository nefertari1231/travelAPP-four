<template>
<div >
    <div class="single-content">
      <div class="item-header">
        <img class="item-img"  src="static/image/touxiang7.jpg" />
        <div class="icon-m">
        <div class="iconfont icon-man"></div>
        </div>
      <div class="item-info">
      <p class="item-title">老王<span class="item-attention"> + 关注</span></p>
      <p class="item-desc">已经出游3次</p>
      </div>
      </div>
    </div>
</div>
</template>

<script>
export default {
  name: 'ServiceDetailTitle'
}
</script>

<style lang="stylus" scoped>
.single-content
  width: 90%
  position: relative
  left: .5rem
.item-header
  overflow: hidden
  display: flex
  height: 1.7rem
  margin-bottom: .3rem
.item-img
  border-radius:50%
  width: 1.5rem
  height: 1.5rem
  margin-top: .2rem
  margin-right: .1rem
.icon-m
  position: absolute
  top: 1.2rem
  left: 1.05rem
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
.item-title
  margin-top: .2rem
  line-height: .54rem
  font-size: .34rem
.item-attention
  width: 1.1rem
  float: right
  font-size: .3rem
  border: .01rem solid red
  text-align: center
  border-radius: 10%
  color: red
.icon-right
  font-size: .4rem
  float: right
  margin-right: .2rem
  margin-top: -.1rem
.item-desc
  margin-top: .2rem
</style>
