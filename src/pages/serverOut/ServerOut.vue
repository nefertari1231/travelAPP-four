<template>
  <transition name="serverout" tag="div">
    <div v-show="showServerout" class="bg">
      <div>
        <div class="header">
          <div class="header-left iconfont icon-left" @click.stop.prevent="hide()"></div>
          <div class="header-title">
            发送服务
          </div>
          <div class="header-right">发布</div>
        </div>
      </div>  <!--header-->
      <div class="content-bg">
        <div class="text1">
          <div class="">标题
            <input class="content-1" type="text" name="user" placeholder="标题需要体现服务内容" />
          </div>
        </div>
        <hr class="hro" />
        <textarea class="content" placeholder="请描述一下你的服务" contenteditable="" rows="6"></textarea>
        <div class="picture"></div>
        <div class="line2"></div>
        <textarea class="content" placeholder="备注注意事项" contenteditable="" rows="6" ></textarea>
        <div class="text1">
          <div class="gold-title">输入金额(￥)
            <input class="content-1" type="text" />
          </div>
        </div>
      </div><!--content-->
    </div>
  </transition>
</template>

<script>
export default {
  name: 'ServerOut',
  data() {
    return {
      showServerout: false
    }
  },
  methods: {
    show() {
      this.showServerout = true
    },
    hide() {
      this.showServerout = false
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
    z-index: 100
    top: 0
    left: 0
    right: 0
    bottom: 0
  .serverout-enter-active,.serverout-leave-active
    transition: all 0.3s
  .serverout-enter, .serverout-leave-to
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
  .text1
    margin: .25rem 0 0.1rem 0.5rem
    font-size : .4rem
  .content-1
    margin-top: -.12rem
    margin-left .2rem
  .hro
    width: 90%
    margin : 0 auto
  .content
    margin-top: 0.35rem
    width :100%
    padding: 0 .54rem
  .picture
    margin-left: 0.5rem
    width: 1.2rem
    height: 1.2rem
    border: 0.02rem dashed #aaa
    background: url(http://img04.yesmyimg.com/images/event/2014/11/018403/icon.png) no-repeat center
  .line2
    margin-top: .3rem
    height: .1rem
    background: #ddd
  .gold-title
    font-size : 0.35rem
</style>
