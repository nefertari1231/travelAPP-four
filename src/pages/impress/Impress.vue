<template>
  <div>
  <div class="impress">
    <div class="impress-flex">
      <div class="single common">
        <em></em>
      </div>
    </div>
    <div class="icon">
      <div class="box-1 animated bounceInUp">
        <div class="box-bg-1">
          <i class="iconfont icon-iconzhucetouxiang"></i>
        </div>
        <div class="icon-desc">发服务</div>
      </div>
      <div class="box-2 animated bounceInUp">
        <div class="box-bg-2">
          <i class="iconfont icon-fenxiang"></i>
        </div>
        <div class="icon-desc">发分享</div>
      </div>
    </div>
  </div>
  </div>
</template>
<script>
export default {
  name: 'Impress',
  mouted() {

  },
  methods: {
    show() {

    }
  }
}

</script>
<style lang="stylus" scoped>
  .icon-enter-active
    transition: all 0.3s
  .icon-enter, .icon-leave-to
    transform: translate3d(0,100%, 0)
  .impress
    position: fixed
    top: 0
    left: 0
    bottom: 1.1rem
    width: 100%
    background-color rgba(12,12,12,0.9)
    z-index: 40
  .single em
    width: 1.8rem
    height: 1.8rem
    margin: 0 auto
    background: url(http://img04.yesmyimg.com/images/event/2014/11/018403/icon.png) no-repeat center center
    cursor: pointer
    display: block
    position: relative
  .single em:after
    content: ''
    position: absolute
    width: 2.4rem
    height: 2.4rem
    border-radius: 50%
    box-shadow: 0 0 0.02rem 0.04rem rgba(255, 255, 255, 0.8)
    top: 50%
    left: 50%
    margin-top: -1.2rem
    margin-left: -1.2rem
    z-index: 3
    opacity: 0
    -webkit-animation: halo 1s 0.5s infinite ease-out
    -moz-animation: halo 1s 0.5s infinite ease-out
    animation: halo 1s 0.5s infinite ease-out
  .impress-flex
    display: flex
    flex-direction: column
    justify-content: center
    text-align: center
    padding: 2rem 0
  @keyframes fadein {
    0% {
      opacity: 1
    }
    100% {
      opacity: 0
    }
  }
  @keyframes halo {
    0% {
      opacity: 0
      -webkit-transform: scale(0.1)
    }
    50% {
      opacity: 1
    }
    100% {
      opacity: 0
      -webkit-transform: scale(1.2)
    }
  }
  @-moz-keyframes halo {
    0% {
      opacity: 0
      -moz-transform: scale(0.1)
    }
    50% {
      opacity: 1
    }
    100% {
      opacity: 0
      -moz-transform: scale(1.2)
    }
  }
  @-ms-keyframes halo {
    0% {
      opacity: 0
    }
    50% {
      opacity: 1
    }
    100% {
      opacity: 0
    }
  }
  @-o-keyframes halo {
    0% {
      opacity: 0
      -o-transform: scale(0.1)
    }
    50% {
      opacity: 1
    }
    100% {
      opacity: 0
      -o-transform: scale(1.2)
    }
  }
  @keyframes halo {
    0% {
      opacity: 0
      transform: scale(0.1)
    }
    50% {
      opacity: 1
    }
    100% {
      opacity: 0
      transform: scale(1.2)
    }
  }
  .box-1
    float left
    margin-top 3rem
    height: 2.4rem
    width: 50%
    text-align center
    -webkit-animation-delay:0.1s
  .box-2
    float left
    margin-top 3rem
    height: 2.4rem
    width: 50%
    text-align center
  .box-bg-1
    background-color #25a4bb
    border-radius 50%
    height:1.5rem
    width: 1.5rem
    color white
    margin-left: 1.1rem
  .box-bg-2
    background-color darkcyan
    border-radius 50%
    height:1.5rem
    width: 1.5rem
    color white
    margin-left: 1.1rem
  .icon-iconzhucetouxiang,.icon-fenxiang
    position :absolute
    font-size : 0.8rem
    margin-left: -0.4rem
    margin-top: 0.35rem
  .icon-desc
    color white
    margin-top 0.2rem
    margin-left: -.1rem
</style>
