<template>
<div>
<div class="footer">
  <router-link tag="div" :to="item.to" class="icons" v-for="item of iconList" :key="item.id">
  <div @click="selectMapNav(item.id)">
  <div class="icon">
  <div :class="isSelect === item.id ? item.iconUrl2 : item.iconUrl"></div>
  </div>
  <p class="icon-desc">{{item.desc}}</p>
  </div>
  </router-link>
</div>
</div>
</template>

<script>
export default {
  name: 'Tab',
  data () {
    return {
      isSelect: '0001',
      iconList: [{
        id: '0001',
        to: '/home',
        iconUrl: 'iconfont icon-home',
        iconUrl2: 'iconfont icon-home-fill',
        desc: '首页'
      }, {
        id: '0002',
        to: '/siri',
        iconUrl: 'iconfont icon-compass',
        iconUrl2: 'iconfont icon-compass-fill',
        desc: '发现'
      }, {
        id: '0003',
        to: '',
        iconUrl: 'iconfont icon-plus-circle-fill',
        iconUrl2: 'iconfont icon-plus-circle-fill',
        desc: ''
      }, {
        id: '0004',
        to: '/message',
        iconUrl: 'iconfont icon-message',
        iconUrl2: 'iconfont icon-message-fill',
        desc: '消息'
      }, {
        id: '0005',
        to: '/single',
        iconUrl: 'iconfont icon-user',
        iconUrl2: 'iconfont icon-yonghu-tianchong',
        desc: '我的'
      }]
    }
  },
  methods: {
    selectMapNav (id) {
      if (id !== '0003') {
        this.isSelect = id
      }
    }
  }
}
</script>

<style lang="stylus" scoped>
.footer
  height: 1.1rem
  background: #333
  bottom: 0
  position: fixed
  width: 100%
.icons
  height: 1.1rem
  position: relative
  overflow: hidden
  width: 20%
  float: left
.icon
  position: absolute
  top: 0
  left: 0
  right: 0
  bottom: .28rem
.iconfont
  text-align: center
  font-size: .7rem
  color:#FFF
.icon-plus-circle-fill,.icon-plus-circle
  text-align: center
  font-size: 1.1rem
  color:#FFF
.icon-desc
  position: absolute
  left: 0
  right: 0
  bottom: 0
  height: .35rem
  line-height: .35rem
  color: #FFF
  text-align: center
.icon-yonghu-tianchong
  font-size: .6rem
  margin-top: .07rem
</style>
