<template>
  <transition name="Collection" tag="div">
    <div class="bg" v-show="showCollection">
      <div>
        <div class="header-fixed">
          <div class="header-left iconfont icon-left" @click="hide()"></div>
          <div class="header-title">
            我的收藏
          </div>
        </div>
      </div> <!--header-->
        <div class="myfourite">
          <div class="goods__list">
            <ul>
              <li class="goods__list-li" v-for="item in getCollect" :key="item.id">
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
          <div class="goods__list" v-show="showTitle">
            <h2 class="list__title">
              ╭(╯ε╰)╮去精选里面添加内容吧</h2>
          </div>
        </div>
    </div>
  </transition>
</template>

<script>
export default {
  name: 'Collection',
  props: ['selectnum'],
  data() {
    return {
      showCollection: false,
      value1: true
    }
  },
  methods: {
    show () {
      this.showCollection = true
    },
    hide () {
      this.showCollection = false
    }
  },
  computed: {
    // 得到收藏的数据
    getCollect() {
      if (this.$store.state.selectData) {
        return this.$store.state.selectData
      }
    },
    showTitle() {
      if (this.getCollect.length === 0) {
        return true
      } else {
        return false
      }
    }
  }
}
</script>

<style lang="less" scoped>
  .bg {
    position: fixed;
    background: #FFF;
    z-index: 40;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
  }
  .Collection-enter-active,.Collection-leave-active{
    transition: all 0.3s;
  }
  .Collection-enter, .Collection-leave-to {
    opacity: 0;
    transform: translate3d(0, 100%, 0);
  }
  //header
  .header-fixed {
    z-index: 50;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    display: flex;
    line-height: 1.1rem;
    background: #333;
    color: white
  }
  .header-title {
    width: .86rem;
    flex: 1;
    text-align: center;
    font-size: .45rem;
    margin-bottom: -.2rem;
    margin-left: -.9rem
  }
  .header-left{
    font-size:.5rem;
    margin-left: .3rem;
    color: #FFF;
  }
  .font-size(@s: 12px, @c: #fff) {
    font-size: @s;
    color: @c;
  }

  .myfourite {
    position: absolute;
    top: 1.1rem;
    bottom: 0;
    width: 100%;
    left: 0;
    right: 0;
    z-index: 10;
  }

  .goods__list {
    position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    width: 100%;
    overflow: auto;
    &-li {
      position: relative;
      box-sizing: border-box;
      padding: 5px;
      width: 100%;
    }
    &-pics {
      position: relative;
      background: #333;
      border-radius: 4px;
      width: 100%;
      .list-pics__img {
        width: 100%;
        height: 100%;
        border-radius: 4px;
        border: none;
      }
    }
    &-detail {
      position: absolute;
      top: 50%;
      left: 50%;
      z-index: 3;
      transform: translate(-50%, -50%);
      width: 80%;
      text-align: center;
    }
    &-title {
      .font-size(24px, #fff);
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      font-weight: normal;
    }
    &-ptag {
      .font-size(16px, #fff);
      margin-top: 8px;
      font-weight: normal;
    }
    .goods__mosk {
      position: absolute;
      top: 0;
      left: 0;
      bottom: 0;
      right: 0;
      background: linear-gradient(to top, rgba(0, 0, 0, 0.6) 0%, rgba(0, 0, 0, 0) 100%);
      z-index: 2;
    }
  }

  .list__title {
    ont-size: 14px;
    color: rgb(210, 210, 210);
    line-height: 30px;
    text-align: center;
    margin-top: 20px;
  }
</style>
