<template>
<div>
<div>
    <div class="header">
      <div class="header-title">
        {{this.homeTitle}}
      </div>
      <router-link tag="div" to="/home/search" class="header-right iconfont icon-search" ></router-link>
    </div>
  </div>  <!--header-->
<div class="headlist" ref="wrapper">
<div>
<home-swiper :list="swiperList"></home-swiper>
<div>
    <div class="server-bg">
      <router-link tag="div" :to="item.to"
                   class="server"
                   v-for="item of serverList"
                   :key="item.id"
      >
        <div class="server-content">
          <img  class="server-img" :src="item.imgUrl">
          <div class="font-display">
            <p class="font">{{item.desc}}</p>
          </div>
        </div>
      </router-link>
    </div>
  </div>  <!--Server-->
<div >
    <div class="share">
      <div class="share-left iconfont icon-icon-test"></div>
      <div class="share-title">热门分享</div>
    </div>
    <ul v-for="homeComment in shareList" :key="homeComment.id">
      <div @click="selectComment(homeComment)">
      <li class="item-header">
        <img class="item-img"  :src="homeComment.imgUlr" />
        <div :class="homeComment.color">
          <div :class="homeComment.sex"></div>
        </div>
        <div class="item-info">
          <p class="item-title">{{homeComment.Name}}</p>
          <p class="item-time">{{homeComment.TimeName}}</p>
          <div class="iconfont icon-down"></div>
        </div>
      </li>
      <li>
        <div class="item-text">{{homeComment.desc}}</div>
        <div class="item-pic border-bottom">
          <div class="pic" v-for="pic of homeComment.PicList" :key="pic.id">
            <div class="pic-content">
              <img class="pic-contents" :src="pic.PimgUlr" />
            </div>
          </div>
        </div>
      </li>
      </div>
      <div class="item-footer">
        <ul>
          <div class="foot-content">
            <li class="iconfont icon-like">
              <span class="footer-text">赞(0)
              </span>
            </li>
          </div>
          <div class="foot-content border-left">
            <li class="iconfont icon-edit-square">
              <span class="footer-text">评论(0)
              </span>
            </li>
          </div>
        </ul>
      </div>
    </ul>
  </div>  <!--Share-->
</div>
</div>
<transition name="HomeT" tag="div">
<router-view></router-view>
</transition>
  <home-comment :homeComment="selectedComment" ref="homeComment"></home-comment>
</div>
</template>

<script>
import Bscroll from 'better-scroll'
import HomeSwiper from './components/Swiper'
import HomeComment from '../homeComment/HomeComment'
import axios from 'axios'
export default {
  name: 'Home',
  components: {
    HomeComment,
    HomeSwiper
  },
  data() {
    return {
      homeTitle: '',
      swiperList: [],
      serverList: [],
      shareList: [],
      selectedComment: {}
    }
  },
  methods: {
    getHomeInfo () {
      axios.get('/static/mock/home.json')
        .then(this.getHomeInfoSucc)
    },
    getHomeInfoSucc (res) {
      res = res.data
      if (res.ret && res.data) {
        const data = res.data
        this.homeTitle = data.homeTitle
        this.swiperList = data.swiperList
        this.serverList = data.serverList
        this.shareList = data.shareList
      }
    },
    selectComment(homeComment) {
      this.selectedComment = homeComment
      this.$refs.homeComment.show()
    }
  },
  mounted() {
    this.scroll = new Bscroll(this.$refs.wrapper)
    this.getHomeInfo()
  }
}
</script>

<style lang="stylus" scoped>
  .headlist
    overflow: hidden
    position: absolute
    top: 1.25rem
    left: 0
    right: 0
    bottom: 1.2rem
    z-index:2
  .HomeT-enter-active,.HomeT-leave-active
    transition: all 0.3s
  .HomeT-enter, .HomeT-leave-to
    transform: translate3d(100%, 0, 0)
    //header
  .header
    position: relative
    display: flex
    line-height: 1.26rem
    background: #333
    color: white
  .header-title
    width:.86rem
    flex: 1
    text-align: center
    font-size: .45rem
    margin-right: -.8rem
  .header-right
    font-size:.6rem
    margin-right: .2rem
    //server
  .server-bg
    overflow: hidden
    height: 0
    padding-bottom: 25%
  .server
    position: relative
    overflow: hidden
    float: left
    height: 0
    width: 33.333%
    padding-bottom: 25%
  .server-content
    position: absolute
    top: 0
    left: 0
    right: 0
    bottom: 0
    box-sizing: border-box
    padding: .15rem
  .server-img
    display: block
    height: 100%
    width: 100%
    margin: 0 auto
  .font
    position: absolute
    top: 0
    left: 0
    right: 0
    bottom: 0
    line-height: 6em
    height: 6em
    color: #FFF
    text-align: center
    font-size: medium
    //share
  .share
    line-height: .6rem
    background: #333
    color: #FFF
  .share-left
    width:.54rem
    float: left
    font-size: .54rem
    margin-left: .24rem
    margin-right:.24rem
  .share-title
    font-size: .34rem
  .item-header
    position: relative
    overflow: hidden
    display: flex
    height: 1.5rem
  .item-img
    border-radius:50%
    width: 1.2rem
    height: 1.2rem
    margin-top: .2rem
    margin-left: .2rem
    margin-right: .1rem
  .icon-m
    position: absolute
    top: 1rem
    left: 1rem
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
    left: 1rem
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
  .item-time
    line-height: .6rem
    color: #999
  .icon-down
    font-size: .4rem
    float: right
    margin-right: .2rem
    margin-top: -.85rem
  .item-text
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
    padding-bottom: 70%
  .pic
    float: left
    position: relative
    overflow: hidden
    width: 50%
    padding-bottom: 35%
  .pic-content
    padding: .3rem
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
  .item-footer
    overflow: hidden
    height: 0
    padding-bottom: 10%
    border-bottom: 0.2rem solid #bbb
    margin-top: .1rem
  .foot-content
    float: left
    position: relative
    overflow: hidden
    width: 50%
    text-align: center
    color: #888
  .icon-like, .icon-edit-square
    font-size: .4rem
  .footer-text
    font-size: .3rem
</style>
