<template>
<transition name="server" tag="div">
<div v-show="showServiceDetail" class="bg">
  <div>
    <div class="header-fixed">
      <div class="header-left iconfont icon-left" @click="hide()"></div>
      <div class="header-title">
        服务详情
      </div>
      <div class="header-right iconfont icon-reload"></div>
    </div>
  </div> <!--header-->
  <div class="headlist" ref="wrapper">
    <div>
      <div class="single-content">
        <div class="item-header">
          <img class="item-img"  :src="sellImgUrl" />
          <div class="icon-m">
            <div class="iconfont icon-man"></div>
          </div>
          <div class="item-info">
            <p class="item-title">{{sellName}}<span class="item-attention"> + 关注</span></p>
            <p class="item-count">已经出游3次</p>
          </div>
        </div>
      </div> <!--title-->
      <div>
        <div class="cut-off"></div>
        <div class="content-title">详细信息: <span class="content-title-s">{{serverDetail.title}}</span></div>
        <div class="content-desc">{{serverDetail.desc}}</div>
        <div class="content-money">价格：￥{{serverDetail.gold}}</div>
        <div class="content-place">出游城市：{{serverDetail.place}}</div>
        <div class="cut-off2"></div>
      </div>  <!--信息详情-->
      <div>
        <div class="content-banner">
          <div class="banner" @click="handleBannerClick">
            <img class="banner-img" :src="serverDetail.imgUrl" />
            <div class="banner-info">
              <div class="banner-number"><span class="iconfont icon-tupian"></span>4</div>
            </div>
          </div>
        </div>
      </div>  <!--picture-->
      <div>
        <div class="detail-title">注意事项:</div>
        <div class="detail-desc">一切费用自备，建议代一些厚衣服，有意联系我 <br>
          v： afsdafdsf ，脑残勿扰。
        </div>
        <div class="cut-off2"></div>
        <div class="appraise">暂无评价</div>
        <div class="cut-off2"></div>
        <div class="thumbtext"> 等0个人喜欢</div>
      </div>  <!--评价-->
      <div>
        <div class="detail-title">注意事项:</div>
        <div class="detail-desc">一切费用自备，建议代一些厚衣服，有意联系我 <br>
          v： afsdafdsf ，脑残勿扰。
        </div>
        <div class="cut-off2"></div>
        <div class="appraise">暂无评价</div>
        <div class="cut-off2"></div>
        <div class="thumbtext"> 等0个人喜欢</div>
      </div>  <!--评价-->
      <div>
        <div class="detail-title">注意事项:</div>
        <div class="detail-desc">一切费用自备，建议代一些厚衣服，有意联系我 <br>
          v： afsdafdsf ，脑残勿扰。
        </div>
        <div class="cut-off2"></div>
        <div class="appraise">暂无评价</div>
        <div class="cut-off2"></div>
        <div class="thumbtext"> 等0个人喜欢</div>
      </div>  <!--评价-->
    </div>
  </div>
  <common-gallary :imgs="imgs"
                  v-show="showGallary"
                  @close="handleGallaryClose">
  </common-gallary> <!--gallary-->
  <div>
    <div class="footer">
      <div class="function">
        <div class="thumb border-right">
          <div class="iconfont icon-like"></div>
          <div class="desc">点赞</div>
        </div>
        <div class="like">
          <div class="iconfont icon-shoucang1"></div>
          <div class="desc">收藏</div>
        </div>
      </div>
      <div class="talk">聊一聊</div>
      <div class="join" @click="enterOrder">加入</div>
    </div>
  </div>  <!--footer-->
  <order-master :orderMaster="serverDetail" ref="enterOrdered"></order-master>
</div>
</transition>
</template>
<script>
import Bscroll from 'better-scroll'
import CommonGallary from 'common/gallary/Gallary'
import OrderMaster from '../orderMaster/OrderMaster'
export default {
  name: 'ServiceDetail',
  props: {
    serverDetail: Object
  },
  components: {
    OrderMaster,
    CommonGallary
  },
  data() {
    return {
      sellName: '老王',
      sellImgUrl: 'static/image/touxiang7.jpg',
      showServiceDetail: false,
      showGallary: false,
      imgs: ['static/image/service1.jpg', 'static/image/service1.1.jpg', 'static/image/service1.2.jpg', 'static/image/service1.3.jpg']
    }
  },
  methods: {
    show() {
      this.showServiceDetail = true
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
      this.showServiceDetail = false
    },
    handleBannerClick () {
      this.showGallary = true
    },
    handleGallaryClose () {
      this.showGallary = false
    },
    enterOrder() {
      this.$refs.enterOrdered.show()
    }
  }
}
</script>

