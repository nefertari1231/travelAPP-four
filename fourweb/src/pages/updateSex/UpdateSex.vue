<template>
  <transition name="updateSex" tag="div">
    <div class="bg" v-show="showUpdateSex">
      <div>
        <div class="header-fixed">
          <div class="header-left iconfont icon-left" @click="hide()"></div>
          <div class="header-title">
            修改性别
          </div>
        </div>
      </div> <!--header-->
      <div class="content" @click="sexSelect">
        <div class="item-info">
          <p class="item-title">性别</p>
          <p class="item-desc">{{this.$store.state.userSex}}</p>
        </div>
      </div>
      <van-popup v-model="showsex" position="bottom" :overlay="true">
        <van-picker show-toolbar title="请选择性别" :columns="columns" @cancel="onCancel" @confirm="onConfirm" @change="onChange" />
      </van-popup>
    </div>
  </transition>
</template>

<script>
import axios from 'axios'
export default {
  name: 'UpdateSex',
  data () {
    return {
      showUpdateSex: false,
      sex: '',
      showsex: false,
      columns: ['男', '女']
    }
  },
  methods: {
    show() {
      this.showUpdateSex = true
    },
    hide() {
      this.showUpdateSex = false
    },
    sexSelect() {
      this.showsex = true
    },
    onChange(picker, value, index) {
      this.sex = value
    },
    onCancel() {
      this.showsex = false
    },
    onConfirm() {
      axios({
        method: 'put',
        url: 'http://localhost:8090/api/users/update',
        changeOrigin: true,
        data: {
          'userId': this.$store.state.userId,
          'userSex': this.sex
        }
      }).then(response => {
        if (response.data.status === 200) {
          this.$toast.success('修改成功')
          this.$store.dispatch('updateuserSex', this.sex)
          this.showsex = false
          this.hide()
        } else if (response.data.status === 500) {
          this.$toast.fail('修改失败')
        }
      }).catch(error => {
        console.log(error)
      })
    }
  }
}
</script>

<style  lang="stylus" scoped>
  .bg
    position: fixed
    background: #FFF
    z-index: 99
    top: 0
    left: 0
    right: 0
    bottom: 0
  .updateSex-enter-active,.updateSex-leave-active
    transition: all 0.3s
  .updateSex-enter, .updateSex-leave-to
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
    float right
    margin-right .4rem
</style>
