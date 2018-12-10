<template>
<div>
<div class="server-bg">
<router-link tag="div" :to="item.to"
     class="server"
     v-for="item of serverList"
     :key="item.id"
     >
  <div class="server-content">
    <img  class="server-img" :src="item.imgUrl">
    <div class="font-display">
    <p class="font">{{item.desc}}</p>
    </div>
  </div>
</router-link>
</div>
</div>
</template>

<script>
export default {
  name: 'HomeServer',
  data () {
    return {
      serverList: [{
        id: 'service',
        imgUrl: require('@/image/server1.jpg'),
        desc: '找服务',
        to: '/home/service'
      }, {
        id: 'play',
        imgUrl: require('@/image/server2.jpg'),
        desc: '周边玩',
        to: '/'
      }, {
        id: 'around',
        imgUrl: require('@/image/server3.jpg'),
        desc: '附近的人',
        to: '/'
      }]
    }
  },
  methods: {
    selectItem(item) {
      this.$emit('select', item)
    }
  }
}
</script>

<style lang="stylus" scoped>
.server-bg
  overflow: hidden
  height: 0
  padding-bottom: 25%
.server
  position: relative
  overflow: hidden
  float: left
  height: 0
  width: 33.333%
  padding-bottom: 25%
.server-content
  position: absolute
  top: 0
  left: 0
  right: 0
  bottom: 0
  box-sizing: border-box
  padding: .15rem
.server-img
  display: block
  height: 100%
  width: 100%
  margin: 0 auto
.font
  position: absolute
  top: 0
  left: 0
  right: 0
  bottom: 0
  line-height: 6em
  height: 6em
  color: #FFF
  text-align: center
  font-size: medium
</style>
