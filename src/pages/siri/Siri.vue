<template>
<div>
<router-view></router-view>
  <div>
      <div class="header">
        <div class="header-right iconfont icon-left"></div>
        <div class="header-title">
          发现
        </div>
      </div>
    </div> <!--header-->
    <div class="headlist" ref="wrapper" @click="login">
      <div>
        <siri-list></siri-list>
      </div>
    </div>
  <login ref="login"></login>
</div>
</template>

<script>
import Bscroll from 'better-scroll'
import SiriList from './components/List'
import Login from '../login/Login'
export default {
  name: 'Siri',
  components: {
    Login,
    SiriList
  },
  mounted () {
    this.scroll = new Bscroll(this.$refs.wrapper)
  },
  methods: {
    login() {
      if (this.$store.state.userBg === 'static/image/login-bg.jpg') {
        this.$refs.login.show()
      }
    }
  }
}
</script>

<style lang="stylus" scoped>
  .headlist
    overflow: hidden
    position: absolute
    top: 1.2rem
    left: 0
    right: 0
    bottom: 1.5rem
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
    color: #333
</style>
