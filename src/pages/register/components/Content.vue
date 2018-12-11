<template>
<div>
  <div class="content-bg">
    <div class="text1">
    <div class="iconfont icon-shouji"></div>
    <input class="user" type="text" name="user" placeholder="请输入手机号" />
    </div>
    <div class="text2">
    <div class="iconfont icon-jiesuo"></div>
    <input class="user" type="password" name="user" placeholder="请输入密码" />
    <span class="iconfont icon-yanjing-bi"></span>
    </div>
    <input class="btn" type="submit" value="注册">
  </div>
</div>
</template>

<script>
export default {
  name: 'RegisterContent'
}
</script>

<style lang="stylus" scoped>
.content-bg
  position: hidden
  margin .9rem .3rem 0 .3rem
.content
  overflow: hidden
  line-height: .7rem
  height: .7rem
.iconfont, .user
  float: left
.text1, .text2
  position: relative
  margin: .4rem .2rem .3rem .2rem
  height: .8rem
  line-height: .8rem
.icon-shouji, .icon-jiesuo
  font-size: .6rem
  margin-right: .2rem
.user
  width: 80%
  height: .8rem
  line-height: .8rem
.icon-yanjing-bi
  float: right
  margin-top: -.7rem
  margin-right: .7rem
.btn
  border-radius: 0.5rem;
  width: 100%
  height: .9rem
  background: #00BFFF
  margin-top: .6rem
  line-height: .9rem
  text-align: center
  color: #FFF
  font-size: .4rem
.set
  width: 100%
  line-height: .6rem
  height:.6rem
  margin-top: .4rem
  color: #777
.new-user
  margin-left: .2rem
  float: left
.forget
  float: right
  margin-right: .2rem
.icons
  margin-top: .6rem
  height: 2.4rem
  line-height: 2.4rem
  padding: 0 1.5rem
</style>
