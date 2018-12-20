<template>
  <transition name="login" tag="div">
    <div class="bg" v-show="showlogin">
      <div>
          <div class="header">
            <div class="header-right iconfont icon-left" @click="hide()"></div>
            <div class="header-title">
              登录
            </div>
          </div>
        </div> <!--header-->
      <div>
          <div class="content-bg">
            <div class="content">
              <p class="title title-tell">手机登录</p>
            </div>
            <div class="text1">
              <div class="iconfont icon-shouji"></div>
              <input class="user" v-model="username" type="text" name="user" placeholder="请输入手机号" />
            </div>
            <div class="text2">
              <div class="iconfont icon-jiesuo"></div>
              <input class="user" v-model="password" type="password" name="user" placeholder="请输入密码" />
              <span class="iconfont icon-yanjing-bi"></span>
            </div>
            <p class="error-text" v-show="errorText">{{errorText}}</p>
            <input class="btn" type="submit"  @click.stop.prevent="submit" value="登录">
            <div class="set">
              <p class="new-user" @click="enterRegister">新用户注册</p>
              <p class="forget">忘记密码?</p>
            </div>
            <div class="split">
              <hr class="split-left">
              <div class="split-text">社交账号登录</div>
              <hr class="split-right">
            </div>
            <div class="icons">
              <div class="iconfont icon-QQ"></div>
              <div class="iconfont icon-weixin"></div>
            </div>
          </div>
        </div> <!--content-->
      <register ref="enteredRegister"></register>
    </div>
  </transition>
</template>

<script>
import Register from '../register/Register'
export default {
  name: 'Login',
  components: {Register},
  props: {
    loginInfo: Object
  },
  data() {
    return {
      password: '',
      username: '',
      errorText: '',
      showlogin: false
    }
  },
  methods: {
    submit() {
      if (this.username !== this.loginInfo.username || this.password !== this.loginInfo.password) {
        this.errorText = '账号和密码不符'
      } else if (this.username === this.loginInfo.username && this.password === this.loginInfo.password) {
        this.hide()
        this.$emit('closeL')
        localStorage.setItem('user', this.username)
        localStorage.setItem('pass', this.password)
      }
    },
    show() {
      this.showlogin = true
    },
    hide() {
      this.showlogin = false
    },
    enterRegister() {
      this.$refs.enteredRegister.show()
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
  .login-enter-active,.login-leave-active
    transition: all 0.3s
  .login-enter, .login-leave-to
    transform: translate3d(0, 100%, 0)
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
  .title
    float: left
    line-height: .7rem
    height: .7rem
    font-size : .4rem
  .title-student
    margin-left: .3rem
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
  .error-text
    margin-left: 1rem
    color: red
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
  .split
    height: 1rem
    margin-top: .8rem
  .split-left
    float: left
    width: 33.3%
  .split-right
    float: right
    width: 33.3%
  .split-text
    float: left
    width:33.3%
    text-align: center
    color: #999
  .icons
    margin-top: .6rem
    height: 2.4rem
    line-height: 2.4rem
    padding: 0 1.5rem
  .icon-QQ
    height: 1.2rem
    line-height: 1.2rem
    font-size: 1.2rem
    color: dodgerblue
    float: left
  .icon-weixin
    height: 1.2rem
    line-height: 1.2rem
    font-size: 1.2rem
    color:  #228B22
    float: right
</style>
