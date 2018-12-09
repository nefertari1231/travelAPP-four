<template>
<transition name="login" tag="div">
<div class="bg">
<login-header></login-header>
<login-content></login-content>
</div>
</transition>
</template>

<script>
import LoginHeader from './components/Header'
import LoginContent from './components/Content'
export default {
  name: 'Login',
  components: {LoginHeader,
    LoginContent
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
.login-enter-active,.login-leave-active
  transition: all 0.3s
.login-enter, .login-leave-to
  transform: translate3d(0, 100%, 0)
</style>
