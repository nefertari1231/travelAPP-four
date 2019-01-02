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
        <div class="iconfont icon-renren"></div>
        <input class="user" v-model="username" placeholder="请输入学号"  />
      </div>
      <div class="text2">
        <div class="iconfont icon-jiesuo"></div>
        <input class="user" v-model="password" type="password"  placeholder="请输入密码" />
      </div>
      <div class="text2">
        <div class="iconfont icon-jiesuo"></div>
        <input class="user" v-model="repassword" type="password"  placeholder="请再次输入密码" />
      </div>
      <input class="btn" type="submit" value="注册" @click.stop.prevent="successRegister()">
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
      username: ''
    }
  },
  methods: {
    show() {
      this.showRegister = true
    },
    hide() {
      this.showRegister = false
    },
    successRegister() {
      if (this.username !== '') {
        if (this.password !== '' && this.repassword !== '') {
          if (this.password === this.repassword) {
            if (/^\d{8}$/.test(this.username) && /^[a-zA-Z]\w{5,17}$/.test(this.password)) {
              axios({
                method: 'post',
                url: 'http://localhost:8090/api/users/register',
                changeOrigin: true,
                data: {
                  'username': this.username,
                  'password': this.password
                }
              }).then(response => {
                console.log(response)
                if (response.data.status === 200) {
                  this.$toast.success('注册成功')
                  this.hide()
                  this.username = ''
                  this.password = ''
                  this.repassword = ''
                }
                if (response.data.status === 500) {
                  this.$toast(response.data.msg)
                }
              }).catch(error => {
                console.log(error)
              })
            } else {
              this.$toast('用户名为8位数字，密码为英文开头')
            }
          } else {
            this.$toast('二次输入密码不同')
          }
        } else {
          this.$toast('请填入密码')
        }
      } else {
        this.$toast('请填入用户名和密码')
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
  .icon-renren, .icon-jiesuo
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
