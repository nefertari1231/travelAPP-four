<template>
  <div >
    <div class="share">
    <div class="share-left iconfont icon-icon-test"></div>
    <div class="share-title">热门分享</div>
    </div>
    <ul v-for="item in ShareList" :key="item.id">
      <li class="item-header">
        <img class="item-img"  :src="item.imgUlr" />
        <div :class="item.color">
          <div :class="item.sex"></div>
        </div>
        <div class="item-info">
        <p class="item-title">{{item.Name}}</p>
        <p class="item-time">{{item.TimeName}}</p>
        <div class="iconfont icon-down"></div>
        </div>
      </li>
      <li>
        <div class="item-text">{{item.desc}}</div>
        <div class="item-pic border-bottom">
        <div class="pic" v-for="pic of item.PicList" :key="pic.id">
          <div class="pic-content">
          <img class="pic-contents" :src="pic.PimgUlr" />
          </div>
        </div>
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
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'HomeShare',
  data () {
    return {
      ShareList: [{
        id: '0001',
        imgUlr: require('@/image/touxiang1.jpg'),
        Name: '爱你会上瘾丶',
        TimeName: '09-17 15：31',
        color: 'icon-m',
        sex: 'iconfont icon-man',
        desc: '杯子在多数时候，盛装的仅仅是半杯水，遇见的那个人依然似乎无法填补内心的空洞，时间一点一点地过去，水也一点一点地蒸发掉，你开始觉得他越来越无法满足你的全部幻想全部期待',
        PicList: [{
          id: '0001',
          PimgUlr: require('@/image/share1.jpg')
        }, {
          id: '0002',
          PimgUlr: require('@/image/share2.jpg')
        }, {
          id: '0003',
          PimgUlr: require('@/image/share3.jpg')
        }, {
          id: '0004',
          PimgUlr: require('@/image/share4.jpg')
        }]
      }, {
        id: '0002',
        imgUlr: require('@/image/touxiang2.jpg'),
        Name: 'Amber珈珈',
        TimeName: '09-17 15：32',
        color: 'icon-f',
        sex: 'iconfont icon-woman',
        desc: '美丽的地方',
        PicList: [{
          id: '0001',
          PimgUlr: require('@/image/share5.jpg')
        }, {
          id: '0002',
          PimgUlr: require('@/image/share6.jpg')
        }, {
          id: '0003',
          PimgUlr: require('@/image/share7.jpg')
        }, {
          id: '0004',
          PimgUlr: require('@/image/share8.jpg')
        }]
      }, {
        id: '0003',
        imgUlr: require('@/image/touxiang3.jpg'),
        Name: '一起学猫叫',
        TimeName: '09-17 15：33',
        color: 'icon-m',
        sex: 'iconfont icon-man',
        desc: '离开这个喧嚣的世界，背上背包去旅行，去寻找一片宁静的乐园，让新鲜的风景新鲜的人和事不断的带给我们惊喜，放下杂念，放下世故的心，感受自由自在的空间。',
        PicList: [{
          id: '0001',
          PimgUlr: require('@/image/share9.jpg')
        }, {
          id: '0002',
          PimgUlr: require('@/image/share10.jpg')
        }, {
          id: '0003',
          PimgUlr: require('@/image/share11.jpg')
        }, {
          id: '0004',
          PimgUlr: require('@/image/share12.jpg')
        }]
      }, {
        id: '0004',
        imgUlr: require('@/image/touxiang4.jpg'),
        Name: '丑的像整容',
        TimeName: '09-17 15：34',
        color: 'icon-f',
        sex: 'iconfont icon-woman',
        desc: '你好，世界',
        PicList: [{
          id: '0001',
          PimgUlr: require('@/image/share13.jpg')
        }, {
          id: '0002',
          PimgUlr: require('@/image/share14.jpg')
        }, {
          id: '0003',
          PimgUlr: require('@/image/share15.jpg')
        }, {
          id: '0004',
          PimgUlr: require('@/image/share16.jpg')
        }]
      }]
    }
  }
}
</script>

<style lang="stylus" scoped>
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
.foot-content
  float: left
  position: relative
  overflow: hidden
  width: 50%
  padding-bottom: 5%
  text-align: center
  padding: .1rem 0
  color: #888
.icon-like, .icon-edit-square
  font-size: .4rem
.footer-text
  font-size: .3rem
</style>
