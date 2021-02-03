<template>
  <transition name="Description" tag="div">
    <div v-show="showDescription" class="bg">
      <div>
        <div class="header">
          <div class="header-left iconfont icon-left" @click.stop.prevent="hide()"></div>
          <div class="header-title">
            修改简介
          </div>
          <div class="header-right" @click="save()">保存</div>
        </div>
      </div>  <!--header-->
      <div class="content-title">简介：</div>
      <textarea class="content" :placeholder="this.$store.state.userDescription" contenteditable="" rows="10"  v-model="Description"></textarea>
    </div>
  </transition>
</template>

<script>
import axios from 'axios'
export default {
  name: 'UpdateDescription',
  data() {
    return {
      showDescription: false,
      Description: ''
    }
  },
  methods: {
    show() {
      this.showDescription = true
    },
    hide() {
      this.showDescription = false
    },
    save() {
      if (this.Description.length <= 15) {
        axios({
          method: 'put',
          url: 'http://localhost:8090/api/users/update',
          changeOrigin: true,
          data: {
            'userId': localStorage.getItem('Id'),
            'userDescription': this.Description
          }
        }).then(response => {
          console.log(response.data)
          if (response.data.status === 200) {
            this.$toast.success('保存成功')
            this.$store.dispatch('updateuserDescription', this.Description)
            this.hide()
          } else if (response.data.status === 500) {
            this.$toast.fail('修改失败')
          }
        }).catch(error => {
          console.log(error)
        })
      } else {
        this.$toast('说的太多了')
      }
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
    color: #666
  .Description-enter-active,.Description-leave-active
    transition: all 0.3s
  .Description-enter, .Description-leave-to
    opacity: 0
    transform: translate3d( 100%, 0, 0)
  .header
    display: flex
    line-height: 1.1rem
    background: #333
    color: white
  .header-title
    width:1.2rem
    flex: 1
    text-align: center
    font-size: .45rem
    margin-bottom: -.2rem
  .header-left
    font-size:.5rem
    margin-left: .3rem
    color: #FFF
  .header-right
    font-size:.4rem
    margin-right: .3rem
    color: #FFF
  .content-title
    margin-top :0.2rem
    margin-left: 0.1rem
  .content
    margin: 0.2rem 0.5rem
    width :80%
</style>
