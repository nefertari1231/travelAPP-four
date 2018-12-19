<template>
<div>
<div class="wrapper">
<swiper :options="swiperOption" v-if="showSwiper">
    <swiper-slide v-for="item of swiperList" :key="item.id">
      <img class="swiper-img" :src="item.imgUrl" />
    </swiper-slide>
    <div class="swiper-pagination"  slot="pagination"></div>
  </swiper>
</div>
</div>
</template>

<script>
export default {
  name: 'HomeSwiper',
  data () {
    return {
      swiperList: [{
        id: '0001',
        imgUrl: 'static/image/shouye1.jpg'
      }, {
        id: '0002',
        imgUrl: 'static/image/shouye2.jpg'
      }, {
        id: '0003',
        imgUrl: 'static/image/shouye3.jpg'
      }],
      swiperOption: {
        pagination: '.swiper-pagination',
        loop: true,
        autoplay: 3000
      }
    }
  },
  computed: {
    showSwiper () {
      return this.swiperList.length
    }
  }
}
</script>

<style lang="stylus" scoped>
.wrapper >>> .swiper-pagination-bullet-active
  background: #fff
.wrapper
  z-index: 2
  overflow: hidden
  width: 100%
  height: 0
  padding-bottom: 42.1875%
.swiper-img
  width: 100%
</style>
