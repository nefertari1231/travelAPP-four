<template>
  <transition name="message4" tag="div">
<div v-show="message4show" class="bg">
<div class="header">
  <div class="header-left iconfont icon-left" @click="hide()"></div>
        <div class="header-title">
          赞
        </div>
      </div>
<div class="Message4_body border-bottom" v-for="(item,index) in great" :key="index">
  <p>
    <span>{{name}}</span>
    赞了您发的服务
    <img src="static/image/dianzan.png" class="Message4_img2">
    <span style="float:right;color:#000;line-height:1.5rem">￥ {{ item.server.serverPrice}}</span>
  </p>
  <p>
   标题：{{ item.server.serverName }}
  </p>
  <div class="clear"></div>
  <!-- <div class="Message4_div">
  </div> -->
</div>
</div>
  </transition>
</template>
<script>
import axios from 'axios'
export default {
  name: 'Message4',
  data () {
    return {
      name: '来自星星的人',
      message4show: false,
      great: null
    }
  },
  methods: {
    show() {
      this.message4show = true
      axios.get('http://localhost:8090/api/great/getGreat?userId=' + localStorage.getItem('Id'))
        .then(response => {
          this.great = response.data.data
        })
    },
    hide() {
      this.message4show = false
    }
  }
}
</script>
<style lang="stylus" scoped>
  .clear
    clear both;
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
  .Message4_img
    width:2rem
  .Message4_img2
    width:0.4rem
  .Message4_body p
    padding:0.3rem 0.3rem
    font-size:0.4rem
  .Message4_body p span
    color:#4BA8FB
    font-size:0.4rem
  .Message4_div
    width:95%
    height:3rem
    background: #9400D3
    margin:0 2.5%
</style>
