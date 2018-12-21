<template>
  <transition name="settings" tag="div">
    <div class="bg" v-show="showSettings">
      <div>
        <div class="header-fixed">
          <div class="header-left iconfont icon-left" @click="hide()"></div>
          <div class="header-title">
            设置
          </div>
        </div>
      </div> <!--header-->
      <div class="content-list">
        <ul class="list-icon">
          <div class="title"></div>
          <li class="item border">
            <div class="item-infos">
              <p class="item-desc">账号管理</p>
              <div class=" iconfont icon-right"></div>
            </div>
          </li>
          <li class="item border">
            <div class="item-infos">
              <p class="item-desc">隐私设置</p>
              <div class=" iconfont icon-right"></div>
            </div>
          </li>
        </ul>
        <ul class="list-icon">
          <div class="title"></div>
          <li class="item border">
            <div class="item-infos">
              <p class="item-desc">清理缓存</p>
              <div class=" iconfont icon-right"></div>
            </div>
          </li>
        </ul>
        <ul class="list-icon">
          <div class="title"></div>
          <li class="item border">
            <div class="item-infos">
              <p class="item-desc">意见反馈</p>
              <div class=" iconfont icon-right"></div>
            </div>
          </li>
          <li class="item border">
            <div class="item-infos">
              <p class="item-desc">关于我们</p>
              <div class=" iconfont icon-right"></div>
            </div>
          </li>
        </ul>
      </div><!--list-->
      <input class="btn" type="submit" @click="submit"  value="退出登录">
    </div>
  </transition>
</template>

<script>
export default {
  name: 'Settings',
  data() {
    return {
      showSettings: false,
      value1: true
    }
  },
  methods: {
    show () {
      this.showSettings = true
    },
    hide () {
      this.showSettings = false
    },
    submit() {
      this.$store.dispatch('logOff')
      this.hide()
    }
  }
}
</script>

<style lang="stylus" scoped>
  .bg
    position: fixed
    background: #FFF
    z-index: 40
    top: 0
    left: 0
    right: 0
    bottom: 0
  .settings-enter-active,.settings-leave-active
    transition: all 0.3s
  .settings-enter, .settings-leave-to
    transform: translate3d( 0,100%, 0)
  //header
  .header-fixed
    z-index: 50
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
  .header-left
    font-size:.5rem
    margin-left: .3rem
    color: #FFF
  //content
  .content-list
    margin-top: 1.2rem
  .title
    padding-left: .2rem
    background: #ddd
    height: .2rem
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
  .btn
    border-radius: 0.5rem;
    width: 100%
    height: .9rem
    background: #00BFFF
    margin-top: .6rem
    line-height: .9rem
    color: #FFF
    font-size: .4rem
</style>
