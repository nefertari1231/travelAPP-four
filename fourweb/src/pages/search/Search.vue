<template>
  <transition name="search" tag="div">
    <div class="bg" v-show="showSearch">
      <div>
        <div class="header">
          <div class="header-left iconfont icon-search" ></div>
          <div class="header-content">
            <input class="content" />
          </div>
          <div class="cancel" @click="hide()">取消</div>
        </div>
      </div>  <!--header-->
    </div>
  </transition>
</template>

<script>
export default {
  name: 'Search',
  data() {
    return {
      showSearch: false
    }
  },
  methods: {
    show() {
      this.showSearch = true
    },
    hide() {
      this.showSearch = false
    }
  }
}
</script>

<style lang="stylus" scoped>
  .bg
    position: fixed
    background: #FFF
    z-index: 100
    top: 0
    left: 0
    right: 0
    bottom: 0
  .search-enter-active,.search-leave-active
    transition: all 0.3s
  .search-enter, .search-leave-to
    transform: translate3d(100%, 0, 0)
  //header
  .header
    position: relative
    display: flex
    line-height: 1.1rem
    background-color: #cacaca
    color: white
  .header-content
    flex: 1
    height: .7rem
    line-height .7rem
    text-align: center
    font-size: .45rem
    background-color white
    margin-top: .25rem
    border-radius: .5rem
    margin-right 0.2rem
  .content
    height: .6rem
    width: 5rem
    font-size: .35rem
  .header-left
    font-size:.6rem
    margin-left .1rem
    margin-right: .2rem
  .cancel
    margin-right: .2rem
    font-size: .35rem
</style>
