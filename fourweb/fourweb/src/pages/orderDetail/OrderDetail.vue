<template>
  <transition name="orderDetail" tag="div">
    <div v-show="showOrderDetail" class="bg">
      <div>
        <div class="header">
          <div class="header-right iconfont icon-left" @click="hide()"></div>
          <div class="header-title">
            订单详情
          </div>
        </div>
      </div> <!--header-->
        <!--<ul class="content-bg">-->
          <!--<li class="border-bottom">-->
              <!--<span class="title">订单编号 :</span>-->
              <!--<span class="content" ></span>-->
          <!--</li>-->
          <!--<li class="border-bottom">-->
              <!--<span class="title">下单时间 :</span>-->
              <!--<span class="content" ></span>-->
          <!--</li>-->
        <!--</ul>-->
      <div class="cut-off2">本单本公司不服责任，谨慎下单</div>
        <div class="item-header">
          <img class="item-img"  src="static/image/touxiang7.jpg" />
          <div class="item-name">老王</div>
        </div>
        <div class="item-body">
          <div class="item-title">喀纳斯徒步</div>
          <div class="item-desc">{{ orderDetail.serverDescription }}</div>
        </div>
      <div class="cut-off"></div>
      <div class="money-title">价格：</div>
      <div class="money-count">{{ orderDetail.serverPrice }}</div>
      <div class="cut-off3"></div>
      <div class="talk-bg"></div>
      <ul class="content-bg">
        <li class="border-bottom">
          <span class="title">购买人 : </span>
          <span class="content" >{{ orderDetail.buyerName }}</span>
        </li>
        <li class="border-bottom">
          <span class="title">联系电话 : </span>
          <span class="content" >{{ orderDetail.buyerPhone }}</span>
        </li>
        <li class="border-bottom">
          <span class="title">购买数量 : </span>
          <span class="content" >{{ orderDetail.count }}</span>
        </li>
        <li class="border-bottom">
          <span class="title">合计费用 :</span>
          <span class="content" >{{ orderDetail.count * orderDetail.serverPrice }}</span>
        </li>
        <li class="border-bottom">
          <span class="title">买家备注 :</span>
          <span class="content" >{{ orderDetail.serverRemark }}</span>
        </li>
        <li class="border-bottom">
          <span class="title">商家提醒 :</span>
          <span class="content" >{{ orderDetail.buyerTalk }}</span>
        </li>
      </ul>
      <div>
        <div class="footer">
         <div class="return" @click="toMessage">查看订单</div>
          <div class="cancel" >取消服务</div>
        </div>
      </div>  <!--footer-->
      </div>
  </transition>
</template>

<script>
export default {
  name: 'orderDetail',
  props: {
    orderDetail: Object
  },
  data() {
    return {
      showOrderDetail: false
    }
  },
  methods: {
    toMessage() {
      this.$router.go(0)
    },
    show() {
      this.showOrderDetail = true
    },
    hide() {
      this.showOrderDetail = false
    }
  }
}
</script>

<style lang="stylus" scoped>
  .bg
    position: fixed
    background: #FFF
    z-index: 60
    top: 0
    left: 0
    right: 0
    bottom: 0
  .orderDetail-enter-active,.orderDetail-leave-active
    transition: all 0.3s
  .orderDetail-enter, .orderDetail-leave-to
    opacity: 0
    transform: translate3d( 100%,0,0)
  //header
  .header
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
    margin-left: -.9rem
  .header-right
    font-size:.5rem
    margin-left: .3rem
  //content
  .content-bg
    position: hidden
    margin: 0 .2rem 0 .2rem
  .content
    width: 50%
    height: 0.7rem
    line-height 0.7rem
    font-size: 0.4rem
  .cut-off2
    margin-top 0.2rem
    height: .5rem
    background: #ddd
    line-height .5rem
    padding-left 0.2rem
  .item-detail
    padding-bottom: 40%
    height: 2rem
  .item-header
    float left
    margin-left: 0.5rem
    width:20%
  .item-img
    border-radius:50%
    width: 1.1rem
    height: 1.1rem
    margin-top: .2rem
    margin-right: .1rem
  .item-name
    margin-top:0.2rem
    margin-left: 0.2rem
  .item-body
    float :left
    margin-top: 0.2rem
    width: 67%
  .item-title
    font-size: 0.35rem
  .item-desc
    margin-top: 0.1rem
    height: 2rem
  .cut-off
    margin-top 3rem
    height: .03rem
    background: #ddd
  .cut-off3
    margin-top 0.5rem
    height: .04rem
    background: #ddd
  .money-title
    float left
    margin-top : 0.18rem
    margin-left: .2rem
  .money-count
    margin-top : 0.18rem
    margin-right: .2rem
    float right
  .talk-bg
    height: 1rem
    border-bottom 0.15rem  solid #ddd
  //footer
  .footer
    bottom: 0
    position: fixed
    width: 100%
    height: 1.1rem
    background : dodgerblue
    line-height :1.1rem
    text-align:center
    color white
    font-size:0.3rem
  .footer a{
    color #fff;
  }
  .footer .return {
    float left;
    background #000;
    width 50%;
  }
</style>
