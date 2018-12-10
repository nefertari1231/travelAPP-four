<template>
<div>
<ul class="content" v-for="item of siriList" :key="item.id">
<li class="item border"
    v-for="items of item"
    :key="items.id">
<div class="item-img">
<span class="item-imgs" :class="items.icon"></span>
</div>
<div class="item-info">
<p class="item-title">{{items.title}}</p>
<div class=" iconfont icon-right"></div>
<p class="item-desc">{{items.desc}}</p>
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
        friendlist: [{
          id: '0001',
          icon: 'iconfont icon-duoyuyan',
          title: '朋友圈',
          desc: '查看好友的动态'
        }],
        searchlist: [{
          id: '0002',
          icon: 'iconfont icon-scan',
          title: '扫一扫',
          desc: '扫一扫更精彩'
        }, {
          id: '0003',
          icon: 'iconfont icon-sousuo',
          title: '找人',
          desc: '认识更多有趣的人'
        }, {
          id: '0004',
          icon: 'iconfont icon-dangdi',
          title: '附近的人',
          desc: '找到你身边的伙伴'
        }]
      }
    }
  }
}
</script>

<style lang="stylus" scoped>
.content
  margin-top: .2rem
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
.item-desc
  float: right
  height: 0.8rem
  line-height: 0.8rem
  font-size: .32rem
  color: #bbb
.icon-right
  float: right
  height: 0.8rem
  line-height: 0.8rem
  font-size: .5rem
  color: #ddd
.icon-duoyuyan
  background: skyblue
.icon-scan
  background: #FFD700
.icon-sousuo
  background: #FF8C00
.icon-dangdi
  background: #9932CC
</style>
