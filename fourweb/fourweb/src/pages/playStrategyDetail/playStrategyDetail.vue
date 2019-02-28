<template>
  <transition name="move">
    <div class="viewspot" v-show="show" ref="viewspot">
      <div class="viewspot-content">
        <div class="close iconfont icon-left" @click.stop.prevent="close"></div>
        <!-- 景点介绍 -->
        <div class="viewspot__intro" v-for="item in selectGoods.detailInfo" :key="item.id">
          <div class="viewspot__intro-img">
            <!-- 蒙层 -->
            <div class="viewspot__mosk"></div>
            <img :src="selectGoods.pic">
            <div class="viewspot__intro-title">
              <h2 class="title">{{selectGoods.title}}</h2>
              <p class="ptag">{{selectGoods.ptag}}</p>
            </div>
          </div>
          <div class="viewspot__intro-text border-1px">
            <p class="first">
              <strong class="em">出发君说:</strong>{{item.introduce}}
            </p>
            <p><strong class="em">推荐人群:</strong>{{item.tag}}</p>
          </div>
          <ul class="menu">
            <div class="menu__title border-1px">
              <p class="menu__title-date common">DAY1</p>
              <p class="menu__title-spot common">{{item.spot}}</p>
              <p class="menu__title-overview"><strong>今日概览:</strong>{{item.overview}}</p>
            </div>
            <!-- 遍历列表 -->
            <li v-for="sites in item.sites" class="list border-1px" :key="sites.id" ref="h2Height">
              <div class="list__header">
                <i class="iconfont icon-jingdian1 icon"></i>
                <h2 class="list__title">{{sites.sitesName}}</h2>
              </div>
              <div class="list__warrper" ref="picWrapper">
                <ul class="list__menu" ref="ulWidth">
                  <li class="list__img" v-for="img in sites.sitesImg" :key="img.id">
                    <img :src="img" alt="图片" ref="list">
                  </li>
                </ul>
              </div>
              <div class="list__text">
                <div class="star-warrper">
                  <star :score="sites.score"></star>
                </div>
                <h3 class="list__text-tag">#{{sites.sitesTag}}#</h3>
                <p class="list__text-common"><strong class="em">出发君说:</strong>{{sites.sitesIntro}}</p>
                <p class="list__text-common"><strong class="em">游玩方式:</strong>{{sites.playWay}}</p>
                <p class="list__text-common"><strong class="em">如何到达:</strong>{{sites.getWay}}</p>
              </div>
            </li>
            <div class="line"></div>
          </ul>
          <!-- end -->
          <div class="menu__end">
            <i class="menu__end-logo"></i>
            <div class="style"></div>
          </div>
        </div>
        <!-- 评论 -->
        <div class="comment" ref="commentHeight">
          <h2 class="comment__title">评论</h2>
          <div class="comment__textarea">
            <textarea class="textarea" placeholder="请填写评论" contenteditable="" v-model="words"></textarea>
            <p class="comment__words">
              <span class="comment__words-number">{{wordsLength}}</span>
              <span>/270</span>
            </p>
            <p>
              <a class="comment__submit" :class="{'haswords':wordsLength>0}" @click="submit">评论</a>
            </p>
          </div>
          <!-- 评论列表 -->
          <comment :comments="selectFoods"></comment>
        </div>
        <!-- 样式 -->
      </div>
      <!-- 滚动导航按钮 -->
      <div class="right__nav" @click="scrollMenu" v-show="menuShow">
        <p class="right__nav-warrper">
          <i class="right__nav__icon down1"></i>
          <!-- <i class="right__nav__icon down2"></i> -->
          <i class="right__nav__icon down3"></i>
        </p>
      </div>
      <!-- 滚动菜单 -->
      <transition name="scroll">
        <div class="scroll__menu" v-show="scrollShow">
          <div class="scroll__menu-mosk"></div>
          <!-- <h2 class="h2title">景点跳转</h2> -->
          <ul class="scroll__menu-ul">
            <li v-for="(item,index) in getSitesName" class="scroll__menu-li" :key="item.id">
              <p class="scroll__menu-ptag" @click="scrollEment(item,index)" :class="{'click-active':currentIndex===index}">景点{{index+1}},{{item.sitesName}}
              </p>
            </li>
          </ul>
          <div class="scroll__line"></div>
          <!-- 关闭按钮 -->
          <div class="iconfont icon-Group-" @click="closeScroll"></div>
        </div>
      </transition>
      <v-footer :count="CommentCount" :select="selectGoods"></v-footer>
    </div>
  </transition>
