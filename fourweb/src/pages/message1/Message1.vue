<template>
  <transition name="message1" tag="div">
    <div v-show="message1show" class="bg">
      <div>
        <div class="header-fixed">
          <div class="header-left iconfont icon-left" @click="hide()"></div>
          <div class="header-title">
            订单详情
          </div>
        </div>
      </div> <!--header-->
      <div class="headlist" ref="wrapper" >
        <div>
          <div :class="{'Message1_bg':msg == ''}" >
            <ul>
              <li class="item border-bottom" v-for="item in order" :key="item.orderId">
                    <div class="item-info">
                      <p class="item-title">订单号：{{ item.orderId }}</p>
                      <p class="item-price">{{ item.orderAmount }}￥</p>
                      <p class="item-desc">手机号码：15673733303</p>
                      <p class="item-time">{{ item.createTime }}</p>
                    </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </transition>
</template>
<script>
import axios from 'axios'
import Bscroll from 'better-scroll'
export default {
  name: 'Message1',
  data () {
    return {
      order: null,
      msg: [],
      message1show: false
    }
  },
  mounted() {
    axios.get('http://localhost:8090/api/order/all?userId=' + localStorage.getItem('Id'))
      .then(response => {
        this.msg = ['1']
        this.order = response.data.data
      })
  },
  methods: {
    show() {
      this.message1show = true
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
      this.message1show = false
    }
  }
}
</script>
<style lang="stylus" scoped>
  .Message1_bg{
    background: url('/static/image/bgi.jpg') no-repeat center;background-size:cover
  }
  .headlist
    overflow: hidden
    position: absolute
    top: 1.1rem
    left: 0
    right: 0
    bottom: 0
    z-index: 0
  .bg
    position: fixed
    background: #FFF
    z-index: 60
    top: 0
    left: 0
    right: 0
    bottom: 0
  //header
  .header-fixed
    z-index: 30
    position: fixed
    top: 0
    left: 0
    right: 0
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
  .icon-left
    font-size:.5rem
    margin-left: .3rem
    color: #FFF
  //content
  .icons
    margin-top: .4rem
    overflow: hidden
    height: 4.2rem
  .icon
    float: left
    overflow: hidden
    width:33.3%
    height: 2rem
    margin-bottom: .2rem
  .imgs
    overflow: hidden
    height: 1.4rem
    line-height: 1.4rem
    text-align: center
    padding: 0 .75rem
  .imgs-icon
    margin-top: .2rem
    height: 1rem
    line-height: 1rem
    text-align: center
  .icon-desc
    text-align: center
    height: .6rem
    line-height:.8rem
  .iconfonts
    border-radius: 50%
    font-size: .6rem
    color: #FFF
    height: 1rem
    width: 1rem
  .icon-dingdan
    background: green
  .icon-bulb
    background: #FFA500
  .icon-xiaoxi
    background: #9400D3
  .icon-comment
    background: skyblue
  .icon-heart
    background: red
  .icon-fuhao-
    background: #FF7F50
  .Message_img
    height:2rem
  .Message1_img
    width:2rem
  .item
    height: 1.5 rem;
    line-height .5 rem;
    padding:0 .8em;
  .item .item-price
    float:right
</style>
