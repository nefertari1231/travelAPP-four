<template>
<transition name="server" tag="div">
<div v-show="showServiceDetail" class="bg">
<service-detail-header @hide="hide()"></service-detail-header>
<service-detail-title></service-detail-title>
<service-detail-content></service-detail-content>
<div class="footer">
<service-detail-footer></service-detail-footer>
</div>
</div>
</transition>
</template>

<script>
import ServiceDetailHeader from './components/Header'
import ServiceDetailTitle from './components/Title'
import ServiceDetailContent from './components/Content'
import ServiceDetailFooter from './components/Footer'
export default {
  name: 'ServiceDetail',
  components: {ServiceDetailHeader,
    ServiceDetailTitle,
    ServiceDetailContent,
    ServiceDetailFooter
  },
  props: {
    serverDetail: Object
  },
  data() {
    return {
      showServiceDetail: false
    }
  },
  methods: {
    show() {
      this.showServiceDetail = true
    },
    hide() {
      this.showServiceDetail = false
    }
  }
}
</script>

<style lang="stylus" scoped>
.footer
  bottom: 0
  position: fixed
  width: 100%
.bg
  position: fixed
  background: #FFF
  z-index: 21
  top: 0
  left: 0
  right: 0
  bottom: 0
.server-enter-active,.server-leave-active
  transition: all 0.3s
.server-enter, .server-leave-to
  transform: translate3d(100%, 0, 0)
</style>
