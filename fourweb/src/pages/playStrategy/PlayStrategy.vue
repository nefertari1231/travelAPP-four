<template>
  <transition name="PlayStrategy" tag="div">
    <div class="bg" v-show="showPlayStrategy">
      <div>
        <div class="header">
          <div class="header-left iconfont icon-left" @click="hide()"></div>
          <div class="header-title">
            旅游攻略
          </div>
        </div>
      </div>  <!--header-->
      <div class="goods">
        <div class="goods__list" ref="goodsList">
          <div class="goods__list-content">
            <div class="goods_menu">
              <ul>
                <li class="goods__list-li" v-for="item in goods" @click="openDetail(item,$event)" :key="item.id">
                  <div class="goods__list-pics">
                    <!-- 蒙层 -->
                    <div class="goods__mosk"></div>
                    <img :src="item.pic" class="list-pics__img">
                  </div>
                  <div class="goods__list-detail">
                    <h2 class="goods__list-title">{{item.title}}</h2>
                    <p class="goods__list-ptag">{{item.ptag}}</p>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <!-- 详情 -->
        <play-strategy-detail ref="detail" :selectGoods="selectGoods"></play-strategy-detail>
      </div>
    </div>
  </transition>
</template>

<script>
import axios from 'axios'
import BScroll from 'better-scroll'
import PlayStrategyDetail from '../playStrategyDetail/playStrategyDetail'
export default {
  name: 'PlayStrategy',
  components: {PlayStrategyDetail},
  data() {
    return {
      goods: [],
      selectGoods: {},
      showPlayStrategy: false
    }
  },
  mounted() {
    axios.get('/api/good.json').then((res) => {
      this.goods = res.data.data
    })
  },
  updated() {
    this.$nextTick(() => {
      this.__initScrolls()
    })
  },
  computed: {
    // 得到收藏数据
    goodsData() {
      return this.$store.state.selectData
    }
  },
  methods: {
    show() {
      this.showPlayStrategy = true
    },
    hide() {
      this.showPlayStrategy = false
    },
    // 添加滚动事件
    __initScrolls() {
      setTimeout(() => {
        if (!this.goodsList) {
          this.goodsList = new BScroll(this.$refs.goodsList, {
            click: true,
            // 滚动的时候派发一个scroll事件
            probeType: 3
          })
        } else {
          this.goodsList.refresh()
        }
      }, 300)
    },
    // 详情页展示
    openDetail(item, event) {
      if (!event._constructed) {
        return
      }
      // 调取子组件的方法
      this.$refs.detail.showDetail()
      this.selectGoods = item

      // 判断当前点击的 数据 是否在store里面有
      if (JSON.stringify(this.$store.state.selectData).indexOf(JSON.stringify(item)) !== -1) {
        // 点击状态
        this.$store.commit('like', 'icon-heart-fill')
        this.$store.commit('showLike', true)
      } else {
        // 初始状态
        this.$store.commit('like', 'icon-heart')
        this.$store.commit('showLike', false)
      }
      if (JSON.stringify(this.$store.state.keepZan).indexOf(JSON.stringify(item)) === -1) {
        this.$store.commit('favourites', 'icon-like')
        this.$store.commit('showZan', false)
      } else {
        this.$store.commit('favourites', 'icon-like--fill')
        this.$store.commit('showZan', true)
      }
    }
  }
}
</script>

<style lang="stylus" scoped>
  .PlayStrategy-enter-active,.PlayStrategy-leave-active
    transition: all 0.3s
  .PlayStrategy-enter, .PlayStrategy-leave-to
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
    margin-left: -.7rem
    flex: 1
    text-align: center
    font-size: .45rem
    margin-bottom: -.2rem
  .header-left
    font-size:.5rem
    margin-left: .3rem
    color: #FFF
  //content
  .goods__list
    position: absolute
    top: 1.1rem
    bottom: .1rem
    z-index: 70
    overflow: hidden
    &-li
      position: relative
      box-sizing: border-box
      padding: 5px
      width: 100%
    &-pics
      position: relative
      background: #333
      border-radius: 4px
      width: 100%
      .list-pics__img
        width: 100%
        height: 100%
        border-radius: 4px
        border: none
    &-detail
      position: absolute
      top: 50%
      left: 50%
      z-index: 3
      transform: translate(-50%, -50%)
      width: 80%
      text-align: center
    &-title
      font-size: .48rem
      color: white
      overflow: hidden
      text-overflow: ellipsis
      white-space: nowrap
      font-weight: normal
    &-ptag
      font-size: .32rem
      color: white
      margin-top: 8px
      font-weight: normal
  .goods__mosk
    position: absolute
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    background: linear-gradient(to top, rgba(0, 0, 0, 0.6) 0%, rgba(0, 0, 0, 0) 100%);
    z-index: 2
</style>
