<template>
  <transition name="homeComment" tag="div">
    <div v-show="showHomeCommentTalk" class="bg">
      <div>
        <div class="header-fixed">
          <div class="header-left"  @click="hide()">取消</div>
          <div class="header-title"></div>
          <div class="header-right" >确定</div>
        </div>
      </div> <!--header-->
      <div class="content-bg">
        <textarea class="content" placeholder="请填写评论" contenteditable="" rows="10" v-model="words"></textarea>
        <p class="word">
          <span>{{wordslength}}</span>
          <span>/270</span>
        </p>
      </div> <!--content-->
    </div>
  </transition>
</template>

<script>
export default {
  name: 'homeCommentTalk',
  data() {
    return {
      showHomeCommentTalk: false,
      words: ''
    }
  },
  methods: {
    show() {
      this.showHomeCommentTalk = true
    },
    hide() {
      this.showHomeCommentTalk = false
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
    z-index: 40
    top: 0
    left: 0
    right: 0
    bottom: 0
  .homeComment-enter-active,.homeComment-leave-active
    transition: all 0.3s
  .homeComment-enter, .homeComment-leave-to
    opacity: 0
    transform: translate3d(100%, 0, 0)
  //header
  .header-fixed
    z-index: 99
    position: fixed
    top: 0
    left: 0
    right: 0
    display: flex
    line-height: 1.1rem
    background: #333
    color: white
  .header-left
    font-size:.33rem
    margin-left: .3rem
    color: #FFF
  .header-title
    flex: 1
  .header-right
    float: right
    font-size:.33rem
    margin-right: .3rem
    color: #FFF
  //content
  .content-bg
    padding: 0 .8rem
  .content
    margin-top: 1.2rem
    width :100%
  .word
    float right
</style>
