<template>
  <transition name="order" tag="div">
    <div class="bg" v-show="showOrder">
      <div>
        <div class="header">
          <div class="header-right iconfont icon-left" @click="hide()"></div>
          <div class="header-title">
            提交订单
          </div>
        </div>
      </div> <!--header-->
      <div>
        <ul class="content-bg">
            <li class="border-bottom">
              <div class="iconfont icon-user">
              <span class="title">购买人 :</span>
            <input class="content"  name="user" placeholder="购买人姓名" v-model="buyerName"/>
              </div>
            </li>
            <li class="border-bottom">
              <div class="iconfont icon-shouji">
              <span class="title">电话 :</span>
            <input class="content" name="user" placeholder="电话号码" v-model="buyerPhone"/>
              </div>
            </li>
            <li class="border-bottom">
              <div class="iconfont icon-dingdan">
                <span class="title">订单数量 :</span>
                <div class="content2">
                <div class="input-number">
                  <div class="input-sub" @click="changeNumber(-1)"></div>
                  <input class="input-num" v-model="count" />
                  <div class="input-add" @click="changeNumber(1)"></div>
                </div>
                </div>
              </div>
            </li>
            <li class="border-bottom">
              <div class="iconfont icon-comment">
                <span class="title">留言给他 :</span>
                <input class="content"  name="user" placeholder="给他留言" v-model="buyerTalk"/>
              </div>
            </li>
        </ul>
        <div class="cut-off2"></div>
        <div class="item-header">
          <img class="item-img"  src="static/image/touxiang7.jpg" />
          <div class="item-info">老王</div>
          <div class="item-desc">喀纳斯徒步</div>
        </div>
        <div class="cut-off2"></div>
        <div class="money">价格:{{orderMaster.gold | formatMoney}}</div>
      </div> <!--content-->
      <div>
        <div class="footer">
          <div class="ordermoney">订单金额:<span class="count">{{moneyAll | formatMoney}}</span></div>
          <div class="sure" @click="enterOrderDetail">确认</div>
        </div>
      </div>  <!--footer-->
      <order-detail ref="orderDetail"></order-detail>
    </div>
  </transition>
</template>

<script>
import OrderDetail from '../orderDetail/OrderDetail'
export default {
  name: 'OrderMaster',
  components: {OrderDetail},
  props: {
    orderMaster: Object
  },
  data() {
    return {
      showOrder: false,
      count: 4,
      buyerName: '',
      buyerPhone: '',
      buyerTalk: '请保证安全'
    }
  },
  filters: {
    formatMoney(value) {
      return '￥' + value + '.00'
    }
  },
  methods: {
    show() {
      this.showOrder = true
    },
    hide() {
      this.showOrder = false
    },
    changeNumber: function (way) {
      if (way > 0) {
        this.count++
      } else {
        this.count--
        if (this.count < 1) {
          this.count = 1
        }
      }
    },
    enterOrderDetail () {
      if (this.buyerName === '' || this.buyerPhone === '') {
        this.$toast.fail('请完善订单')
      } else {
        this.$refs.orderDetail.show()
      }
    }
  },
  computed: {
    moneyAll () {
      return this.orderMaster.gold * this.count
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
  .order-enter-active,.order-leave-active
    transition: all 0.3s
  .order-enter, .order-leave-to
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
  .content-bg
    position: hidden
    margin: 0.2rem .2rem 0 .2rem
  .icon-shouji, .icon-user,.icon-dingdan,.icon-comment
    font-size: .5rem
    margin-right: .2rem
  .content
    width: 50%
    height: 1rem
    line-height 1rem
    font-size: 0.35rem
  .content2
    height: 1rem
    line-height 0.9rem
    font-size: 0.35rem
    margin-top :.2rem
    display: inline-flex
  .title
    font-size : 0.35rem
    margin-left: .1rem
  .input-number
    margin-left .1rem
    width: 1.8rem
    height: 0.6rem
    line-height 0.6rem
    display: flex
    border: 0.04rem solid #eee
  .input-sub
    width: 0.6rem
    background: url('~@/../static/image/icon_sub.png') 50% 50% no-repeat
    background-size: 60%
    background-color: #f4f4f4
  .input-num
    width: 40%
    line-height: 0.6rem
    text-align center
  .input-add
    width: 0.6rem
    background: url('~@/../static/image/icon_add.png') 50% 50% no-repeat
    background-size: 60%
    background-color: #f4f4f4
  .cut-off2
    height: .1rem
    background: #ddd
  .item-header
    overflow: hidden
    display: flex
    height: 1.7rem
    margin-left: 0.5rem
  .item-img
    border-radius:50%
    width: 1.25rem
    height: 1.25rem
    margin-top: .2rem
    margin-right: .1rem
  .item-info
    margin-top : 0.3rem
    margin-left: 0.4rem
  .item-desc
    margin-top: 1rem
    margin-left: -0.5rem
    font-size: 0.33rem
  .money
    margin-top :0.5rem
    margin-left: 0.6rem
    font-size :0.35rem
  //footer
  .footer
    bottom: 0
    position: fixed
    width: 100%
    height: 1.1rem
  .ordermoney
    float: left
    height: 1.1rem
    line-height: 1.1rem
    width: 70%
    color: #000
    text-align: center
  .sure
    float: left
    height: 1.1rem
    line-height: 1.1rem
    width: 30%
    background: #333
    color: #fff
    text-align: center
  .count
    color: orange
</style>
