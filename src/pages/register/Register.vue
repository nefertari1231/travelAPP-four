<template>
<transition name="register" tag="div">
<div class="bg" v-show="showRegister">
<div>
    <div class="header">
      <div class="header-right iconfont icon-left" @click="hide()"></div>
      <div class="header-title">
        注册
      </div>
    </div>
  </div> <!--header-->
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
  </div> <!--content-->
</div>
</transition>
</template>

<script>
export default {
  name: 'Register',
  data() {
    return {
      showRegister: false
    }
  },
  methods: {
    show() {
      this.showRegister = true
    },
    hide() {
      this.showRegister = false
    }
  }
}
</script>

<style lang="stylus" scoped>
  .bg
    position: fixed
    background: #FFF
    z-index: 100
    top: 0
    left: 0
    right: 0
    bottom: 0
  .register-enter-active,.register-leave-active
    transition: all 0.3s
  .register-enter, .register-leave-to
    transform: translate3d( 0,100%,0)
  //header
  .header
    display: flex
    line-height: 1.1rem
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
  //content
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
    background: dodgerblue
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
