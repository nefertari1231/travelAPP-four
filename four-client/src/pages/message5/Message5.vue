<template>
  <transition name="message5" tag="div">
<div v-show="message5show" class="bg">
  <div class="header">
    <div class="header-left iconfont icon-left" @click="hide()"></div>
    <div class="header-title">
      用户{{name}}
    </div>
  </div>
  <div class="Message5_body">
    <ul>
      <li v-for="conten in yonghu_msg" :key="conten.id">
        <img :src="conten.img" class="Message5_img" :class="{'Message5_left':!(conten.left)}">
        <div class="Message5_div" :class="{'Message5_left':!(conten.left)}">
          <div class="Message5_div2" :class="{'Message5_div2_left':!(conten.left)}"></div>
          <p>{{conten.text}}</p>
        </div>
      </li>
    </ul>
 </div>
 <div class="Message5_foot">
    <input type="text" placeholder="" v-model="send_msg" class="Message5_text">
    <button type="button" class="Message5_button2" @click="msg_add">发送</button>
  </div>
</div>
  </transition>
</template>
<script>

export default {
  name: 'Message5',
  data () {
    return {
      name: 'xxx',
      img: '',
      text: '',
      left: true,
      yonghu_msg: [{
        id: '01',
        img: 'static/image/touxiang3.jpeg',
        text: '您好！',
        left: true}],
      send_msg: '',
      message5show: false
    }
  },
  methods: {
    msg_add() {
      this.yonghu_msg.push({
        img: 'static/image/touxiang2.jpeg',
        text: this.send_msg,
        left: false})
    },
    show() {
      this.message5show = true
    },
    hide() {
      this.message5show = false
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
    width:2rem
  .Message5_foot
    position:fixed
    bottom:0
    width:100%
  .Message5_text
    width:78%
    margin:0 1%
    height:1rem
  .Message5_button2
    width:16%
    margin:0 1%
    height:0.6rem
    color:#fff
    background-color: #1B81FF
    border-radius:10%
  .Message5_img
    width:1rem
    float:left
    border-radius:50%
    margin:0.3rem 0.6rem 0 0.3rem
  .Message5_div
    background-color:#F5FAFF
    line-height:3rem
    text-align:center
    width:70%
    float:left
    margin:0.3rem 0
    border-radius:5%
    position:relative
  .Message5_div p
    width:95%
    padding:0 2.5%
    white-space:pre-line
    word-break: break-all
    line-height:1rem
  .Message5_left
    float:right!important
  .Message5_body
    height:11rem
    overflow:hidden
    overflow-y:visible
  .Message5_div2
    width: 0
    height: 0
    border-width: 0.2rem
    border-style: solid
    border-color: transparent #F5FAFF transparent transparent
    position:absolute
    top:0.3rem
    left:-0.42rem
  .Message5_div2_left
    border-color: transparent  transparent transparent #F5FAFF!important
    left:5.2rem!important
</style>
