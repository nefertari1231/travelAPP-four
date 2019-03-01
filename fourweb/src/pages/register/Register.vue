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
        <input class="user" v-model="username" placeholder="请输入手机号"  />
      </div>
      <div class="text1">
        <div class="iconfont icon-yanzhengma"></div>
        <input class="yzm"  placeholder="请输入验证码" v-model="code" />
        <button class="getyzm" @click.stop.prevent="accpetSendCode()">获取验证码</button>
      </div>
      <div class="text2">
        <div class="iconfont icon-jiesuo"></div>
        <input class="user" v-model="password" type="password"  placeholder="请输入密码" />
      </div>
      <div class="text2">
        <div class="iconfont icon-jiesuo"></div>
        <input class="user" v-model="repassword" type="password"  placeholder="请再次输入密码" />
      </div>
      <van-checkbox v-model="checked" class="ckregister">我已了解并阅读《注册服务条款》</van-checkbox>
      <input class="btn" type="submit" value="注册" :class="{'clickTrue': checked === true}" @click.stop.prevent="successRegister()">
    </div>
  </div> <!--content-->
</div>
</transition>
</template>

<script>
import axios from 'axios'
export default {
  name: 'Register',
  data() {
    return {
      showRegister: false,
      password: '',
      repassword: '',
      code: '',
      username: '',
      checked: false
    }
  },
  methods: {
    show() {
      this.showRegister = true
    },
    hide() {
      this.showRegister = false
      this.username = ''
      this.password = ''
      this.code = ''
      this.repassword = ''
    },
    accpetSendCode() {
      if (this.username !== '') {
        if (/^1[34578]\d{9}$/.test(this.username)) {
          axios({
            method: 'post',
            url: 'http://localhost:8090/auth/sendCode?telephone=' + this.username,
            changeOrigin: true,
            data: {
              'username': this.username
            }
          }).then(response => {
            console.log(response)
            if (response.data.status === 200) {
              this.$toast.success('获取成功')
            }
            if (response.data.status === 500) {
              this.$toast(response.data.msg)
            }
          }).catch(error => {
            console.log(error)
          })
        } else {
          this.$toast('请填写有效的手机号')
        }
      } else {
        this.$toast('请填写手机号')
      }
    },
    successRegister() {
      if (this.checked === true) {
        if (this.password !== '' && this.repassword !== '') {
          if (this.password === this.repassword) {
            if (/^[a-zA-Z]\w{5,17}$/.test(this.password)) {
              axios({
                method: 'post',
                url: 'http://localhost:8090/auth/register?telephone=' + this.username + '&code=' + this.code + '&password=' + this.password,
                changeOrigin: true,
                data: {
                  'username': this.username,
                  'code': this.code,
                  'password': this.password
                }
              }).then(response => {
                console.log(response)
                if (response.data.status === 200) {
                  this.$toast.success('注册成功')
                  this.hide()
                  this.username = ''
                  this.password = ''
                  this.code = ''
                  this.repassword = ''
                }
                if (response.data.status === 500 && response.data.msg === '验证错误') {
                  this.$toast(response.data.msg)
                  this.password = ''
                  this.code = ''
                  this.repassword = ''
                } else {
                  this.$toast(response.data.msg)
                  this.username = ''
                  this.password = ''
                  this.code = ''
                  this.repassword = ''
                }
              }).catch(error => {
                console.log(error)
              })
            } else {
              this.$toast('密码为英文开头')
            }
          } else {
            this.$toast('两次输入密码不同')
          }
        } else {
          this.$toast('请填入密码')
        }
      }
    }
  }
}
</script>

<style lang="stylus" scoped>
  .bg
    position: fixed
    background: #FFF
    z-index: 111
    top: 0
    left: 0
    right: 0
    bottom: 0
  .register-enter-active,.register-leave-active
    transition: all 0.3s
  .register-enter, .register-leave-to
    opacity: 0
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
    margin .2rem .3rem 0 .3rem
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
  .icon-shouji, .icon-jiesuo,.icon-yanzhengma
    font-size: .6rem
    margin-right: .2rem
  .user
    width: 80%
    height: .8rem
    line-height: .8rem
    font-size .33rem
  .icon-yanjing-bi
    float: right
    margin-top: -.7rem
    margin-right: .7rem
  .btn
    border-radius: 0.5rem;
    width: 100%
    height: .9rem
    background: gray
    margin-top: .6rem
    line-height: .9rem
    text-align: center
    color: #FFF
    font-size: .4rem
  .clickTrue
    background: dodgerblue
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
  .ckregister
    margin-left 0.3rem
    margin-top .5rem
  .yzm
    width: 60%
    height: .8rem
    line-height: .8rem
    font-size: .33rem
  .getyzm
    line-height 0.6rem
    height 0.6rem
    font-size .2rem
    color white
    width 1.5rem
    border-radius: 0.2rem
    background: dodgerblue
</style>
