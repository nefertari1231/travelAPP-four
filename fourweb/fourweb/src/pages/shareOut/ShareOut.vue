<template>
  <transition name="shareout" tag="div">
    <div v-show="showshareout" class="bg">
      <div>
        <div class="header">
          <div class="header-left iconfont icon-left" @click="hide()"></div>
          <div class="header-title">
            发送分享
          </div>
          <div class="header-right">发布</div>
        </div>
      </div>  <!--header-->
      <div class="content-bg">
        <textarea class="content" placeholder="请填写评论" contenteditable="" rows="6" v-model="words"></textarea>
        <div class="picture"></div>
        <p class="word">
          <span>{{wordslength}}</span>
          <span>/270</span>
        </p>
      </div> <!--content-->
    </div>
  </transition>
</template>

<script>
// import axios from 'axios'
export default {
  name: 'ShareOut',
  data() {
    return {
      showshareout: false,
      words: ''
    }
  },
  methods: {
    show() {
      this.showshareout = true
    },
    hide() {
      this.showshareout = false
    }
  },
  computed: {
    wordslength() {
      let length
      length = this.words.length
      return length
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
  .shareout-enter-active,.shareout-leave-active
    transition: all 0.3s
  .shareout-enter, .shareout-leave-to
    opacity: 0
    transform: translate3d( 0, 100%, 0)
  .header
    display: flex
    line-height: 1.1rem
    background: #333
    color: white
  .header-title
    width:1.2rem
    flex: 1
    text-align: center
    font-size: .45rem
    margin-bottom: -.2rem
  .header-left
    font-size:.5rem
    margin-left: .3rem
    color: #FFF
  .header-right
    font-size:.4rem
    margin-right: .3rem
    color: #FFF
  //content
  .content-bg
    padding: 0 .8rem
  .picture
    width: 1.2rem
    height: 1.2rem
    border: 0.02rem dashed #aaa
    background: url(http://img04.yesmyimg.com/images/event/2014/11/018403/icon.png) no-repeat center
  .content
    margin-top: 0.5rem
    width :100%
  .word
    float right
</style>
