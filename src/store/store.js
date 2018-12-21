import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    singleBg: 'static/image/login-bg.jpg',
    singleIcon: 'static/image/login.jpg',
    singleNickname: '请登录/注册',
    singleSex: '',
    shareCount: 0,
    followCount: 0,
    fansCount: 0
  },
  actions: {
    getSingleDetail(ctx, single) {
      ctx.commit('getSingleDetail', single)
    },
    logOff(ctx) {
      ctx.commit('logOff')
    }
  },
  mutations: {
    getSingleDetail(state, single) {
      state.singleBg = single.singleBg
      state.singleIcon = single.singleIcon
      state.singleNickname = single.singleNickname
      state.singleSex = single.singleSex
      state.shareCount = single.shareCount
      state.followCount = single.followCount
      state.fansCount = single.fansCount
    },
    logOff(state) {
      state.singleBg = 'static/image/login-bg.jpg'
      state.singleIcon = 'static/image/login.jpg'
      state.singleNickname = '请登录/注册'
      state.singleSex = ''
      state.shareCount = 0
      state.followCount = 0
      state.fansCount = 0
    }
  }
})
