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
                  :key="serverDetail.serverId">
                <img class="item-img" src="static/image/service2.jpg" />
                <div class="item-info">
                  <p class="item-title">{{serverDetail.serverName}}</p>
                  <p class="item-gold">￥{{serverDetail.serverPrice}}</p>
                  <p class="item-desc">{{serverDetail.serverDescription}}</p>
                  <p class="item-time">{{serverDetail.createTime}}</p>
                  <button class="item-button">查看详情</button>
                </div>
              </li>
            </ul>
          </div>  <!--content-->
        </div>
      </div>
      <div class="footer">
          <div class="foot-content" @click="sortPrice()">
            <span class="footer-text"> ￥ 按价格筛选</span>
          </div>
          <div class="foot-content border-left" @click="sortDate()">
            <span class="iconfont icon-paixu"></span>
            <span class="footer-text">按日期筛选</span>
          </div>
      </div>
    <serviceDetail :serverDetail="selectedServer" ref="serviceDetail"></serviceDetail>
    </div>
  </transition>
</template>

<script>
import axios from 'axios'
import Bscroll from 'better-scroll'
import serviceDetail from '@/pages/serviceDetail/ServiceDetail'
export default {
  name: 'Service',
  components: {
    serviceDetail
  },
  data() {
    return {
      serviceList: [],
      selectedServer: {},
      showService: false
    }
  },
  mounted() {
    axios.get('http://localhost:8090/api/servers/all', {})
      .then(response => {
        this.serviceList = response.data.data
      })
  },
  methods: {
    selectServer(ServerDetail) {
      this.selectedServer = ServerDetail
      this.$refs.serviceDetail.show()
      axios.get('http://localhost:8090/api/users/query?userId=' + localStorage.getItem('Id'))
        .then(res => {
          console.log(res.data.data)
        })
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
    },
    compare: function (prop, type) {
      type = type || 'desc'
      var flag1, flag2
      if (type === 'desc') {
        flag1 = -1
        flag2 = 1
      } else if (type === 'asc') {
        flag1 = 1
        flag2 = -1
      }
      return function (obj1, obj2) {
        var val1 = obj1[prop]
        var val2 = obj2[prop]
        if (val2 < val1) {
          return flag1
        } else if (val2 > val1) {
          return flag2
        } else {
          return 0
        }
      }
    },
    sortPrice() {
      var type = this.gold_isAsc ? 'desc' : 'asc'
      this.serviceList.sort(this.compare('gold', type))
      this.gold_isAsc = !this.gold_isAsc
    },
    sortDate() {
      this.serviceList.sort((a, b) => {
        let aTimeString = a.time
        let bTimeString = b.time
        aTimeString = aTimeString.replace(/-/g, '/')
        bTimeString = bTimeString.replace(/-/g, '/')
        let aTime = new Date(aTimeString).getTime()
        let bTime = new Date(bTimeString).getTime()
        // 降序排列
        return bTime - aTime
      })
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
    opacity: 0
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
