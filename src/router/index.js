import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/pages/home/Home'
import Siri from '@/pages/siri/Siri'
import Message from '@/pages/message/Message'
import Single from '@/pages/single/Single'
import Service from '@/pages/service/Service'
import ServiceDetail from '@/pages/serviceDetail/ServiceDetail'
import Search from '@/pages/search/Search'
import SingleDetail from '@/pages/singleDetail/SingleDetail'
import Login from '@/pages/login/Login'
import Speople from '@/pages/speople/Speople'

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
          component: Service,
          children: [
            {
              path: ':title',
              component: ServiceDetail
            }
          ]
        },
        {
          path: 'search',
          component: Search
        }
      ]
    }, {
      path: '/siri',
      component: Siri,
      children: [
        {
          path: ':speople',
          component: Speople
        }
      ]
    }, {
      path: '/message',
      component: Message
    }, {
      path: '/single',
      component: Single,
      children: [
        {
          path: 'detail',
          component: SingleDetail
        },
        {
          path: 'login',
          component: Login
        }
      ]
    }
  ]
})
