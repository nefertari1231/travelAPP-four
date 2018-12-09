 <template>
<div class="bg">
<service-header></service-header>
<service-content @select="selectServiceDetail"></service-content>
<transition name="service" tag="div">
<router-view></router-view>
</transition>
</div>
</template>

<script>
import ServiceHeader from './components/Header'
import ServiceContent from './components/Content'
export default {
  name: 'Service',
  components: {ServiceHeader,
    ServiceContent
  },
  methods: {
    selectServiceDetail(service) {
      this.$router.push({
        path: `/home/service/${service.id}`
      })
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
.service-enter-active,.service-leave-active
  transition: all 0.3s
.service-enter, .service-leave-to
  transform: translate3d(100%, 0, 0)
</style>
