<template>
  <transition name="updateUser" tag="div">
    <div class="bg" v-show="showUpdateUser">
      <div>
        <div class="header-fixed">
          <div class="header-left iconfont icon-left" @click="hide()"></div>
          <div class="header-title">
            基本信息
          </div>
        </div>
      </div> <!--header-->
      <div>
        <van-uploader class="picture" :before-read="onRead">
        <li class="item-img border">
          <div class="item-icon">
            <img class="img" :src="this.$store.state.userIcon" />
          </div>
          <div class="item-info">
            <p class="item-text" ><span class="item-content">修改头像</span></p>
            <div class=" iconfont-img iconfont icon-right"></div>
          </div>
        </li>
        </van-uploader>
        <ul class="content">
          <li class="item border"  @click="updateNickname">
            <div class="item-info">
              <p class="item-title">昵称</p>
              <p class="item-desc">{{this.$store.state.userNickname}}</p>
              <div class=" iconfont icon-right"></div>
            </div>
          </li>
          <li class="item border" @click="updateSex">
            <div class="item-info">
              <p class="item-title">性别</p>
              <p class="item-desc">{{this.$store.state.userSex}}</p>
              <div class=" iconfont icon-right"></div>
            </div>
          </li>
          <li class="item border" @click="updateArea">
            <div class="item-info">
              <p class="item-title">地区</p>
              <p class="item-desc">{{this.$store.state.userArea}}</p>
              <div class=" iconfont icon-right"></div>
            </div>
          </li>
          <li class="item border" @click="UpdateDescription">
            <div class="item-info">
              <p class="item-title">简介</p>
              <p class="item-desc">{{this.$store.state.userDescription}}</p>
              <div class=" iconfont icon-right"></div>
            </div>
          </li>
        </ul>
      </div> <!--list-->
      <update-nickname ref="enterUpdateNickname"></update-nickname>
      <update-sex ref="enterUpdateSex"></update-sex>
      <update-description ref="enterUpdateDescription"></update-description>
      <update-area ref="enterUpdateArea"></update-area>
    </div>
  </transition>
</template>

<script>
import axios from 'axios'
import UpdateNickname from '../updateNickname/UpdateNickname'
import UpdateSex from '../updateSex/UpdateSex'
import UpdateDescription from '../updateDescription/UpdateDescription'
import UpdateArea from '../updateArea/UpdateArea'
export default {
  name: 'UpdateUser',
  components: {UpdateArea, UpdateDescription, UpdateSex, UpdateNickname},
  data () {
    return {
      showUpdateUser: false,
      changesex: '',
      userIcon: ''
    }
  },
  methods: {
    show() {
      this.showUpdateUser = true
    },
    hide() {
      this.showUpdateUser = false
    },
    updateNickname() {
      this.$refs.enterUpdateNickname.show()
    },
    updateSex() {
      this.$refs.enterUpdateSex.show()
    },
    updateArea() {
      this.$refs.enterUpdateArea.show()
    },
    UpdateDescription() {
      this.$refs.enterUpdateDescription.show()
    },
    onRead(file) {
      let formData = new FormData()
      formData.append('file', file)
      axios({
        method: 'post',
        url: 'http://localhost:8090/api/users/uploadUserIcon?userId=' + this.$store.state.userId,
        changeOrigin: true,
        data: formData
      }).then(response => {
        if (response.data.status === 200) {
          this.$toast.success('上传成功')
          this.userIcon = 'http://localhost:8090' + response.data.data
          this.$store.dispatch('updateuserIcon', this.userIcon)
        } else if (response.data.status === 500) {
          this.$toast.fail('上传失败')
        }
      }).catch(error => {
        console.log(error)
      })
    }
  }
}
</script>

<style lang="stylus" scoped>
  .picture
    width :100%
  .bg
    position: fixed
    background: #FFF
    z-index: 70
    top: 0
    left: 0
    right: 0
    bottom: 0
  .updateUser-enter-active,.updateUser-leave-active
    transition: all 0.3s
  .updateUser-enter, .updateUser-leave-to
    opacity: 0
    transform: translate3d(100%, 0, 0)
  //header
  .header-fixed
    z-index: 30
    position: fixed
    top: 0
    left: 0
    right: 0
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
  .icon-left
    font-size:.5rem
    margin-left: .3rem
    color: #FFF
  //list
  .content
    margin-top: .2rem
  .item
    overflow: hidden
    display: flex
    height: 0.8rem
    padding: .1rem
  .item-img
    margin-top :1.1rem
    overflow: hidden
    display: flex
    height: 1.8rem
    padding: .1rem
  .img
    margin-left :.1rem
    border: .05rem solid #FFF
    border-radius:50%
    width: 1.5rem
    height: 1.5rem
  .item-icon
    width 25%
    height :1.7rem
  .item-info
    flex: 1
  .item-title
    height: 0.8rem
    line-height: 0.8rem
    float: left
    font-size: .35rem
    margin-left: .2rem
    color #aaa
  .item-desc
    height: 0.8rem
    line-height: 0.8rem
    float: left
    font-size: .33rem
    margin-left: .2rem
  .item-text
    height: 1.5rem
    line-height: 1.5rem
    font-size: .33rem
    margin-left: .2rem
  .icon-right
    float: right
    height: 0.8rem
    line-height: 0.8rem
    font-size: .5rem
    color: #ddd
  .iconfont-img
    margin-top : -1rem
</style>
