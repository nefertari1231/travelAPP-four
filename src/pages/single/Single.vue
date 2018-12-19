<template>
<div>
  <div>
    <div class="header-fixed" >
      <div class="header-right iconfont icon-left"></div>
      <div class="header-title">
        我
      </div>
    </div>
  </div> <!--header-->
  <div   class="headlist" ref="wrapper">
    <div>
      <div>
        <div class="banner">
          <img class="banner-img" :src="user.bgImgUrl">
          <div class="single-content" v-show="!loggedIn" v-if="closeL">
            <div class="item-header">
              <img class="item-img" :src="user.imgUrl" />
              <div :class="user.color">
                <div :class="user.sex"></div>
              </div>
              <div class="item-info">
                <p class="item-title">{{user.nickName}}</p>
                <div class="iconfont icon-right" @click="enterSingleDetail()"></div>
              </div>
            </div>
          </div>  <!--登录-->
          <div class="single-content" v-show="loggedIn">
            <div class="item-header">
              <img @click="login()" class="item-img" src="static/image/login.jpg" />
              <div class="item-info">
                <p class="item-title">请登录/注册</p>
                <div class="iconfont icon-right" @click="login()"></div>
              </div>
            </div>
          </div>  <!--未登录-->
        </div>
      </div> <!--banner-->
      <div class="content-bg">
        <div class="content" >
          <div class="content-box">
            <p class="text-top">{{user.sharecount}}</p>
            <p class="text-bottom">分享</p>
          </div>
        </div>
        <div class="content">
          <div class="content-box">
            <p class="text-top">{{user.followcount}}</p>
            <p class="text-bottom">关注</p>
          </div>
        </div>
        <div class="content">
          <div class="content-box">
            <p class="text-top">{{user.fanscount}}</p>
            <p class="text-bottom">粉丝</p>
          </div>
        </div>
      </div> <!--thumb-->
      <div class="content-list">
        <ul class="list-icon">
          <div class="title">我的服务</div>
          <li class="item border">
            <div class="item-picture">
              <span class="item-pictures iconfont icon-bulb"></span>
            </div>
            <div class="item-infos">
              <p class="item-desc">我的服务</p>
              <div class=" iconfont icon-right"></div>
            </div>
          </li>
        </ul>
        <ul class="list-icon">
          <div class="title">已选服务</div>
          <li class="item border">
            <div class="item-picture">
              <span class="item-pictures iconfont icon-gouwuche"></span>
            </div>
            <div class="item-infos">
              <p class="item-desc">已选服务</p>
              <div class=" iconfont icon-right"></div>
            </div>
          </li>
        </ul>
        <ul class="list-icon">
          <div class="title">系统工具</div>
          <li class="item border">
            <div class="item-picture">
              <span class="item-pictures iconfont icon-shoucang1"></span>
            </div>
            <div class="item-infos">
              <p class="item-desc">我的收藏</p>
              <div class=" iconfont icon-right"></div>
            </div>
          </li>
          <li class="item border">
            <div class="item-picture">
              <span class="item-pictures iconfont icon-qrcode"></span>
            </div>
            <div class="item-infos">
              <p class="item-desc">我的二维码</p>
              <div class=" iconfont icon-right"></div>
            </div>
          </li>
          <li class="item border" @click="showsettings()">
            <div class="item-picture">
              <span class="item-pictures iconfont icon-setting"></span>
            </div>
            <div class="item-infos">
              <p class="item-desc">设置中心</p>
              <div class=" iconfont icon-right"></div>
            </div>
          </li>
        </ul>
      </div><!--list-->
    </div>
  </div>
  <router-view></router-view>
  <single-detail :singleDetail="user"  ref="singleDetail"></single-detail>
  <login ref="login" :loginInfo="user" @closeL="closeL"></login>
  <settings ref="settings" @closeU="closeU"></settings>
</div>
</template>

