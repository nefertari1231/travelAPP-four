<template>
<div>
<div class="footer">
  <router-link tag="div" :to="item.to" class="icons" v-for="item of iconList" :key="item.id">
    <div @click="selectMapNav(item.id)">
      <div class="icon">
        <div :class="isSelect === item.id ? item.iconUrl2 : item.iconUrl"></div>
      </div>
      <p class="icon-desc">{{item.desc}}</p>
    </div>
  </router-link>
  <div  @click="addshow">
    <div class="icon-center">
      <div class="hamburger" id="hamburger-6" :class="{'is-active':active}">
        <span class="line"></span>
        <span class="line"></span>
        <span class="line"></span>
      </div>
    </div>
  </div>
  <transition name="fadeleft">
    <impress v-show="show"></impress>
  </transition>
</div>
</div>
</template>

<script>
import Impress from '../impress/Impress'
export default {
  name: 'Tab',
  components: {
    Impress
  },
  data() {
    return {
      show: false,
      active: false,
      isSelect: '0001',
      iconList: [{
        id: '0001',
        to: '/home',
        iconUrl: 'iconfont icon-home',
        iconUrl2: 'iconfont icon-home-fill',
        desc: '首页'
      }, {
        id: '0002',
        to: '/siri',
        iconUrl: 'iconfont icon-compass',
        iconUrl2: 'iconfont icon-compass-fill',
        desc: '发现'
      }, {
        id: '0003',
        to: '',
        iconUrl: '',
        iconUrl2: '',
        desc: ''
      }, {
        id: '0004',
        to: '/message',
        iconUrl: 'iconfont icon-message',
        iconUrl2: 'iconfont icon-message-fill',
        desc: '消息'
      }, {
        id: '0005',
        to: '/single',
        iconUrl: 'iconfont icon-user',
        iconUrl2: 'iconfont icon-yonghu-tianchong',
        desc: '我的'
      }]
    }
  },
  methods: {
    addshow() {
      this.active = !this.active
      this.show = !this.show
    },
    selectMapNav (id) {
      if (id !== '0003') {
        this.isSelect = id
      }
    }
  }
}
</script>

<style lang="stylus" scoped>
  .footer
    height: 1.1rem
    background: #333
    bottom: 0
    position: fixed
    width: 100%
  .icons
    height: 1.1rem
    position: relative
    overflow: hidden
    width: 20%
    float: left
  .icon-center
    margin:0 auto
    width : 1rem
    position: absolute
    top: .2rem
    left: 0
    right: 0
    bottom: 0
  .icon
    position: absolute
    top: 0
    left: 0
    right: 0
    bottom: .28rem
  .iconfont
    text-align: center
    font-size: .7rem
    color:#FFF
  .icon-desc
    position: absolute
    left: 0
    right: 0
    bottom: 0
    height: .35rem
    line-height: .35rem
    color: #FFF
    text-align: center
  .icon-yonghu-tianchong
    font-size: .6rem
    margin-top: .07rem
  .hamburger .line
    width: 24px
    height: 4px
    background-color: #fff;
    display: block
    margin: 5px auto
    transition: all 0.3s ease-in-out
  #hamburger-6.is-active
    transition: all 0.3s ease-in-out
    transition-delay: 0.6s
    transform: rotate(45deg)
  #hamburger-6.is-active .line:nth-child(2)
    width: 0px
  #hamburger-6.is-active .line:nth-child(1),
  #hamburger-6.is-active .line:nth-child(3)
    transition-delay: 0.3s
  #hamburger-6.is-active .line:nth-child(1)
    transform: translateY(8px) translateX(0)
  #hamburger-6.is-active .line:nth-child(3)
    transform: translateY(-9px) rotate(90deg)
  .fadeleft-enter, .fadeleft-leave-to
    transform: translate3d(0,100%, 0)
    opacity: 0
  .fadeleft-enter-active, .fadeleft-leave-active
    transition: all 0.4s linear
</style>
