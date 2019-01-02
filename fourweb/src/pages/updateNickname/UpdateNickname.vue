<template>
  <transition name="updateNickname" tag="div">
    <div class="bg" v-show="showUpdateNickname">
      <div>
        <div class="header-fixed">
          <div class="header-left iconfont icon-left" @click="hide()"></div>
          <div class="header-title">
            修改昵称
          </div>
        </div>
      </div> <!--header-->
      <div class="content">
          <div class="item-info">
            <p class="item-title">昵称</p>
            <input  type="text" :placeholder="this.$store.state.userNickname" class="item-desc" v-model="Nickname"/>
          </div>
      </div>
      <input class="btn" type="submit"  value="保存" @click="updateNickname">
    </div>
  </transition>
</template>

<script>
import axios from 'axios'
export default {
  name: 'UpdateNickname',
  data () {
    return {
      showUpdateNickname: false,
      Nickname: ''
    }
  },
  methods: {
    show() {
      this.showUpdateNickname = true
    },
    hide() {
      this.showUpdateNickname = false
    },
    updateNickname () {
      if (this.Nickname !== '' && this.$store.state.userId) {
        axios({
          method: 'put',
          url: 'http://localhost:8090/api/users/update',
          changeOrigin: true,
          data: {
            'userId': this.$store.state.userId,
            'userNickname': this.Nickname
          }
        }).then(response => {
          console.log(response.data)
          if (response.data.status === 200) {
            this.$toast.success('修改成功')
            this.$store.dispatch('updateuserNickname', this.Nickname)
            this.hide()
          } else if (response.data.status === 500) {
            this.$toast.fail('修改失败')
          }
        }).catch(error => {
          console.log(error)
        })
      } else {
        this.$toast('请输入昵称')
      }
    }
  }
}
</script>

<style lang="stylus" scoped>
  .bg
    position: fixed
    background: #FFF
    z-index: 99
    top: 0
    left: 0
    right: 0
    bottom: 0
  .updateNickname-enter-active,.updateNickname-leave-active
    transition: all 0.3s
  .updateNickname-enter, .updateNickname-leave-to
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
  //content
  .content
    margin-top: 1.2rem
  .item-title
    height: 0.8rem
    line-height: 0.8rem
    float: left
    font-size: .35rem
    margin-left: .2rem
    color #aaa
    margin-right :.2rem
  .item-desc
    height: 0.8rem
    line-height: 0.8rem
    font-size: .33rem
  .btn
    margin-top :.5rem
    border-radius: 0.5rem
    width: 90%
    height: .9rem
    background: dodgerblue
    line-height: .9rem
    color: #FFF
    margin-left .4rem
    font-size: .4rem
</style>
