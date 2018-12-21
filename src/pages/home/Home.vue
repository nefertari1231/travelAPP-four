<template>
  <div>
    <div>
      <div class="header">
        <div class="header-title">
          首页
        </div>
        <div class="header-right iconfont icon-search" @click="showSearch()"></div>
      </div>
    </div>  <!--header-->
  <div class="headlist" ref="wrapper" @click="login">
    <div>
      <home-swiper></home-swiper>
      <div>
          <div class="server-bg">
            <div @click="showSever()" class="server">
              <div class="server-content">
                <img  class="server-img" src="static/image/server1.jpg">
                <div class="font-display">
                  <p class="font">找服务</p>
                </div>
              </div>
            </div>
          <div class="server">
            <div class="around-content">
              <img  class="server-img" src="static/image/server2.jpg">
              <div class="font-display">
                <p class="font">周边玩</p>
              </div>
            </div>
          </div>
          <div  class="server">
            <div class="nearby-content">
              <img  class="server-img" src="static/image/server3.jpg">
              <div class="font-display">
                <p class="font">附近的人</p>
              </div>
            </div>
          </div>
          </div>
        </div>  <!--Server-->
      <div >
          <div class="share">
            <div class="share-left iconfont icon-icon-test"></div>
            <div class="share-title">热门分享</div>
          </div>
          <ul v-for="homeComment in shareList" :key="homeComment.id">
            <li class="item-header">
              <img class="item-img" :src="homeComment.imgUlr" />
              <div class="icon-m" v-show="homeComment.sex === '男'">
                <div class="iconfont icon-man"></div>
              </div>
              <div class="icon-f" v-show="homeComment.sex === '女'">
                <div class="iconfont icon-woman"></div>
              </div>
              <div class="item-info">
                <p class="item-title">{{homeComment.Name}}</p>
                <p class="item-time">{{homeComment.TimeName}}</p>
                <div class="iconfont icon-down"></div>
              </div>
            </li>
            <li @click="selectComment(homeComment)">
              <div class="item-text">{{homeComment.desc}}</div>
              <div class="item-pic border-bottom">
                <div class="pic" v-for="pic of homeComment.PicList" :key="pic.id">
                  <div class="pic-content">
                    <img class="pic-contents" :src="pic.PimgUlr" />
                  </div>
                </div>
              </div>
            </li>
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
 <router-view></router-view>
  <home-comment :homeComment="selectedComment" ref="homeComment"></home-comment>
    <search ref="search"></search>
    <service ref="server"></service>
    <login ref="login"></login>
</div>
</template>

<script>
import Bscroll from 'better-scroll'
import HomeSwiper from './components/Swiper'
import HomeComment from '../homeComment/HomeComment'
import Search from '../search/Search'
import Service from '../service/Service'
import Login from '../login/Login'
export default {
  name: 'Home',
  components: {
    Login,
    Service,
    Search,
    HomeComment,
    HomeSwiper
  },
  data() {
    return {
      shareList: [{
        id: '0001',
        imgUlr: 'static/image/touxiang1.jpg',
        Name: '爱你会上瘾丶',
        TimeName: '09-17 15：31',
        sex: '男',
        desc: '杯子在多数时候，盛装的仅仅是半杯水，遇见的那个人依然似乎无法填补内心的空洞，时间一点一点地过去，水也一点一点地蒸发掉，你开始觉得他越来越无法满足你的全部幻想全部期待',
        PicList: [{
          id: '0001',
          PimgUlr: 'static/image/share1.jpg'
        },
        {
          id: '0002',
          PimgUlr: 'static/image/share2.jpg'
        },
        {
          id: '0003',
          PimgUlr: 'static/image/share3.jpg'
        },
        {
          id: '0004',
          PimgUlr: 'static/image/share4.jpg'
        }]
      }, {
        id: '0002',
        imgUlr: 'static/image/touxiang2.jpg',
        Name: 'Amber珈珈',
        TimeName: '09-17 15：32',
        color: 'icon-f',
        sex: '女',
        PicList: [{
          id: '0001',
          PimgUlr: 'static/image/share5.jpg'
        },
        {
          id: '0002',
          PimgUlr: 'static/image/share6.jpg'
        },
        {
          id: '0003',
          PimgUlr: 'static/image/share7.jpg'
        },
        {
          id: '0004',
          PimgUlr: 'static/image/share8.jpg'
        }]
      }, {
        id: '0003',
        imgUlr: 'static/image/touxiang3.jpg',
        Name: '一起学猫叫',
        TimeName: '09-17 15：33',
        sex: '男',
        desc: '离开这个喧嚣的世界，背上背包去旅行，去寻找一片宁静的乐园，让新鲜的风景新鲜的人和事不断的带给我们惊喜，放下杂念，放下世故的心，感受自由自在的空间。',
        PicList: [{
          id: '0001',
          PimgUlr: 'static/image/share9.jpg'
        },
        {
          id: '0002',
          PimgUlr: 'static/image/share10.jpg'
        },
        {
          id: '0003',
          PimgUlr: 'static/image/share11.jpg'
        },
        {
          id: '0004',
          PimgUlr: 'static/image/share12.jpg'
        }]
      }, {
        id: '0004',
        imgUlr: 'static/image/touxiang4.jpg',
        Name: '丑的像整容',
        TimeName: '09-17 15：34',
        sex: '女',
        desc: '你好，世界',
        PicList: [{
          id: '0001',
          PimgUlr: 'static/image/share13.jpg'
        },
        {
          id: '0002',
          PimgUlr: 'static/image/share14.jpg'
        },
        {
          id: '0003',
          PimgUlr: 'static/image/share15.jpg'
        },
        {
          id: '0004',
          PimgUlr: 'static/image/share16.jpg'
        }]
      }
      ],
      selectedComment: {}
    }
  },
  methods: {
    selectComment(homeComment) {
      this.selectedComment = homeComment
      this.$refs.homeComment.show()
    },
    showSearch() {
      this.$refs.search.show()
    },
    showSever() {
      this.$refs.server.show()
    },
    login() {
      if (this.$store.state.singleBg === 'static/image/login-bg.jpg') {
        this.$refs.login.show()
        this.$refs.homeComment.hide()
        this.$refs.server.hide()
      }
    }
  },
  mounted() {
    this.scroll = new Bscroll(this.$refs.wrapper)
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
    z-index: 0
    //header
  .header
    z-index 0
    position: relative
    display: flex
    line-height: 1.1rem
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
    float: left
    position: relative
    overflow: hidden
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
    padding: .15rem 0.075rem 0.15rem 0.15rem
  .around-content
    position: absolute
    top: 0
    left: 0
    right: 0
    bottom: 0
    box-sizing: border-box
    padding: .15rem 0.075rem 0.15rem 0.075rem
  .nearby-content
    position: absolute
    top: 0
    left: 0
    right: 0
    bottom: 0
    box-sizing: border-box
    padding: .15rem 0.15rem 0.15rem 0.075rem
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
