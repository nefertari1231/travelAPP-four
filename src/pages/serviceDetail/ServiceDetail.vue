<template>
<div class="bg">
<service-detail-header></service-detail-header>
<service-detail-title></service-detail-title>
<service-detail-content></service-detail-content>
<div class="footer">
<service-detail-footer></service-detail-footer>
</div>
</div>
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
  z-index: 100
  top: 0
  left: 0
  right: 0
  bottom: 0
</style>
