<template>
  <transition name="message3" tag="div">
    <div v-show="message3show" class="bg">
      <div class="header">
        <div class="header-left iconfont icon-left" @click="hide()"></div>
        <div class="header-title">
          消息评论
        </div>
        <div class="header-right">{{discussList.length}}条评论</div>
      </div>
      <div class="headlist" ref="wrapper">
        <div>
          <div>
            <ul v-for="item in discussList" :key="item.id">
              <li class="item-header">
                对订单<span class="item-title">{{item.orderSn}}</span>的评论
              </li>
              <li>
                <div class="item-content">{{item.discussContent}}
                  <span>     {{item.discussValue}}颗星</span>
                </div>
                <!--<div class="item-star">{{item.star}}颗星</div>-->
                <div class="item-pic border-bottom" v-if="item.discussImg">
                  <div class="pic" v-for="pic of item.discussImg.split(',')" :key="pic.id">
                    <div class="pic-content">
                      <img class="pic-contents" :src="pic" />
                    </div>
                  </div>
                </div>
              </li>
            </ul>
            <!--<div>-->
              <!--对订单<span>{{orderName}}</span>的评论-->
            <!--</div>-->
            <!--<div>{{discussContent}}</div>-->
            <!--<div>{{discussStar}}</div>-->
            <!--<img class="" src="static/image/share13.jpg"/>-->
            <!--<div>{{discussImg}}</div>-->
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
  name: 'Message3',
  data () {
    return {
      message3show: false,
      discussList: [{
        id: '0001',
        orderId: '1',
        discussContent: '很好的啊',
        star: '5',
        PicList: [{
          id: '0001',
          PimgUlr: 'static/image/share1.jpg'
        }, {
          id: '0002',
          PimgUlr: 'static/image/share2.jpg'
        }, {
          id: '0003',
          PimgUlr: 'static/image/share3.jpg'
        }, {
          id: '0004',
          PimgUlr: 'static/image/share4.jpg'
        }]
      }, {
        id: '0002',
        orderId: '2',
        discussContent: '很好的啊',
        star: '4',
        PicList: [{
          id: '0001',
          PimgUlr: 'static/image/share1.jpg'
        }, {
          id: '0002',
          PimgUlr: 'static/image/share2.jpg'
        }, {
          id: '0003',
          PimgUlr: 'static/image/share3.jpg'
        }, {
          id: '0004',
          PimgUlr: 'static/image/share4.jpg'
        }]
      }, {
        id: '0003',
        orderId: '3',
        discussContent: '很好的啊',
        star: '1',
        PicList: [{
          id: '0001',
          PimgUlr: 'static/image/share1.jpg'
        }, {
          id: '0002',
          PimgUlr: 'static/image/share2.jpg'
        }, {
          id: '0003',
          PimgUlr: 'static/image/share3.jpg'
        }, {
          id: '0004',
          PimgUlr: 'static/image/share4.jpg'
        }]
      }, {
        id: '0004',
        orderId: '8',
        discussContent: '很好的啊',
        star: '1',
        PicList: [{
          id: '0001',
          PimgUlr: 'static/image/share1.jpg'
        }, {
          id: '0002',
          PimgUlr: 'static/image/share2.jpg'
        }, {
          id: '0003',
          PimgUlr: 'static/image/share3.jpg'
        }, {
          id: '0004',
          PimgUlr: 'static/image/share4.jpg'
        }]
      }, {
        id: '0005',
        orderId: '7',
        discussContent: '很好的啊',
        star: '1',
        PicList: [{
          id: '0001',
          PimgUlr: 'static/image/share1.jpg'
        }, {
          id: '0002',
          PimgUlr: 'static/image/share2.jpg'
        }, {
          id: '0003',
          PimgUlr: 'static/image/share3.jpg'
        }, {
          id: '0004',
          PimgUlr: 'static/image/share4.jpg'
        }]
      }]
    }
  },
  methods: {
    show() {
      axios.get('http://localhost:8090/api/order/comment', {
        params: {
          userId: localStorage.getItem('Id')
        },
        changeOrigin: true
      })
        .then(response => {
          this.discussList = response.data.data
        })
      this.message3show = true
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
    // msg_add() {
    //   console.log(this.new_msg)
    //   this.msg.push({text: this.new_msg})
    //   this.textarea_show = false
    // },
    hide() {
      this.message3show = false
    },
    length() {

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
//header
  .headlist
    overflow: hidden
    position: absolute
    top: 1.1rem
    left: 0
    right: 0
    bottom: .1rem
  .header
    overflow: hidden
    position: relative
    display: flex
    line-height: 1.1rem
    background: #333
    color: white
  .header-title
    width:100%
    flex: 1
    text-align: center
    font-size: .45rem
    margin-bottom: -.2rem
    margin-right: -.8rem
  .header-left
    font-size:.5rem
    margin-left: .3rem
  .header-right
    font-size: .3rem
    margin-right: .2rem
  //content
  .item-header
    font-size: .44rem
    padding: .2rem
  .item-title
    color: blue
  .item-content
    margin: .1rem 0
    padding: 0 .3rem
    overflow: hidden;
    -webkit-line-clamp: 2;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-box-orient: vertical;
  .item-pic
    overflow: hidden
    height: 0
    padding-bottom: 20%
    .pic
      float: left
      position: relative
      overflow: hidden
      width: 20%
      padding-bottom: 20%
      .pic-content
        padding: .2rem
        box-sizing: border-box
        position: absolute
        top: 0
        left: 0
        right: 0
        bottom: 0
        .pic-contents
          height: 100%
          width: 100%
          display: block
          margin: 0 auto
          object-fit: cover
</style>
