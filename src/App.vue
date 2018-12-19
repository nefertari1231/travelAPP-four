<template>
<div id="app">
<router-view></router-view>
<div class="footer">
<tab></tab>
</div>
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
