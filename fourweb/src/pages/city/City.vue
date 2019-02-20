<template>
  <transition name="City" tag="div">
    <div v-show="showCity" class="bg">
      <div>
        <div class="header">
          <div class="header-right iconfont icon-left" @click="hide()"></div>
          <div class="header-title">
            请选择地址
          </div>
        </div>
      </div> <!--header-->
      <div>
        <div class="search">
          <input v-model="keyword" class="search-input" type="text" placeholder="输入城市名或拼音" />
        </div>
        <div class="search-content" ref="search" v-show="keyword">
          <ul>
            <li
              class="search-item border-bottom"
              v-for="item of list"
              :key="item.id"
              @click="handleCityClick(item.name)"
            >
              {{item.name}}
            </li>
            <li class="search-item border-bottom" v-show="hasNoData">
              没有找到匹配数据
            </li>
          </ul>
        </div>
      </div>  <!--搜索-->
      <div class="list" ref="wrapper">
        <div>
          <div class="area">
            <div class="title border-topbottom">当前城市</div>
            <div class="button-list">
              <div class="button-wrapper">
                <div class="button">{{city}}</div>
              </div>
            </div>
          </div>
          <div class="area">
            <div class="title border-topbottom">热门城市</div>
            <div class="button-list">
              <div class="button-wrapper"
                   v-for="item of hotCities"
                   :key="item.id"
                   @click="handleCityClick(item.name)"
              >
                <div class="button">{{item.name}}</div>
              </div>
            </div>
          </div>
          <div class="area" v-for="(item, key) of cities"
               :key="key"
               :ref="key">
            <div class="title border-topbottom">{{key}}</div>
            <div class="item-list">
              <div class="item border-bottom"
                   v-for="innerItem of item"
                   :key="innerItem.id"
                   @click="handleCityClick(innerItem.name)"
              >
                {{innerItem.name}}
              </div>
            </div>
          </div>
        </div>
      </div> <!--list-->
      <ul class="AlphabetList">
        <li class="AlphabetItem"
            v-for="item of letters"
            :key="item"
            :ref="item"
            @touchstart.prevent="handleTouchStart"
            @touchmove="handleTouchMove"
            @touchend="handleTouchEnd"
            @click="handleLetterClick"
        >
          {{item}}
        </li>
      </ul> <!--Alphabet-->
    </div>
  </transition>
</template>

<script>
import axios from 'axios'
import Bscroll from 'better-scroll'
export default {
  name: 'City',
  props: {
    city: String
  },
  data() {
    return {
      showCity: false,
      keyword: '',
      cities: {},
      hotCities: [],
      letter: '',
      touchStatus: false,
      startY: 0,
      timer: null,
      list: []
    }
  },
  mounted () {
    this.getCityInfo()
  },
  updated () {
    this.startY = this.$refs['A'][0].offsetTop
    this.scroll = new Bscroll(this.$refs.search)
  },
  methods: {
    getCityInfo () {
      axios.get('/api/city.json')
        .then(this.handleGetCityInfoSucc)
    },
    handleGetCityInfoSucc (res) {
      console.log(res)
      res = res.data
      if (res.ret && res.data) {
        const data = res.data
        this.cities = data.cities
        this.hotCities = data.hotCities
      }
    },
    show() {
      this.showCity = true
      this.$nextTick(() => {
        this.scroll = new Bscroll(this.$refs.wrapper)
      })
    },
    hide() {
      this.showCity = false
    },
    handleLetterClick (e) {
      this.letter = e.target.innerText
    },
    handleTouchStart () {
      this.touchStatus = true
    },
    handleTouchMove (e) {
      if (this.touchStatus) {
        if (this.timer) {
          clearTimeout(this.timer)
        }
        this.timer = setTimeout(() => {
          const touchY = e.touches[0].clientY + 20
          const index = Math.floor((touchY - this.startY) / 20)
          if (index >= 0 && index < this.letters.length) {
            this.letter = this.letters[index]
          }
        }, 8)
      }
    },
    handleTouchEnd () {
      this.touchStatus = false
    },
    handleCityClick(city) {
      this.$emit('changeCity', city)
      this.hide()
    }
  },
  computed: {
    letters() {
      const letters = []
      for (let i in this.cities) {
        letters.push(i)
      }
      return letters
    },
    hasNoData () {
      return !this.list.length
    }
  },
  watch: {
    letter() {
      if (this.letter) {
        const element = this.$refs[this.letter][0]
        this.scroll.scrollToElement(element)
      }
    },
    keyword () {
      if (this.timer) {
        clearTimeout(this.timer)
      }
      if (!this.keyword) {
        this.list = []
        return
      }
      this.timer = setTimeout(() => {
        const result = []
        for (let i in this.cities) {
          this.cities[i].forEach((value) => {
            if (value.spell.indexOf(this.keyword) > -1 || value.name.indexOf(this.keyword) > -1) {
              result.push(value)
            }
          })
        }
        this.list = result
      }, 50)
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
  .City-enter-active,.City-leave-active
    transition: all 0.3s
  .City-enter, .City-leave-to
    opacity: 0
    transform: translate3d( 100%, 0, 0)
  //header
  .header
    display: flex
    line-height: 1.1rem
    background: #333
    color: white
  .header-title
    width:.86rem
    flex: 1
    text-align: center
    font-size: .45rem
    margin-bottom: -.2rem
    margin-left: -.9rem
  .header-right
    font-size:.5rem
    margin-left: .3rem
  //search
  .search
    height: .72rem
    padding: 0 .1rem
    background: #333
    .search-input
      box-sizing: border-box
      width: 100%
      height: .62rem
      padding: 0 .1rem
      line-height: .62rem
      text-align: center
      border-radius: .06rem
      color: #666
  .border-topbottom
    &:before
      border-color: #ccc
    &:after
      border-color: #ccc
  .border-bottom
    &:before
      border-color: #ccc
  .search-content
    z-index: 1
    overflow: hidden
    position: absolute
    top: 1.8rem
    left: 0
    right: 0
    bottom: 0
    background: #eee
    .search-item
      line-height: .62rem
      padding-left: .2rem
      background: #fff
      color: #666
      //list
  .list
    overflow: hidden
    position: absolute
    top: 1.8rem
    left: 0
    right: 0
    bottom: 0
    .title
      line-height: .44rem
      background: #eee
      padding-left: .2rem
      color: #666
      font-size: .26rem
    .button-list
      overflow: hidden
      padding: .1rem .6rem .1rem .1rem
      .button-wrapper
        float: left
        width: 33.33%
        .button
          margin: .1rem
          padding: .1rem 0
          text-align: center
          border: .02rem solid #ccc
          border-radius: .06rem
    .item-list
      .item
        line-height: .76rem
        padding-left: .2rem
  .AlphabetList
    display: flex
    flex-direction: column
    justify-content: center
    position: absolute
    top: 1.58rem
    right: 0
    bottom: 0
    width: .4rem
    .AlphabetItem
      line-height: .4rem
      text-align: center
      color: #333
</style>