</template>

<script >
import BScroll from 'better-scroll'
import Comment from '../playComment/comment.vue'
import Star from '../star/star.vue'
import playFoot from '../playFooter/playFooot.vue'
export default {
  name: 'playStrategyDetail',
  props: ['selectGoods'],
  data() {
    return {
      show: false,
      words: '',
      abc: {},
      getData: [],
      flag: 1,
      scrollShow: false,
      menuShow: true,
      currentIndex: 0
    }
  },
  components: { comment: Comment, star: Star, 'v-footer': playFoot },
  watch: {
    seller() {
      this.$nextTick(() => {
        this.showDetail()
      })
    }
  },
  updated() {
    this.$nextTick(() => {
      this.initScroll()
    })
  },
  methods: {
    // 滚动菜单
    scrollMenu() {
      this.scrollShow = true
      this.menuShow = false
    },
    // 关闭滚动菜单
    closeScroll() {
      this.scrollShow = false
      this.menuShow = true
    },
    // 滚动那那个景点
    scrollEment(item, index) {
      let sitesName = item.sitesName
      this.currentIndex = index
      // console.log(sitesName)
      if (sitesName === this.getSitesName[0].sitesName) {
        let elOne = this.$refs.h2Height[0]
        this.scroll.scrollToElement(elOne, 500)
      }
      if (sitesName === this.getSitesName[1].sitesName) {
        let elTwo = this.$refs.h2Height[1]
        this.scroll.scrollToElement(elTwo, 500)
      }
      if (sitesName === this.getSitesName[2].sitesName) {
        let elThere = this.$refs.h2Height[2]
        this.scroll.scrollToElement(elThere, 500)
      }
      if (sitesName === this.getSitesName[3].sitesName) {
        let elFour = this.$refs.h2Height[3]
        this.scroll.scrollToElement(elFour, 500)
      }
    },
    showDetail() {
      this.show = true
    },
    // 滚动条
    initScroll() {
      if (!this.scroll) {
        this.scroll = new BScroll(this.$refs.viewspot, {
          click: true
        })
      } else {
        this.scroll.refresh()
      }
    },
    close() {
      this.show = false
    },
    // 提交按钮
    submit() {
      let foodtype = []
      foodtype = this.selectGoods.comment
      if (this.words.length >= 1) {
        this.abc.content = this.words
        this.abc.avatar = this.$store.state.userIcon
        this.abc.user = this.$store.state.userNickname
        this.abc.date = new Date()
        foodtype.unshift(this.abc)
      } else {
        return foodtype
      }
      this.getData = foodtype
      this.flag = 2
      this.words = ''
      console.log(foodtype)
    }
  },
  computed: {
    // 得到景点名称
    getSitesName() {
      let dates = []
      let sitesData = this.selectGoods.detailInfo
      for (let i in sitesData) {
        dates = sitesData[i].sites
      }
      return dates
    },
    wordsLength() {
      let length
      length = this.words.length
      return length
    },
    selectFoods() {
      let food = []
      if (this.flag === 2) {
        food = this.getData
      } else {
        food = this.selectGoods.comment
      }
      return food
    },
    CommentCount() {
      let count = 0
      for (let i in this.selectGoods.comment) {
        count = ++i
      }
      return count
    }
  }
}
</script>

