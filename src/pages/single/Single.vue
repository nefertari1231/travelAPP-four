<template>
<div>
  <div>
    <div class="header-fixed" :style="opacityStyle" v-show="showHeader">
      <div class="header-right iconfont icon-left"></div>
      <div class="header-title">
        我
      </div>
    </div>
  </div> <!--header-->
<div class="singlelist" ref="wrapper">
<div>
  <div>
    <div class="banner">
      <img class="banner-img" src="static/image/geren1.jpg">
      <div class="single-content">
        <div class="item-header">
          <router-link tag="img" to="/login" class="item-img" :src="src"></router-link>
          <div class="icon-m">
            <div class="iconfont icon-man"></div>
          </div>
          <div class="item-info">
            <p class="item-title">爱你会上瘾丶</p>
            <router-link tag="div" to="single/detail" class="iconfont icon-right"></router-link>
          </div>
        </div>
      </div>
    </div>
  </div> <!--banner-->
  <div class="content-bg">
    <div class="content" v-for="item of contentList" :key="item.id">
      <div class="content-box">
        <p class="text-top">{{item.textTop}}</p>
        <p class="text-bottom">{{item.textBottom}}</p>
      </div>
    </div>
  </div> <!--thumb-->
  <single-list></single-list>
  <single-list></single-list><!--list-->
</div>
</div>
<router-view></router-view>
</div>
</template>

<script>
import Bscroll from 'better-scroll'
import SingleList from './components/List'
export default {
  name: 'Single',
  components: {
    SingleList
  },
  mounted () {
    this.scroll = new Bscroll(this.$refs.wrapper)
    window.addEventListener('scroll', this.handleTouchMove)
  },
  data () {
    return {
      showHeader: true,
      opacityStyle: {
        opacity: 0
      },
      src: 'static/image/touxiang1.jpg',
      contentList: [{
        id: '0001',
        textTop: '0',
        textBottom: '分享'
      }, {
        id: '0002',
        textTop: '2',
        textBottom: '关注'
      }, {
        id: '0003',
        textTop: '0',
        textBottom: '粉丝'
      }]
    }
  },
  methods: {
    handleTouchMove () {
      const top = document.documentElement.scrollTop
      if (top > 60) {
        let opacity = top / 140
        opacity = opacity > 1 ? 1 : opacity
        this.opacityStyle = {opacity}
        this.showHeader = true
      } else {
        this.showHeader = false
      }
    }
  }
}
</script>

<style lang="stylus" scoped>
  // .singlelist
  //   overflow: hidden
  //   position: absolute
  //   top: 0
  //   left: 0
  //   right: 0
  //   bottom: 1.2rem
  //header
  .header-fixed
    z-index: 99
    position: fixed
    top: 0
    left: 0
    right: 0
    display: flex
    line-height: 1.26rem
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
  .icon-man
    position: absolute
    top: 0.05rem
    left: 0.04rem
    right: 0
    bottom: 0
    color: #FFF
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
</style>
