<template>
  <div class="content-bg">
    <div class="content" v-for="item of contentList" :key="item.id">
      <div class="content-box">
        <p class="text-top">{{item.textTop}}</p>
        <p class="text-bottom">{{item.textBottom}}</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'SingleThumb',
  data () {
    return {
      contentList: [{
        id: '0001',
        textTop: '0',
        textBottom: '分享'
      }, {
        id: '0002',
        textTop: '2',
        textBottom: '关注'
      }, {
        id: '0003',
        textTop: '0',
        textBottom: '粉丝'
      }]
    }
  }
}
</script>

<style lang="stylus" scoped>
.content-bg
  overflow: hidden
  height: 0
  padding-bottom: 15%
.content
  float: left
  height: 0
  padding-bottom: 15%
  width: 32%
  text-align: center
.content-box
  padding: .1rem .4rem
.text-top
  font-size: .4rem
.text-bottom
  padding-top: .05rem
  font-size: .3rem
</style>