<style lang="less" scoped>
  /*1像素边框*/

  @media(-webkit-min-device-pixel-ratio:1.5),
  (min-device-pixel-ratio:1.5) {
    .border-1px {
      &:after {
        -webkit-transform: scaleY(0.7);
        transform: scaleY(0.7);
      }
    }
  }

  @media(-webkit-min-device-pixel-ratio:2),
  (min-device-pixel-ratio:2) {
    .border-1px {
      &:after {
        -webkit-transform: scaleY(0.5);
        transform: scaleY(0.5);
      }
    }
  }
  /*行高*/

  .line-height(@h: 44px, @l: 44px) {
    height: @h;
    line-height: @l;
  }
  /*字体*/

  .font-size(@s: 12px, @c: #fff) {
    font-size: @s;
    color: @c;
  }

  // 公共样式
  .commons {
    .em {
      padding-right: 5px;
      font-weight: bold;
    }
  }
  /*动画*/
  .move-enter,
  .move-leave-to {
    opacity: 0;
    transform: translate3d(100%, 0, 0);
  }

  .move-enter-active,
  .move-leave-active {
    transition: all 0.3s;
  }

  .viewspot {
    position: fixed;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    z-index: 120;
    background: #f5f5f5;
    opacity: 1;
    .close {
      position: absolute;
      top: 0;
      left: 0;
      padding: 15px;
      font-size: 24px;
      color: rgba(255, 255, 255, 0.8);
      z-index: 111;
    }
    &__intro {
      position: relative;
      bottom: 48px;
      &-img {
        position: relative;
        width: 100%;
        padding-top: 90%;
        >img {
          position: absolute;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
        }
      }
      .viewspot__mosk {
        position: absolute;
        top: 0;
        left: 0;
        bottom: 0;
        right: 0;
        background: linear-gradient(to top, rgba(0, 0, 0, 0.6) 0%, rgba(0, 0, 0, 0) 100%);
        z-index: 2;
      }
      &-title {
        position: absolute;
        top: 50%;
        left: 50%;
        z-index: 3;
        transform: translate(-50%, -50%);
        width: 80%;
        text-align: center;
      }
      .title {
        .font-size(24px, #fff);
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        font-weight: lighter;
      }
      .ptag {
        .font-size(16px, #fff);
        margin-top: 8px;
        font-weight: lighter;
      }
      &-text {
        position: relative;
        padding: 16px;
        font-size: 14px;
        color: #666;
        line-height: 1.5;
        &:after {
          content: '';
          position: absolute;
          left: 0;
          bottom: 0;
          width: 100%;
          border-top: 1px solid rgba(7, 17, 27, 0.1);
        }
      }
      .first {
        padding-bottom: 15px;
      }
      .em {
        .commons>.em
      }
    }
  }
  /*景点列表*/

  .menu {
    position: relative;
    &__title {
      position: relative;
      padding: 10px 0;
      &:after {
        content: '';
        position: absolute;
        left: 0;
        bottom: 0;
        width: 100%;
        border-top: 1px solid rgba(7, 17, 27, 0.2);
      }
      .common {
        .font-size(12px, dodgerblue);
      }
      &-date {
        padding-left: 15px;
        &:before {
          display: inline-block;
          content: "";
          width: 16px;
          height: 16px;
          border-radius: 50%;
          background: dodgerblue;
          margin-right: 20px;
          border: 2px solid #f5f5f5;
          box-sizing: border-box;
        }
      }
      &-spot {
        padding: 10px 0 0 50px;
      }
      &-overview {
        .font-size(12px, #666);
        padding: 15px 15px 15px 50px;
        line-height: 1.5;
      }
    }
    /*列表*/
    .list {
      position: relative;
      padding: 0 15px 25px 15px;
      z-index: 5;
      &:after {
        content: '';
        position: absolute;
        left: 0;
        bottom: 0;
        width: 100%;
        border-top: 1px solid rgba(7, 17, 27, 0.2);
      }
      &__header {
        padding: 15px 0 15px 0;
      }
      &__title {
        display: inline-block;
        font-size: 16px;
        color: #333;
        line-height: 1.5px;
      }
      .icon {
        display: inline-block;
        width: 24px;
        height: 24px;
        background: dodgerblue;
        border-radius: 50%;
        text-align: center;
        line-height: 20px;
        color: #f5f5f5;
        box-sizing: border-box;
        border: 2px solid #f5f5f5;
        margin-left: -5px;
      }
      &__warrper {
        width: 100%;
        overflow: hidden;
      }
      &__menu {
        width: 100%;
        height: 275px;
        overflow: hidden;
        @media only screen and (max-width: 320px) {
          height: 230px;
        }
      ;
      }
      &__img {
        width: 100%;
        >img {
          width: 100%;
          height: 100%;
          border-radius: 4px;
        }
      }
      &__text {
        background: #fff;
        padding: 0 10px;
        font-size: 14px;
        color: #666;
        line-height: 1.5;
        &-tag {
          font-size: 16px;
          font-weight: 700;
          padding: 10px 0;
        }
        &-common {
          padding-bottom: 15px;
        }
      }
      .em {
        .commons>.em
      }
    }
    .line {
      position: absolute;
      top: 30px;
      left: 21px;
      z-index: 0;
      width: 4px;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.06);
    }
  }

  .menu__end {
    position: relative;
    &-logo {
      display: inline-block;
      width: 194px;
      height: 68px;
      background: url(../../../static/image/end-bd.png) no-repeat left center;
      transform: scale(0.5, 0.5);
    }
  }

  .star-warrper {
    padding: 5px 0;
  }

  .style {
    width: 100%;
    height: 10px;
    background: rgba(0, 0, 0, 0.04);
  }

  .comment {
    position: relative;
    padding: 15px 15px 0 15px;
    bottom: 48px;
    &__title {
      font-size: 14px;
      height: 48px;
      line-height: 48px;
      color: #666;
    }
    &__textarea {
      .textarea {
        display: block;
        width: 100%;
        height: 90px;
        padding: 8px;
        box-sizing: border-box;
        font-size: 14px;
        resize: none;
        color: #333;
        border-top: 0;
        border-right: 1px solid #e6e6e6;
        border-bottom: 0;
        border-left: 1px solid #e6e6e6;
        border-radius: 0;
        background-color: #fff;
        -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
        outline: none;
      }
    }
    &__words {
      padding: 5px;
      font-size: 12px;
      line-height: 1;
      text-align: right;
      color: #999;
      border-right: 1px solid #e6e6e6;
      border-left: 1px solid #e6e6e6;
      background-color: white;
    }
    &__submit {
      display: block;
      height: 44px;
      overflow: hidden;
      font-size: 1.1429em;
      line-height: 44px;
      cursor: default;
      text-align: center;
      text-decoration: none;
      color: white;
      border: 1px solid #e6e6e6;
      background-color: #e6e6e6;
      -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    }
    .haswords {
      background: dodgerblue;
    }
  }

  // 左边导航
  .right__nav {
    position: fixed;
    bottom: 65px;
    right: 0;
    width: 50px;
    height: 50px;
    background: rgba(0, 0, 0, 0.5);
    border-radius: 6px 0 0 6px;
    &__icon {
      position: absolute;
      top: 50%;
      left: 50%;
      margin: -10px 0 0 -15px;
      background: url(../../../static/image/down.png) no-repeat;
      background-size: 100% 100%;
      width: 30px;
      height: 20px;
      transform: rotate(-90deg);
    } // 动画
    .down1 {
      animation: down 1s linear infinite;
    } // .down2 {
    //   animation: down 1s linear  infinite;
    // }
    &-warrper {
      position: relative;
      height: 100%;
    }
  }

  @keyframes down {
    0% {
      transform: translateX(0) rotate(-90deg);
      opacity: 1;
    }
    100% {
      transform: translateX(20px) rotate(-90deg);
      opacity: 0;
      width: 25px;
      margin-left: -5px;
    }
  }

  // 滚动菜单
  .scroll__menu {
    position: fixed;
    top: 0;
    bottom: 0;
    right: 0;
    width: 70%; // background: rgba(7, 17, 27, 0.6);
    z-index: 151;
    &-mosk {
      position: fixed;
      top: 0;
      bottom: 0;
      right: 0;
      width: 70%;
      background: rgba(0, 0, 0, 0.6);
    }
    &-ul {
      display: flex;
      height: 100%;
      -webkit-box-orient: vertical;
      -webkit-box-direction: normal;
      -ms-flex-direction: column;
      flex-direction: column;
      background: rgba(0, 0, 0, 0.2);
      position: fixed;
      z-index: 100;
      width: 100%;
    }
    &-li {
      display: flex;
      align-items: center;
      flex: 1;
    }
    &-ptag {
      font-size: 14px;
      color: #fff;
      line-height: 50px;
      padding-left: 30px;
      font-weight: normal;
      letter-spacing: 1px;
      &:before {
        display: inline-block;
        content: "";
        width: 12px;
        height: 12px;
        border-radius: 50%;
        background: dodgerblue;
        margin-right: 15px;
        opacity: 0.8;
      }
    }
    .scroll__line {
      position: absolute;
      top: 80px;
      width: 2px;
      height: 80%;
      background: rgba(255, 255, 255, 0.4);
      left: 35px;
    } // 关闭按钮
    .icon-Group- {
      position: absolute;
      z-index: 160;
      bottom: 20px;
      right: 20px;
      font-size: 24px;
      color: #fff;
      padding: 5px;
    } // 当前状态
    .click-active {
      color: dodgerblue;
    }
  }

  // 动画
  .scroll-enter,
  .scroll-leave-to {
    transform: transition3d(70%, 0, 0);
    opacity: 0;
  }

  .scroll-enter-active,
  .scroll-leave-active {
    transition: all 0.5s;
  }
</style>
