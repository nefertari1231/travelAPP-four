<template>
<transition name="single" tag="div">
<div class="bg" v-show="showSingleDetail">
  <div>
    <div class="header-fixed" >
      <div class="header-left iconfont icon-left" @click="hide()"></div>
      <div class="header-title">
        Wo的主页
      </div>
      <div class="header-right iconfont icon-edit-square" ></div>
    </div>
    <div class="banner">
      <img class="banner-img" :src="bgImgUrl">
    </div>
    <img class="item-img"  :src="singleDetail.imgUrl" />
    <div class="icon-info">
      <div class="desc">{{singleDetail.nickName}}</div>
      <div :class="singleDetail.color">
        <div :class="singleDetail.sex"></div>
      </div>
    </div>
    <div class="icon-desc">
      <div class="desc-attention">关注 {{singleDetail.followcount}}</div>
      <div class="desc-fun">粉丝 {{singleDetail.fanscount}}</div>
    </div>
    <div class="text">简介：这家伙很懒，什么也没留下</div>
    <div class="split"></div>
  </div> <!--banner-->
</div>
</transition>
</template>

<script>
export default {
  name: 'SingleDetail',
  props: {
    singleDetail: Object
  },
  data () {
    return {
      bgImgUrl: 'static/image/geren2.jpg',
      showSingleDetail: false
    }
  },
  methods: {
    show () {
      this.showSingleDetail = true
    },
    hide () {
      this.showSingleDetail = false
    }
  },
  mounted () {
    window.addEventListener('scroll', this.handleTouchMove)
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
  .single-enter-active,.single-leave-active
    transition: all 0.3s
  .single-enter, .single-leave-to
    transform: translate3d(100%, 0, 0)
    //banner
  .header-fixed
    position: fixed
    top: 0
    left: 0
    right: 0
    display: flex
    line-height: 1.25rem
    color: white
  .header-title
    width:.86rem
    flex: 1
    text-align: center
    font-size: .45rem
    margin-bottom: -.2rem
    color:rgba(0, 0, 0, 0)
  .header-left
    font-size:.5rem
    margin-left: .3rem
    color: #FFF
  .header-right
    font-size:.5rem
    margin-right: .3rem
    color: #FFF
  .banner
    overflow: hidden
    height: 0
    padding-bottom: 50%
  .banner-img
    width: 100%
  .item-img
    border: .05rem solid #FFF
    border-radius:50%
    width: 1.5rem
    height: 1.5rem
    position: absolute
    top: 3rem
    left: 0
    bottom: 0
    right: 0
    margin:0 auto
  .icon-m
    float: left
    width: .4rem
    height: .4rem
    background: skyblue
    border-radius:50%
  .icon-man
    color: #FFF
    margin-top:.05rem
  .icon-f,.icon-woman
    float: left
    width: .4rem
    height: .4rem
    background: pink
    border-radius:50%
  .icon-info
    display: flex
    margin-top: 1rem
    text-align: center
    padding: 0 2.5rem
  .desc
    float: left
    flex: 1
    font-size: .3rem
  .icon-desc
    margin-top:.3rem
    display: flex
    text-align: center
    padding: 0 2.5rem
  .desc-attention
    border-right: .04rem solid #bbb
    flex: 1
  .desc-fun
    flex:1
  .text
    margin-top: .2rem
    text-align: center
  .split
    height: .2rem
    background: #ddd
    margin-top: .3rem
</style>
