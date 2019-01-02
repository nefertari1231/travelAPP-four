<template>
  <transition name="HomeT" tag="div">
    <div class="bg" v-show="showService">
      <div>
        <div class="header">
          <div class="header-left iconfont icon-left" @click="hide()"></div>
          <div class="header-title">
            定位
          </div>
          <div class="header-right">地图</div>
        </div>
      </div>  <!--header-->
      <div class="headlist" ref="wrapper">
        <div>
          <div>
            <ul>
              <li @click="selectServer(serverDetail)"
                  class="item border-bottom"
                  v-for="serverDetail in serviceList"
                  :key="serverDetail.id">
                <img class="item-img" :src="serverDetail.imgUrl" />
                <div class="item-info">
                  <p class="item-title">{{serverDetail.title}}</p>
                  <p class="item-gold">￥{{serverDetail.gold}}</p>
                  <p class="item-desc">{{serverDetail.desc}}</p>
                  <p class="item-time">{{serverDetail.time}}</p>
                  <button class="item-button">查看详情</button>
                </div>
              </li>
            </ul>
          </div>  <!--content-->
        </div>
      </div>
      <div class="footer">
          <div class="foot-content">
                  <span class="footer-text"> ￥ 按价格筛选
                  </span>
          </div>
          <div class="foot-content border-left">
            <span class="iconfont icon-paixu"></span>
                  <span class="footer-text">按日期筛选
                  </span>
          </div>
      </div>
    <serviceDetail :serverDetail="selectedServer" ref="serviceDetail"></serviceDetail>
    </div>
  </transition>
</template>

<script>
import Bscroll from 'better-scroll'
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
        desc: '召集想去新疆的旅友',
        gold: '28',
        time: '2017',
        place: '徐州'
      }, {
        id: '0002',
        imgUrl: 'static/image/service2.jpg',
        title: '三亚结伴',
        desc: '7-15出发',
        gold: '19',
        time: '2017',
        place: '三亚'
      }, {
        id: '0003',
        imgUrl: 'static/image/service3.jpg',
        title: '周边游-云龙山',
        desc: '下午出发',
        gold: '7',
        time: '2017',
        place: '徐州'
      }, {
        id: '0004',
        imgUrl: 'static/image/service4.jpg',
        title: '徐州缪斯酒吧，想high你就来',
        desc: '晚上包场',
        gold: '18',
        time: '2017',
        place: '徐州'
      }, {
        id: '0005',
        imgUrl: 'static/image/service1.jpg',
        title: '喀纳斯徒步',
        desc: '召集想去新疆的旅友',
        gold: '9',
        time: '2017',
        place: '徐州'
      }, {
        id: '0006',
        imgUrl: 'static/image/service2.jpg',
        title: '三亚结伴',
        desc: '7-15出发',
        gold: '28',
        time: '2017',
        place: '徐州'
      }, {
        id: '0007',
        imgUrl: 'static/image/service3.jpg',
        title: '周边游-云龙山',
        desc: '下午出发',
        time: '2017',
        place: '徐州'
      }, {
        id: '0008',
        imgUrl: 'static/image/service4.jpg',
        title: '徐州缪斯酒吧，想high你就来',
        desc: '晚上包场',
        time: '2017',
        place: '徐州'
      }, {
        id: '0009',
        imgUrl: 'static/image/service4.jpg',
        title: '徐州缪斯酒吧，想high你就来',
        desc: '晚上包场',
        time: '2017',
        place: '徐州'
      }, {
        id: '00010',
        imgUrl: 'static/image/service4.jpg',
        title: '徐州缪斯酒吧，想high你就来',
        desc: '晚上包场',
        time: '2017',
        place: '徐州'
      }],
      selectedServer: {},
      showService: false
    }
  },
  methods: {
    selectServer(ServerDetail) {
      this.selectedServer = ServerDetail
      this.$refs.serviceDetail.show()
    },
    show() {
      this.showService = true
      this.$nextTick(() => {
        if (!this.scroll) {
          this.scroll = new Bscroll(this.$refs.wrapper, {
            click: true
          })
        } else {
          this.scroll.refresh()
        }
      })
    },
    hide() {
      this.showService = false
    }
  }
}
</script>

<style lang="stylus" scoped>
  .headlist
    overflow: hidden
    position: absolute
    top: 1.1rem
    left: 0
    right: 0
    bottom: 1.1rem
    z-index:2
  .HomeT-enter-active,.HomeT-leave-active
    transition: all 0.3s
  .HomeT-enter, .HomeT-leave-to
    transform: translate3d(100%, 0, 0)
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
    line-height: 1.1rem
    background: #333
    color: white
  .header-title
    width:1.2rem
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
  .item-gold
    float: right
    margin-right : 0.2rem
    font-size: 0.3rem
  .item-desc
    line-height: .4rem
    color: #ccc
    overflow: hidden
    white-space: nowrap
    text-overflow: ellipsis
  .item-time
    margin-top: .2rem
    float: left
  .item-button
    float: right
    line-height: .44rem
    margin-top: .16rem
    background: #ff9300
    padding: 0 .2rem
    border-radius: .06rem
    color: #fff
    //footer
  .footer
    bottom: 0
    position: fixed
    width: 100%
    height: 1.1rem
    background-color: #333
    overflow: hidden
  .foot-content
    float: left
    position: relative
    overflow: hidden
    width: 50%
    text-align: center
    line-height: 0.7rem
    color: #fff
    margin-top:.2rem
  .footer-text
    font-size: .35rem
    margin-left 0.2rem
  .icon-paixu
    font-size : .4rem
</style>
