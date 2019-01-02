<template>
<transition name="user" tag="div">
<div class="bg" v-show="showuserDetail">
  <div>
    <div class="header-fixed" >
      <div class="header-left iconfont icon-left" @click="hide()"></div>
      <div class="header-title">
        Wo的主页
      </div>
      <div class="header-right iconfont icon-edit-square" @click="showUpdateUser"></div>
    </div>
    <div class="banner">
      <img class="banner-img" :src="this.$store.state.userBg" @click="updateBg">
      <van-popup class="updateBg" v-model="showBg">
        <van-uploader :before-read="onRead">更换背景</van-uploader>
      </van-popup>
    </div>
    <img class="item-img"  :src="this.$store.state.userIcon" />
    <div class="icon-info">
      <div class="desc">{{this.$store.state.userNickname}}</div>
      <div class="icon-m" v-show="this.$store.state.userSex === '男'">
        <div class="iconfont icon-man"></div>
      </div>
      <div class="icon-f" v-show="this.$store.state.userSex === '女'">
        <div class="iconfont icon-woman"></div>
      </div>
    </div>
    <div class="icon-desc">
      <div class="desc-attention">关注 {{this.$store.state.followCount}}</div>
      <div class="desc-fun">粉丝 {{this.$store.state.fansCount}}</div>
    </div>
    <div class="text">简介：{{this.$store.state.userDescription}}</div>
    <div class="split"></div>
  </div> <!--banner-->
  <update-user ref="enterUpdateUser"></update-user>
</div>
</transition>
</template>

<script>
import axios from 'axios'
import UpdateUser from '../updateUser/UpdateUser'
export default {
  name: 'userDetail',
  components: {UpdateUser},
  props: {
    userDetail: Object
  },
  data () {
    return {
      showuserDetail: false,
      showBg: false,
      userBg: ''
    }
  },
  methods: {
    show () {
      this.showuserDetail = true
    },
    hide () {
      this.showuserDetail = false
    },
    showUpdateUser () {
      this.$refs.enterUpdateUser.show()
    },
    updateBg() {
      this.showBg = true
    },
    onRead(file) {
      let formData = new FormData()
      formData.append('file', file)
      axios({
        method: 'post',
        url: 'http://localhost:8090/api/users/uploadUserBg?userId=' + this.$store.state.userId,
        changeOrigin: true,
        data: formData
      }).then(response => {
        if (response.data.status === 200) {
          this.$toast.success('上传成功')
          this.userBg = 'http://localhost:8090' + response.data.data
          this.$store.dispatch('updateuserBg', this.userBg)
          this.showBg = false
        } else if (response.data.status === 500) {
          this.$toast.fail('上传失败')
        }
      }).catch(error => {
        console.log(error)
      })
    }
  },
  mounted () {
    window.addEventListener('scroll', this.handleTouchMove)
  }
}
</script>

<style lang="stylus" scoped>
  .updateBg
    width: 30%
    height 0.8rem
    margin 0.2 auto
    line-height: 0.8rem
    font-size .35rem
    text-align center
  .bg
    position: fixed
    background: #FFF
    z-index: 20
    top: 0
    left: 0
    right: 0
    bottom: 0
  .user-enter-active,.user-leave-active
    transition: all 0.3s
  .user-enter, .user-leave-to
    transform: translate3d(100%, 0, 0)
    //banner
  .header-fixed
    position: fixed
    top: 0
    left: 0
    right: 0
    display: flex
    line-height: 1.25rem
    color: white
  .header-title
    width:.86rem
    flex: 1
    text-align: center
    font-size: .45rem
    margin-bottom: -.2rem
    color:rgba(0, 0, 0, 0)
  .header-left
    font-size:.5rem
    margin-left: .3rem
    color: #FFF
  .header-right
    font-size:.5rem
    margin-right: .3rem
    color: #FFF
  .banner
    overflow: hidden
    height: 0
    padding-bottom: 50%
  .banner-img
    width: 100%
  .item-img
    border: .05rem solid #FFF
    border-radius:50%
    width: 1.5rem
    height: 1.5rem
    position: absolute
    top: 3rem
    left: 0
    bottom: 0
    right: 0
    margin:0 auto
  .icon-m
    float: left
    width: .4rem
    height: .4rem
    background: skyblue
    border-radius:50%
  .icon-man,.icon-woman
    color: #FFF
    margin-top:.05rem
  .icon-f
    float: left
    width: .4rem
    height: .4rem
    background: pink
    border-radius:50%
  .icon-info
    display: flex
    margin-top: 1rem
    text-align: center
    padding: 0 2.5rem
  .desc
    float: left
    flex: 1
    font-size: .3rem
  .icon-desc
    margin-top:.3rem
    display: flex
    text-align: center
    padding: 0 2.5rem
  .desc-attention
    border-right: .04rem solid #bbb
    flex: 1
  .desc-fun
    flex:1
  .text
    margin-top: .2rem
    text-align: center
  .split
    height: .2rem
    background: #ddd
    margin-top: .3rem
</style>
