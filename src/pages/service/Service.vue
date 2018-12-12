 <template>
<div class="bg">
  <div>
    <div class="header">
      <div class="header-left iconfont icon-left" @click="back"></div>
      <div class="header-title">
        定位
      </div>
      <div class="header-right">地图</div>
    </div>
  </div>  <!--header-->
  <div>
    <ul>
      <li @click="selectServer(serverDetail)"
          class="item border-bottom"
          v-for="serverDetail in serviceList"
          :key="serverDetail.id">
        <img class="item-img" :src="serverDetail.imgUrl" />
        <div class="item-info">
          <p class="item-title">{{serverDetail.title}}</p>
          <p class="item-desc">{{serverDetail.desc}}</p>
          <button class="item-button">查看详情</button>
        </div>
      </li>
    </ul>
  </div>  <!--content-->
<serviceDetail :serverDetail="selectedServer" ref="serviceDetail"></serviceDetail>
</div>
</template>

<script>
import serviceDetail from '@/pages/serviceDetail/ServiceDetail'
export default {
  name: 'Service',
  components: {
    serviceDetail
  },
  data() {
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
      }],
      selectedServer: {}
    }
  },
  methods: {
    back() {
      this.$router.back()
    },
    selectServer(ServerDetail, event) {
      // if (!event._constructed) {
      //   return
      // }
      this.selectedServer = ServerDetail
      this.$refs.serviceDetail.show()
    }
  }
}
</script>

<style lang="stylus" scoped>
  .bg
    position: fixed
    background: #FFF
    z-index: 20
    top: 0
    left: 0
    right: 0
    bottom: 0
  .header
    display: flex
    line-height: 1.26rem
    background: #333
    color: white
  .header-title
    width:.86rem
    flex: 1
    text-align: center
    font-size: .45rem
    margin-bottom: -.2rem
  .header-left
    font-size:.5rem
    margin-left: .3rem
    color: #FFF
  .header-right
    font-size:.4rem
    margin-right: .3rem
    color: #FFF
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
