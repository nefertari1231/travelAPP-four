<template>
  <transition name="homeComment" tag="div">
  <div v-show="showHomeComment" class="bg">
    <div>
      <div class="header-fixed">
        <div class="header-left iconfont icon-left" @click="hide()"></div>
        <div class="header-title">
          详情
        </div>
      </div>
    </div> <!--header-->
    <div class="headlist" ref="wrapper">
      <div>
        <div class="single-content">
          <div class="item-header">
            <img class="item-img"  :src="homeComment.imgUlr" />
            <div :class="homeComment.color">
              <div :class="homeComment.sex"></div>
            </div>
            <div class="item-info">
              <p class="item-title">{{homeComment.Name}}<span class="item-attention"> + 关注</span></p>
              <p class="item-time">{{homeComment.TimeName}}</p>
            </div>
          </div>
        </div>  <!--title-->
        <div>
          <div class="content-desc">{{homeComment.desc}}</div>
          <div class="pic" v-for="pic of homeComment.PicList" :key="pic.id">
            <div class="pic-content">
              <img :src="pic.PimgUlr" />
            </div>
          </div>
          <div class="line"></div>
          <div class="goods">0个人点赞了</div>
          <div class="line2"></div>
          <div class="content-tail">暂无评论</div>
        </div> <!--content-->
      </div>
    </div>
    <div class="footer">
        <div class="foot-content">
          <span class="iconfont icon-like"></span>
              <span class="footer-text">赞</span>
        </div>
        <div class="foot-content border-left">
          <span class="iconfont icon-edit-square"></span>
              <span class="footer-text" @click="selectTalk()">评论</span>
        </div>
    </div> <!--footer-->
    <home-comment-talk ref="homeCommentTalk"></home-comment-talk>
  </div>
  </transition>
</template>

<script>
import Bscroll from 'better-scroll'
import HomeCommentTalk from '../homeCommentTalk/homeCommentTalk'
export default {
  name: 'HomeComment',
  components: {HomeCommentTalk
  },
  props: {
    homeComment: Object
  },
  data() {
    return {
      showHomeComment: false
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
    },
    selectTalk() {
      this.$refs.homeCommentTalk.show()
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
    bottom: 0
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
    z-index: 30
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
    top: 1rem
    left: 0.9rem
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
    top: 1rem
    left: 0.9rem
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
  .line
    margin-top .2rem
    height: .1rem
    background: #ddd
  .line2
    margin-top: .8rem
    height: .1rem
    background: #ddd
  .content-tail
    height: 2.5rem
    text-align: center
    margin-top: .5rem
  //footer
  .footer
    bottom: 0
    position: fixed
    width: 100%
    height: 0.9rem
    background-color: #fff
    overflow: hidden
    border-top: 0.05rem solid #bbb
  .foot-content
    float: left
    position: relative
    overflow: hidden
    width: 50%
    text-align: center
    color: #888
    margin-top:.2rem
    line-height :.35rem
    height: 0.9rem
  .icon-like,.icon-edit-square
    margin-top .2rem
    font-size: .5rem
  .footer-text
    font-size: .35rem
    margin-left 0.1rem
  .goods
    float: right
    margin-top: 0.2rem
    margin-right: 0.5rem
</style>
