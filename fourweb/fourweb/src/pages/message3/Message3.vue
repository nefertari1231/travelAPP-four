<template>
  <transition name="message3" tag="div">
<div v-show="message3show" class="bg">
<div class="header">
  <div class="header-left iconfont icon-left" @click="hide()"></div>
        <div class="header-title">
          消息评论
        </div>
      </div>
  <div>
    <p>
      <span class="Message3_span">{{name}}</span>
      评论:我很喜欢
    </p>
      <div class="Message3_div"></div>
      <button type="button" class="Message3_button" @click="show">回复评论</button>
  </div>
  <div class="Message3_body">
    <p v-for="conten in msg" :key="conten.id" v-show="!(conten.text == '')"> 回复 : {{conten.text}}</p>
  </div>
  <div>
    <textarea name="" id="" cols="30" rows="8" placeholder="请输入" v-model="new_msg" class="Message3_textarea" v-show="textarea_show"></textarea>
    <button type="button" class="Message3_button2" @click="msg_add">提交</button>
  </div>
</div>
  </transition>
</template>
<script>
export default {
  name: 'Message3',
  data () {
    return {
      name: 'xxx',
      text: '',
      msg: [{
        id: '',
        text: ''
      }],
      new_msg: '',
      textarea_show: false,
      message3show: false
    }
  },
  methods: {
    show() {
      this.textarea_show = true
      this.message3show = true
    },
    msg_add() {
      console.log(this.new_msg)
      this.msg.push({text: this.new_msg})
      this.textarea_show = false
    },
    hide() {
      this.message3show = false
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
  .Message3_img
    width:2rem
  .Message3_span
    color:#4BA8FB
    margin:0 0.2rem
    font-size:0.5rem
  .Message3_div
    width:95%
    height:3rem
    background: #9400D3
    margin:0 2.5%
  .Message3_body
    clear:both
    height:3rem
    overflow:hidden
    overflow-y:visible
  .Message3_body p
    padding:0.1rem 0.4rem
    white-space:pre-line
    word-break: break-all
  .Message3_textarea
    position:fixed
    bottom:0
    width:98%
    font-size:0.5rem
    white-space:pre-line
    word-break: break-all
    padding:0.1rem 0.1rem
  .Message3_button
    font-size:0.3rem
    width:1.8rem
    height:0.8rem
    float:right
    margin:0.3rem 0.6rem
    border-radius:10%
  .Message3_button2
    position:fixed
    bottom:1rem
    right:0.5rem
    background-color: #1B81FF
    color:#fff
    width:1rem
    height:1rem
    border-radius:10%
</style>
