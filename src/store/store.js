import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    userId: null,
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
      state.userId = user.userId
      if (user.userBg === null) {
        state.userBg = 'static/image/login-bg.jpg'
      } else {
        state.userBg = user.userBg
      }
      if (user.userIcon === null) {
        state.userIcon = 'static/image/login.jpg'
      } else {
        state.userIcon = user.userIcon
      }
      if (user.userNickname === null) {
        state.userNickname = '智障儿童欢乐多'
      } else {
        state.userNickname = user.userNickname
      }
      if (user.userSex === null) {
        state.userSex = ''
      } else {
        state.userSex = user.userSex
      }
      if (user.shareCount === null) {
        state.shareCount = 0
      } else {
        state.shareCount = user.shareCount
      }
      if (user.followCount === null) {
        state.followCount = 0
      } else {
        state.followCount = user.followCount
      }
      if (user.fansCount === null) {
        state.fansCount = 0
      } else {
        state.fansCount = user.fansCount
      }
    },
    logOff(state) {
      state.userId = null
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
