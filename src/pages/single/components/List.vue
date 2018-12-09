<template>
<div class="content-list">
<ul class="content" v-for="(item, key) of siriList" :key="item.id">
<div class="title">{{key}}</div>
<li class="item border" v-for="items of item" :key="items.id">
<div class="item-img">
<span class="item-imgs" :class="item.icon"></span>
<span class="item-imgs" :class="items.icon"></span>
</div>
<div class="item-info">
<p class="item-title">{{items.title}}</p>
<div class=" iconfont icon-right"></div>
</div>
</li>
</ul>
</div>
</template>

<script>
export default {
  name: 'SiriList',
  data () {
    return {
      siriList: {
        我的服务: [{
          id: '0001',
          icon: 'iconfont icon-bulb',
          title: '我的服务'
        }],
        已选服务: [{
          id: '0001',
          icon: 'iconfont icon-gouwuche',
          title: '已选服务'
        }],
        系统工具: [{
          id: '0001',
          icon: 'iconfont icon-shoucang1',
          title: '我的收藏'
        }, {
          id: '0002',
          icon: 'iconfont icon-qrcode',
          title: '我的二维码'
        }, {
          id: '0003',
          icon: 'iconfont icon-setting',
          title: '设置中心'
        }]
      }
    }
  }
}
</script>

<style lang="stylus" scoped>
.title
  padding-left: .2rem
  background: #ddd
  height: .5rem
  line-height: .5rem
.item
  overflow: hidden
  display: flex
  height: 0.8rem
  padding: .1rem
.item-img
  height: .7rem
  width: .7rem
  margin-left: .2rem
.item-imgs
  border-radius: 30%
.iconfont
  font-size: .7rem
  color: #FFF
.item-info
  flex: 1
.item-title
  height: 0.8rem
  line-height: 0.8rem
  float: left
  font-size: .4rem
  margin-left: .2rem
.icon-right
  float: right
  height: 0.8rem
  line-height: 0.8rem
  font-size: .5rem
  color: #ddd
.icon-bulb
  background: #32CD32
.icon-gouwuche
  background: skyblue
.icon-shoucang1
  background: #FFD700
.icon-qrcode
  background: #FF8C00
.icon-setting
  background: #9932CC
</style>
