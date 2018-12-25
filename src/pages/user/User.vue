<template>
<div>
  <div>
    <div class="header" >
      <div class="header-right iconfont icon-left"></div>
      <div class="header-title">
        我
      </div>
    </div>
  </div> <!--header-->
  <div   class="headlist" ref="wrapper">
    <div @click="login()">
      <div class="banner">
          <img class="banner-img" :src="this.$store.state.userBg">
          <div class="user-content">
            <div class="item-header">
              <img class="item-img" :src="this.$store.state.userIcon" />
              <div class="icon-m" v-show="this.$store.state.userSex === '男'">
                <div class="iconfont icon-man"></div>
              </div>
              <div class="icon-f" v-show="this.$store.state.userSex === '女'">
                <div class="iconfont icon-woman"></div>
              </div>
              <div class="item-info">
                <p class="item-title">{{this.$store.state.userNickname}}</p>
                <div class="iconfont icon-right" @click="enteruserDetail()"></div>
              </div>
            </div>
          </div>  <!--登录-->
      </div> <!--banner-->
      <div class="content-bg">
        <div class="content" >
          <div class="content-box">
            <p class="text-top">{{this.$store.state.shareCount}}</p>
            <p class="text-bottom">分享</p>
          </div>
        </div>
        <div class="content">
          <div class="content-box">
            <p class="text-top">{{this.$store.state.followCount}}</p>
            <p class="text-bottom">关注</p>
          </div>
        </div>
        <div class="content">
          <div class="content-box">
            <p class="text-top">{{this.$store.state.fansCount}}</p>
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
          <li class="item border" @click="showSettings()">
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
  <user-detail ref="userDetail"></user-detail>
  <login ref="login" ></login>
  <settings ref="settings"></settings>
</div>
</template>

<script>
import userDetail from '../userDetail/userDetail'
import Login from '../login/Login'
import Settings from '../settings/Settings'
import Bscroll from 'better-scroll'
export default {
  name: 'user',
  components: {
    Settings,
    userDetail,
    Login
  },
  mounted() {
    this.scroll = new Bscroll(this.$refs.wrapper)
  },
  data() {
    return {
      user: {}
    }
  },
  methods: {
    enteruserDetail() {
      this.$refs.userDetail.show()
    },
    exituserDetail() {
      this.$refs.userDetail.hide()
    },
    login() {
      if (this.$store.state.userId === null) {
        this.$refs.login.show()
        this.exituserDetail()
        this.hideSettings()
      }
    },
    showSettings() {
      this.$refs.settings.show()
    },
    hideSettings() {
      this.$refs.settings.hide()
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
  .header
    position: relative
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
    z-index 0
    overflow: hidden
    height: 0
    padding-bottom: 50%
  .banner-img
    width: 100%
  .user-content
    width: 90%
    position: absolute
    left: .5rem
    top: 1.1rem
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
    line-height: .54rem
    font-size: .34rem
  .icon-right
    font-size: .4rem
    float: right
    margin-right: .2rem
    margin-top: -.3rem
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
