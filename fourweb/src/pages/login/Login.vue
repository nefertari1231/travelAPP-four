<template>
  <transition name="login" tag="div">
    <div class="bg" v-show="showLogin">
      <div>
          <div class="header">
            <div class="header-right iconfont icon-left" @click=hide()></div>
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
              <input class="user" v-model="username"  placeholder="请输入手机号" />
            </div>
            <div class="text2">
              <div class="iconfont icon-jiesuo"></div>
              <input class="user" v-model="password" :type="passwordType"  placeholder="请输入密码" />
              <span :class="pwdEye" @click="changeType"></span>
            </div>
            <van-checkbox v-model="checked" class="passwordck" name="remember-me">记住密码</van-checkbox>
            <input class="btn" type="submit"  @click.stop.prevent="submit" value="登录">
            <div class="set">
              <p class="new-user" @click="enterRegister">新用户注册</p>
              <p class="forget" @click="enterChangePassword">忘记密码?</p>
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
      <change-password ref="enteredChangePassword"></change-password>
    </div>
  </transition>
</template>

<script>
import axios from 'axios'
import Register from '../register/Register'
import ChangePassword from '../changePassword/ChangePassword'
export default {
  name: 'Login',
  components: {ChangePassword, Register},
  data() {
    return {
      showLogin: false,
      password: '',
      username: '',
      pwdEye: 'iconfont icon-yanjing-bi',
      passwordType: 'password',
      checked: false,
      user: {}
    }
  },
  beforeMount() {
    this.queryUserInfo()
  },
  updated() {
    this.queryUserInfo()
  },
  methods: {
    submit() {
      if (this.username === '' || this.password === '') {
        this.$toast('账号或密码不能为空')
      } else {
        axios({
          method: 'post',
          url: 'http://localhost:8090/auth/login?telephone=' + this.username + '&password=' + this.password,
          changeOrigin: true,
          data: {
            'username': this.username,
            'password': this.password
          }
        }).then(response => {
          console.log(response)
          if (response.data.status === 200) {
            this.userToken = 'Bearer ' + response.data.data.userToken
            this.userId = response.data.data.userId
            if (localStorage.getItem('Authorization') === null) {
              this.$store.dispatch('getToken', this.userToken)
              this.$store.dispatch('getUserId', this.userId)
              this.$toast.success('登录成功')
              this.hide()
              if (this.checked === false) {
                this.username = ''
                this.password = ''
              }
            } else {
              if (localStorage.getItem('Authorization') === this.userToken) {
                this.hide()
              } else {
                console.log('令牌错误')
              }
            }
          } else {
            this.$toast.fail(response.data.msg)
            this.username = ''
            this.password = ''
          }
        }).catch(error => {
          console.log(error)
        })
      }
    },
    hide() {
      this.showLogin = false
      if (this.checked === false) {
        this.username = ''
        this.password = ''
      }
    },
    show() {
      this.showLogin = true
    },
    enterRegister() {
      this.$refs.enteredRegister.show()
    },
    enterChangePassword() {
      this.$refs.enteredChangePassword.show()
    },
    changeType() {
      this.passwordType = this.passwordType === 'password' ? 'text' : 'password'
      this.pwdEye = this.pwdEye === 'iconfont icon-yanjing-bi' ? 'iconfont icon-yanjing-zheng' : 'iconfont icon-yanjing-bi'
    },
    queryUserInfo() {
      if (localStorage.getItem('Id') !== null) {
        axios({
          method: 'get',
          url: 'http://localhost:8090/api/users/query?userId=' + localStorage.getItem('Id'),
          changeOrigin: true,
          headers: {
            'token': localStorage.getItem('Authorization')
          }
        }).then(response => {
          console.log(response)
          this.user = response.data.data
          this.$store.dispatch('getuserDetail', this.user)
        })
      }
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
    opacity: 0
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
    margin .5rem .3rem 0 .3rem
  .content
    overflow: hidden
    line-height: .7rem
    height: .7rem
  .title
    float: left
    line-height: .7rem
    height: .7rem
    font-size : .4rem
    margin-left .2rem
  .title-student
    margin-left: .3rem
  .iconfont, .user
    float: left
  .text1, .text2
    position: relative
    margin: .4rem .1rem .3rem .1rem
    height: .8rem
    line-height: .8rem
  .icon-shouji, .icon-jiesuo
    font-size: .6rem
    margin-right: .2rem
  .user
    width: 80%
    height: .8rem
    line-height: .8rem
    font-size: .33rem
  .icon-yanjing-bi, .icon-yanjing-zheng
    float: right
    margin-top: -.7rem
    margin-right: .4rem
    font-size: 0.4rem
  .btn
    border-radius: 0.5rem
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
  .passwordck
    margin-left:.3rem
    margin-top .5rem
</style>
