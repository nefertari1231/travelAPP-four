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
<div>
    <div class="icons">
      <div class="icon" v-for="item in messageList" :key="item.id">
        <div class="imgs">
          <div class="imgs-icon">
            <div class="iconfonts" :class="item.icon"></div>
          </div>
        </div>
        <p class="icon-desc">{{item.desc}}</p>
      </div>
    </div>
  </div> <!--content-->
  <router-view></router-view>
</div>
</template>

<script>

export default {
  name: 'Message',
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
  }
}
</script>

<style lang="stylus" scoped>
  //header
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
    margin-top: .2rem
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
