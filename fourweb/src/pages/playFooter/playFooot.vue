<template>
  <div class="footer">
    <div class="footer__favourite common" @click.stop.prevent="addFavourite">
      <!-- <i class="iconfont" :class="[show?'icon-zan1':'icon-zan']"></i> -->
      <i class="iconfont" :class="this.$store.state.favourite"></i>
      <span>{{favourite}}</span>
    </div>
    <div class="footer__comment common">
      <i class="iconfont icon-comment"></i>
      <span>评论({{count}})</span>
    </div>
    <div class="footer__share common" @click.stop.prevent="collects">
      <i class="iconfont" :class="this.$store.state.likeImg"></i>
      <span>{{collect}}</span>
    </div>
  </div>
</template>
<script type="text/javascript">
import axios from 'axios'
export default {
  props: ['count', 'select'],
  data() {
    return {
      mosk: false
    }
  },
  computed: {
    favourite() {
      if (this.$store.state.showzan === true) {
        return '已赞'
      } else {
        return '赞'
      }
    },
    collect() {
      if (this.$store.state.showLike === true) {
        return '已收藏'
      } else {
        return '收藏'
      }
    }
  },
  methods: {
    addFavourite() {
      if (this.$store.state.favourite === 'icon-like') {
        this.$store.commit('favourites', 'icon-like-fill')
        this.$store.commit('showZan', true)
        this.$store.commit('keepZan', this.select)
      } else {
        this.$store.commit('favourites', 'icon-like')
        this.$store.commit('Zan', this.select)
        this.$store.commit('showZan', false)
      }
    },
    collects() {
      this.mosk = !this.mosk
      // 判断是否收藏 然后在传值
      if (this.$store.state.likeImg === 'icon-heart') {
        axios({
          method: 'post',
          url: 'http://localhost:8090/api/collect/saveCollect',
          changeOrigin: true,
          data: {
            'userId': localStorage.getItem('Id'),
            'collectName': this.select.title
          }
        }).then(response => {
          if (response.data.status === 200) {
            this.$toast('请在我的收藏里面查看')
          } else if (response.data.status === 500) {
            console.log(500)
          }
        })
        this.$store.commit('getSelectDate', this.select)
        this.$store.commit('like', 'icon-heart-fill')
        this.$store.commit('showLike', true)
      } else {
        axios({
          method: 'post',
          url: 'http://localhost:8090/api/collect/deleteCollect?collectName=' + this.select.title,
          changeOrigin: true
        })
        this.$store.commit('likeSelectDate', this.select)
        this.$store.commit('like', 'icon-heart')
        this.$store.commit('showLike', false)
      }
      setTimeout(() => {
        this.mosk = false
      }, 1000)
    }
  }
}
</script>
<style lang="less" scoped>
.footer {
  position: fixed;
  bottom: 0;
  left: 0;
  display: flex;
  justify-content: space-around;
  height: 48px;
  line-height: 48px;
  width: 100%;
  z-index: 150;
  background: #f5f5f5;
  border-top: 1px solid rgba(7, 17, 27, 0.2);
  .common {
    flex: 1;
    text-align: center;
    color: dodgerblue;
  }
  .iconfont {
    font-size: 24px;
  }
}

.on {
  color: dodgerblue;
}

</style>
