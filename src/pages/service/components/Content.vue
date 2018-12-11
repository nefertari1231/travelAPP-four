<template>
  <div>
    <ul>
      <li @click="selectItem(item)"
          class="item border-bottom"
          v-for="item in serviceList"
          :key="item.id">
        <img class="item-img" :src="item.imgUrl" />
        <div class="item-info">
          <p class="item-title">{{item.title}}</p>
          <p class="item-desc">{{item.desc}}</p>
          <button class="item-button">查看详情</button>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'ServiceContent',
  data () {
    return {
      serviceList: [{
        id: '0001',
        imgUrl: 'static/image/service1.jpg',
        title: '喀纳斯徒步',
        desc: '召集想去新疆的旅友'
      }, {
        id: '0002',
        imgUrl: 'static/image/service2.jpg',
        title: '三亚结伴',
        desc: '7-15出发'
      }, {
        id: '0003',
        imgUrl: 'static/image/service3.jpg',
        title: '周边游-云龙山',
        desc: '下午出发'
      }, {
        id: '0004',
        imgUrl: 'static/image/service4.jpg',
        title: '徐州缪斯酒吧，想high你就来',
        desc: '晚上包场'
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
.item
  overflow: hidden
  display: flex
  height: 1.9rem
.item-img
  width: 2rem
  height: 1.7rem
  padding: .1rem
.item-info
  flex: 1
  padding: .1rem
  min-width: 0
.item-title
  line-height: .54rem
  font-size: .32rem
  overflow: hidden
  white-space: nowrap
  text-overflow: ellipsis
.item-desc
  line-height: .4rem
  color: #ccc
  overflow: hidden
  white-space: nowrap
  text-overflow: ellipsis
.item-button
  line-height: .44rem
  margin-top: .16rem
  background: #ff9300
  padding: 0 .2rem
  border-radius: .06rem
  color: #fff
</style>
