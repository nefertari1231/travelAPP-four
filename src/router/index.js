import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/pages/home/Home'
import Siri from '@/pages/siri/Siri'
import Message from '@/pages/message/Message'
import User from '@/pages/user/user'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      redirect: '/home'
    }, {
      path: '/home',
      component: Home
    }, {
      path: '/siri',
      component: Siri
    }, {
      path: '/message',
      component: Message
    }, {
      path: '/user',
      component: User
    }
  ]
})