<style lang="stylus" scoped>
  .headlist
    overflow: hidden
    position: absolute
    top: 0
    left: 0
    right: 0
    bottom: 1.1rem
  .bg
    position: fixed
    background: #FFF
    z-index: 30
    top: 0
    left: 0
    right: 0
    bottom: 0
  .server-enter-active,.server-leave-active
    transition: all 0.3s
  .server-enter, .server-leave-to
    transform: translate3d(100%, 0, 0)
    //header
  .header-fixed
    z-index: 16
    position: fixed
    top: 0
    left: 0
    right: 0
    display: flex
    line-height: 1.1rem
    background: #333
    color: white
    padding-right :0.3rem
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
    font-size:.5rem
    color: #FFF
  //title
  .single-content
    width: 90%
    position: relative
    left: .3rem
    top: 1.3rem
  .item-header
    overflow: hidden
    display: flex
    height: 1.7rem
    margin-bottom: .3rem
  .item-img
    border-radius:50%
    width: 1.25rem
    height: 1.25rem
    margin-top: .2rem
    margin-right: .1rem
  .icon-m
    position: absolute
    top: 1rem
    left: 0.9rem
    right: 0
    bottom: 0
    width: .4rem
    height: .4rem
    background: skyblue
    border-radius:50%
    border: .03rem solid #FFF
  .icon-man,.icon-woman
    position: absolute
    top: 0.05rem
    left: 0.04rem
    right: 0
    bottom: 0
    color: #FFF
  .icon-f
    position: absolute
    top: 1rem
    left: 0.9rem
    right: 0
    bottom: 0
    width: .4rem
    height: .4rem
    background: pink
    border-radius:50%
    border: .03rem solid #FFF
  .item-info
    flex: 1
    padding: .1rem
  .item-title
    margin-top: .2rem
    line-height: .54rem
    font-size: .34rem
    margin-left: .2rem
  .content-title-s
    font-weight: bold
    font-size: .35rem
    margin-left: .2rem
  .content-desc,.content-place
    margin-left: 1.8rem
    margin-bottom: .2rem
  .content-money
    margin-left: 1.8rem
    margin-bottom: .2rem
  .item-attention
    width: 1.1rem
    float: right
    font-size: .3rem
    border: .01rem solid red
    text-align: center
    border-radius: 10%
    color: red
  .icon-right
    font-size: .4rem
    float: right
    margin-right: .2rem
    margin-top: -.1rem
  .item-count
    margin-top: .2rem
    margin-left: .2rem
  //gallary
  .cut-off
    margin-top: 1.5rem
    height: .1rem
    background: #ddd
  .cut-off2
    height: .1rem
    background: #ddd
  .content-title
    margin: .15rem .2rem
    font-size: .3rem
  .content-banner
    padding: .2rem .3rem
  .banner
    position: relative
    overflow: hidden
    height: 0
    padding-bottom: 55%
  .banner-img
    width: 100%
  .banner-info
    position: absolute
    left: 0
    right: 0
    bottom: 0
    line-height: .6rem
    color: #fff
  .banner-number
    float: right
    height: .32rem
    line-height: .32rem
    padding: 0 .3rem
    border-radius: .2rem
    background: rgba(0, 0, 0, .8)
    font-size: .3rem
  .iconfont
    margin-right: .1rem
  .detail-title
    margin-left: .2rem
    font-size: .4rem
  .detail-desc
    margin-top: .2rem
    padding: 0 .6rem
    margin-bottom: .4rem
  .appraise
    text-align: center
    font-size: .4rem
    margin: .2rem .2rem
  .thumbtext
    float: right
    margin: .2rem
  //footer
  .footer
    bottom: 0
    position: fixed
    width: 100%
    height: 1.1rem
  .function
    float: left
    height: 1.1rem
    width: 33.3%
    background: #eee
    color: #aaa
  .icon-shoucang1,.icon-like
    margin-top:.1rem
    font-size: .4rem
  .thumb
    float: left
    height: 1.1rem
    line-height: 1.9em
    width: 50%
    text-align: center
  .like
    float: left
    height: 1.1rem
    line-height: 1.9em
    width: 50%
    text-align: center
  .talk
    float: left
    height: 1.1rem
    line-height: 1.1rem
    width: 33.3%
    background: dodgerblue
    color: #fff
    text-align: center
  .join
    float: left
    height: 1.1rem
    line-height: 1.1rem
    width: 33.3%
    background: #333
    color: #fff
    text-align: center
</style>
