<template>
  <transition name="message2" tag="div">
<div v-show="message2show" class="bg">
<div class="header">
  <div class="header-left iconfont icon-left" @click="hide()"></div>
        <div class="header-title">
          系统信息
        </div>
      </div>
<div >
  <ul>
    <li v-for="conten in msg" class="Message2_li" :key="conten.id">
      <p>{{conten.text}}</p>
    </li>
  </ul>
</div>
</div>
  </transition>
</template>
<script>
export default {
  name: 'Message2',
  data () {
    return {
      text: '',
      msg: [{
        id: '01',
        text: '欢迎回到系统'
      }, {
        id: '02',
        text: '恭喜你获得了勋章'
      }, {
        id: '03',
        text: ''
      }],
      message2show: false
    }
  },
  methods: {
    show() {
      this.message2show = true
    },
    hide() {
      this.message2show = false
    }
  }
}
</script>
<style lang="stylus" scoped>
  .bg
    position: fixed
    background: #FFF
    z-index: 60
    top: 0
    left: 0
    right: 0
    bottom: 0
//header
  .headlist
    overflow: hidden
    position: absolute
    top: 2.1rem
    left: 0
    right: 0
    bottom: 1.5rem
  .header
    overflow: hidden
    position: relative
    display: flex
    line-height: 1.1rem
    background: #333
    color: white
  .header-title
    width:100%
    flex: 1
    text-align: center
    font-size: .45rem
    margin-bottom: -.2rem
    margin-right: -.8rem
  .header-right
    font-size:.6rem
    margin-right: .2rem
  //content
  .icons
    margin-top: .4rem
    overflow: hidden
    height: 4.2rem
  .icon
    float: left
    overflow: hidden
    width:33.3%
    height: 2rem
    margin-bottom: .2rem
  .imgs
    overflow: hidden
    height: 1.4rem
    line-height: 1.4rem
    text-align: center
    padding: 0 .75rem
  .imgs-icon
    margin-top: .2rem
    height: 1rem
    line-height: 1rem
    text-align: center
  .icon-desc
    text-align: center
    height: .6rem
    line-height:.8rem
  .iconfonts
    border-radius: 50%
    font-size: .6rem
    color: #FFF
    height: 1rem
    width: 1rem
  .icon-dingdan
    background: green
  .icon-bulb
    background: #FFA500
  .icon-xiaoxi
    background: #9400D3
  .icon-comment
    background: skyblue
  .icon-heart
    background: red
  .icon-fuhao-
    background: #FF7F50
  .Message_img
    height:2rem
  .Message2_img
    width:2rem
  .Message2_li p
    color:#fff
    background-color: #1B81FF
    text-align:center
    line-height:1rem
    border-radius:15%
    margin-top:0.3rem

</style>
