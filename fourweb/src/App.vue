<template>
  <div id="app">
    <keep-alive>
      <router-view />
    </keep-alive>
    <tab class="footer"></tab>
  </div>
</template>

<script>
import Tab from './pages/tab/Tab'
export default {
  name: 'App',
  components: {
    Tab
  }
}
</script>

<style lang="stylus" scoped>
.footer
  z-index: 1
</style>
