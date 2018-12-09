<template>
  <div>
    <div class="cut-off"></div>
    <div class="content-title">详细信息</div>
    <div class="cut-off"></div>
    <div class="content-banner">
    <div class="banner" @click="handleBannerClick">
      <img class="banner-img" src="@/image/service1.jpg" />
      <div class="banner-info">
        <div class="banner-number"><span class="iconfont icon-tupian"></span>4</div>
      </div>
    </div>
    </div>
    <common-gallary :imgs="imgs" v-show="showGallary" @close="handleGallaryClose"></common-gallary>
    <div class="detail-title">注意事项:</div>
    <div class="detail-desc">一切费用自备，建议代一些厚衣服，有意联系我 <br>
      v： afsdafdsf ，脑残勿扰。
    </div>
    <div class="cut-off"></div>
    <div class="appraise">暂无评价</div>
    <div class="cut-off"></div>
    <div class="thumb"> 等0个人喜欢</div>
  </div>
</template>

<script>
import CommonGallary from 'common/gallary/Gallary'
export default {
  name: 'ServiceDetailContent',
  data () {
    return {
      showGallary: false,
      imgs: [require('@/image/service1.jpg'), require('@/image/service1.1.jpg'), require('@/image/service1.2.jpg'), require('@/image/service1.3.jpg')]
    }
  },
  methods: {
    handleBannerClick () {
      this.showGallary = true
    },
    handleGallaryClose () {
      this.showGallary = false
    }
  },
  components: {
    CommonGallary
  }
}
</script>

<style lang="stylus" scoped>
.cut-off
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
.thumb
  float: right
  margin: .2rem
</style>
