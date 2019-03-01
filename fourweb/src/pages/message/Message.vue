<template>
<div>
  <div>
      <div class="header">
        <div class="header-title">
          消息
        </div>
        <div class="header-right iconfont icon-team"></div>
      </div>
    </div> <!--header-->
    <div class="headlist" ref="wrapper" @click="login">
      <div>
      <div>
          <div class="icons">
            <div class="icon" v-for="item in messageList" :key="item.id" @click="togo(item)">
              <div class="imgs">
                <div class="imgs-icon">
                  <div class="iconfonts" :class="item.icon"></div>
                </div>
              </div>
              <p class="icon-desc">{{item.desc}}</p>
            </div>
          </div>
        </div> <!--content-->
      </div>
    </div>
  <router-view></router-view>
  <login ref="login"></login>
 <message1 ref="message1" ></message1>
 <message2 ref="message2" ></message2>
 <message3 ref="message3" ></message3>
 <message4 ref="message4" ></message4>
 <message5 ref="message5" ></message5>
</div>
</template>
<script>
import Bscroll from 'better-scroll'
import Login from '../login/Login'
import Message1 from '../message1/Message1'
import Message2 from '../message2/Message2'
import Message3 from '../message3/Message3'
import Message4 from '../message4/Message4'
import Message5 from '../message5/Message5'
export default {
  name: 'Message',
  components: {
    Login,
    Message1,
    Message2,
    Message3,
    Message4,
    Message5
  },
  data () {
    return {
      messageList: [{
        id: '0001',
        icon: 'iconfont icon-dingdan',
        desc: '订单信息'
      }, {
        id: '0002',
        icon: 'iconfont icon-bulb',
        desc: '提示'
      }, {
        id: '0003',
        icon: 'iconfont icon-xiaoxi',
        desc: '系统消息'
      }, {
        id: '0004',
        icon: 'iconfont icon-comment',
        desc: '评论'
      }, {
        id: '0005',
        icon: 'iconfont icon-heart',
        desc: '赞'
      }, {
        id: '0006',
        icon: 'iconfont icon-fuhao-',
        desc: '提到我的'
      }]
    }
  },
  mounted () {
    this.scroll = new Bscroll(this.$refs.wrapper, {})
  },
  methods: {
    login() {
      if (localStorage.getItem('Authorization') === null) {
        this.$refs.login.show()
        this.$refs.message1.hide()
        this.$refs.message2.hide()
        this.$refs.message3.hide()
        this.$refs.message4.hide()
        this.$refs.message5.hide()
      }
    },
    togo(messageList) {
      if (messageList.desc === '订单信息') {
        this.$refs.message1.show()
      } else if (messageList.desc === '系统消息') {
        this.$refs.message2.show()
      } else if (messageList.desc === '评论') {
        this.$refs.message3.show()
      } else if (messageList.desc === '赞') {
        this.$refs.message4.show()
      } else if (messageList.desc === '提到我的') {
        this.$refs.message5.show()
      }
    }
  }
}
</script>

<style lang="stylus" scoped>
  //header
  .headlist
    overflow: hidden
    position: absolute
    top: 1.1rem
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
    width:.86rem
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
</style>
