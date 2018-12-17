import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/pages/home/Home'
import Siri from '@/pages/siri/Siri'
import Message from '@/pages/message/Message'
import Single from '@/pages/single/Single'
import Service from '@/pages/service/Service'
import Login from '@/pages/login/Login'
import Register from '@/pages/register/Register'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      redirect: '/home'
    }, {
      path: '/home',
      component: Home,
      children: [
        {
          path: 'service',
          component: Service
        }
      ]
    }, {
      path: '/siri',
      component: Siri
    }, {
      path: '/message',
      component: Message
    }, {
      path: '/login',
      component: Login
    }, {
      path: '/register',
      component: Register
    }, {
      path: '/single',
      component: Single
    }
  ]
})