<script>
import SingleDetail from '../singleDetail/SingleDetail'
import Login from '../login/Login'
import axios from 'axios'
import Settings from '../settings/Settings'
import Bscroll from 'better-scroll'
export default {
  name: 'Single',
  components: {
    Settings,
    SingleDetail,
    Login
  },
  mounted() {
    window.addEventListener('scroll', this.handleTouchMove)
    this.getSingleInfo()
    let localUser = localStorage.getItem('user')
    let localPass = localStorage.getItem('pass')
    if (localUser && localPass) {
      this.loggedIn = false
    }
    this.scroll = new Bscroll(this.$refs.wrapper)
  },
  data() {
    return {
      user: {},
      loggedIn: true
    }
  },
  methods: {
    enterSingleDetail() {
      this.$refs.singleDetail.show()
    },
    getSingleInfo() {
      axios.get('/static/mock/single.json')
        .then(this.getSingleInfoSucc)
    },
    getSingleInfoSucc(res) {
      res = res.data
      if (res.ret && res.user) {
        this.user = res.user
      }
      console.log(res)
    },
    login() {
      this.$refs.login.show()
    },
    closeL() {
      this.loggedIn = false
    },
    closeU() {
      this.loggedIn = true
    },
    showsettings() {
      this.$refs.settings.show()
    }
  }
}
</script>

<style lang="stylus" scoped>
  .headlist
    overflow: hidden
    position: absolute
    top: 1.1rem
    left: 0
    right: 0
    bottom: 1.1rem
    z-index: 0
  //header
  .header-fixed
    position: fixed
    top: 0
    left: 0
    right: 0
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
    color: #FFF
  //banner
  .banner
    overflow: hidden
    height: 0
    padding-bottom: 50%
  .banner-img
    width: 100%
  .single-content
    width: 90%
    position: absolute
    left: .5rem
    top: 1.4rem
  .icon-left
    color: #333
  .item-header
    overflow: hidden
    display: flex
    height: 1.7rem
  .item-img
    border-radius:50%
    width: 1.5rem
    height: 1.5rem
    margin-top: .2rem
    margin-left: .2rem
    margin-right: .1rem
  .icon-m
    position: absolute
    top: 1.2rem
    left: 1.2rem
    right: 0
    bottom: 0
    width: .4rem
    height: .4rem
    background: skyblue
    border-radius:50%
    border: .03rem solid #FFF
  .icon-man,.icon-woman
    position: absolute
    top: 0.05rem
    left: 0.04rem
    right: 0
    bottom: 0
    color: #FFF
  .icon-f
    position: absolute
    top: 1.2rem
    left: 1.2rem
    right: 0
    bottom: 0
    width: .4rem
    height: .4rem
    background: pink
    border-radius:50%
    border: .03rem solid #FFF
  .item-info
    flex: 1
    padding: .1rem
    color: #fff
  .item-title
    margin-top: .2rem
    line-height: .54rem
    font-size: .34rem
  .icon-right
    font-size: .4rem
    float: right
    margin-right: .2rem
    margin-top: -.1rem
  //thumb
  .content-bg
    overflow: hidden
    height: 0
    padding-bottom: 15%
  .content
    float: left
    height: 0
    padding-bottom: 15%
    width: 32%
    text-align: center
  .content-box
    padding: .1rem .4rem
  .text-top
    font-size: .4rem
  .text-bottom
    padding-top: .05rem
    font-size: .3rem
  //list
  .title
    padding-left: .2rem
    background: #ddd
    height: .5rem
    line-height: .5rem
  .item
    overflow: hidden
    display: flex
    height: 0.8rem
    padding: .1rem
  .item-picture
    height: .7rem
    width: .7rem
    margin-left: .2rem
  .item-pictures
    border-radius: 30%
  .item-infos
    flex: 1
  .item-desc
    height: 0.8rem
    line-height: 0.8rem
    float: left
    font-size: .4rem
    margin-left: .2rem
  .icon-right
    float: right
    height: 0.8rem
    line-height: 0.8rem
    font-size: .5rem
    color: #ddd
  .icon-bulb
    font-size: .7rem
    color: #FFF
    background: #32CD32
  .icon-gouwuche
    font-size: .7rem
    color: #FFF
    background: skyblue
  .icon-shoucang1
    font-size: .7rem
    color: #FFF
    background: #FFD700
  .icon-qrcode
    font-size: .7rem
    color: #FFF
    background: #FF8C00
  .icon-setting
    font-size: .7rem
    color: #FFF
    background: #9932CC
</style>
