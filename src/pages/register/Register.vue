<template>
<transition name="register" tag="div">
<div class="bg">
<register-header></register-header>
<register-content></register-content>
</div>
</transition>
</template>

<script>
import RegisterHeader from './components/Header'
import RegisterContent from './components/Content'
export default {
  name: 'Register',
  components: {RegisterHeader,
    RegisterContent
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
.register-enter-active,.register-leave-active
  transition: all 0.3s
.register-enter, .register-leave-to
  transform: translate3d( 0,100%,0)
</style>
