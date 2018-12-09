<template>
<transition name="single" tag="div">
<div class="bg">
<single-detail-banner></single-detail-banner>
<single-detail-header></single-detail-header>
</div>
</transition>
</template>

<script>
import SingleDetailBanner from './components/Banner'
import SingleDetailHeader from './components/Header'
export default {
  name: 'SingleDetail',
  components: {SingleDetailBanner,
    SingleDetailHeader
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
.single-enter-active,.single-leave-active
  transition: all 0.3s
.single-enter, .single-leave-to
  transform: translate3d(100%, 0, 0)
</style>
