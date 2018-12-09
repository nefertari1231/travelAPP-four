<template>
<div>
<message-header></message-header>
<message-content></message-content>
</div>
</template>

<script>
import MessageHeader from './components/Header'
import MessageContent from './components/Content'
export default {
  name: 'Message',
  components: {MessageHeader,
    MessageContent
  }
}
</script>

<style lang="stylus" scoped>
</style>
