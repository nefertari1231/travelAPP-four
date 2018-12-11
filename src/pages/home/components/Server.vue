<template>
<div>
<div class="server-bg">
<router-link tag="div" :to="item.to"
     class="server"
     v-for="item of list"
     :key="item.id"
     >
  <div class="server-content">
    <img  class="server-img" :src="item.imgUrl">
    <div class="font-display">
    <p class="font">{{item.desc}}</p>
    </div>
  </div>
</router-link>
</div>
</div>
</template>

<script>
export default {
  name: 'HomeServer',
  props: {
    list: Array
  }
}
</script>

<style lang="stylus" scoped>
.server-bg
  overflow: hidden
  height: 0
  padding-bottom: 25%
.server
  position: relative
  overflow: hidden
  float: left
  height: 0
  width: 33.333%
  padding-bottom: 25%
.server-content
  position: absolute
  top: 0
  left: 0
  right: 0
  bottom: 0
  box-sizing: border-box
  padding: .15rem
.server-img
  display: block
  height: 100%
  width: 100%
  margin: 0 auto
.font
  position: absolute
  top: 0
  left: 0
  right: 0
  bottom: 0
  line-height: 6em
  height: 6em
  color: #FFF
  text-align: center
  font-size: medium
</style>
