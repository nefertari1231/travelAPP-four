import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    userBg: 'static/image/login-bg.jpg',
    userIcon: 'static/image/login.jpg',
    userNickname: '请登录/注册',
    userSex: '',
    shareCount: 0,
    followCount: 0,
    fansCount: 0
  },
  actions: {
    getuserDetail(ctx, user) {
      ctx.commit('getuserDetail', user)
    },
    logOff(ctx) {
      ctx.commit('logOff')
    }
  },
  mutations: {
    getuserDetail(state, user) {
      state.userBg = user.userBg
      state.userIcon = user.userIcon
      state.userNickname = user.userNickname
      state.userSex = user.userSex
      state.shareCount = user.shareCount
      state.followCount = user.followCount
      state.fansCount = user.fansCount
    },
    logOff(state) {
      state.userBg = 'static/image/login-bg.jpg'
      state.userIcon = 'static/image/login.jpg'
      state.userNickname = '请登录/注册'
      state.userSex = ''
      state.shareCount = 0
      state.followCount = 0
      state.fansCount = 0
    }
  }
})
