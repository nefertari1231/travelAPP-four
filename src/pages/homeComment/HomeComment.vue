<template>
  <transition name="homeComment" tag="div">
  <div v-show="showHomeComment" class="bg">
    <div>
      <div class="header-fixed">
        <div class="header-right iconfont icon-left" @click="hide()"></div>
        <div class="header-title">
          详情
        </div>
      </div>
    </div> <!--header-->
    <div class="headlist" ref="wrapper">
      <div>
        <div class="single-content">
          <div class="item-header">
            <img class="item-img"  src="static/image/touxiang1.jpg" />
            <div class="icon-m">
              <div class="iconfont icon-man"></div>
            </div>
            <div class="item-info">
              <p class="item-title">爱你会上瘾丶<span class="item-attention"> + 关注</span></p>
              <p class="item-time">09-17 15:31</p>
            </div>
          </div>
        </div>  <!--title-->
        <div>
          <div class="content-desc">杯子在多数时候，盛装的仅仅是半杯水，遇见的那个人依然似乎无法填补内心的空洞，时间一点一点地过去，水也一点一点地蒸发掉，你开始觉得他越来越无法满足你的全部幻想全部期待</div>
          <div class="pic" v-for="pic of PicList" :key="pic.id">
            <div class="pic-content">
              <img :src="pic.PimgUlr" />
            </div>
          </div>
          <div class="goods">0个人点赞了</div>
        </div> <!--content-->
      </div>
    </div>
    <div class="footer">
      <ul>
        <div class="foot-content">
          <li class="iconfont icon-like">
              <span class="footer-text">赞(0)
              </span>
          </li>
        </div>
        <div class="foot-content border-left">
          <li class="iconfont icon-edit-square">
              <span class="footer-text">评论(0)
              </span>
          </li>
        </div>
      </ul>
    </div> <!--footer-->
  </div>
  </transition>
</template>

<script>
import Bscroll from 'better-scroll'
export default {
  name: 'HomeComment',
  props: {
    homeComment: Object
  },
  data() {
    return {
      showHomeComment: false,
      PicList: [{
        id: '0001',
        PimgUlr: 'static/image/share1.jpg'
      },
      {
        id: '0002',
        PimgUlr: 'static/image/share2.jpg'
      },
      {
        id: '0003',
        PimgUlr: 'static/image/share3.jpg'
      },
      {
        id: '0004',
        PimgUlr: 'static/image/share4.jpg'
      }]
    }
  },
  methods: {
    show() {
      this.showHomeComment = true
      this.$nextTick(() => {
        if (!this.scroll) {
          this.scroll = new Bscroll(this.$refs.wrapper, {
            click: true
          })
        } else {
          this.scroll.refresh()
        }
      })
    },
    hide() {
      this.showHomeComment = false
    }
  }
}
</script>

<style lang="stylus" scoped>
  .headlist
    overflow: hidden
    position: absolute
    top: 0
    left: 0
    right: 0
    bottom: 1.1rem
  .bg
    position: fixed
    background: #FFF
    z-index: 30
    top: 0
    left: 0
    right: 0
    bottom: 0
  .homeComment-enter-active,.homeComment-leave-active
    transition: all 0.3s
  .homeComment-enter, .homeComment-leave-to
    transform: translate3d(100%, 0, 0)
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
  //title
  .single-content
    width: 90%
    position: relative
    left: .3rem
    top: 1.3rem
  .item-header
    overflow: hidden
    display: flex
    height: 1.7rem
    margin-bottom: .3rem
  .item-img
    border-radius:50%
    width: 1.25rem
    height: 1.25rem
    margin-top: .2rem
    margin-right: .1rem
  .icon-m
    position: absolute
    top: 1.1rem
    left: 0.9rem
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
  .item-title
    margin-top: .2rem
    line-height: .54rem
    font-size: .34rem
    margin-left: .2rem
  .item-attention
    width: 1.1rem
    float: right
    font-size: .3rem
    border: .01rem solid red
    text-align: center
    border-radius: 10%
    color: red
  .icon-right
    font-size: .4rem
    float: right
    margin-right: .2rem
    margin-top: -.1rem
  .item-time
    margin-top: .2rem
    margin-left: .2rem
  //content
  .content-desc
    margin-top :1.5rem
    padding: 0 .5rem
  .pic
    margin-top :.4rem
    text-align :center
  //footer
  .footer
    bottom: 0
    position: fixed
    width: 100%
    height: 0.9rem
    background-color: #fff
    overflow: hidden
    border-top: 0.1rem solid #bbb
  .foot-content
    float: left
    position: relative
    overflow: hidden
    width: 50%
    text-align: center
    color: #888
    margin-top:.2rem
  .icon-like, .icon-edit-square
    font-size: .35rem
  .footer-text
    font-size: .35rem
    margin-left 0.2rem
  .goods
    float: right
    margin-top: 0.2rem
    margin-right: 0.5rem
</style>
