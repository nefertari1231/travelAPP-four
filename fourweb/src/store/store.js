import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    Authorization: null,
    userId: null,
    userBg: 'static/image/login-bg.jpg',
    userIcon: 'static/image/login.jpg',
    userNickname: '请登录/注册',
    userArea: '来自星星的你',
    userDescription: '这家伙很懒，什么也没有留下了',
    userSex: '',
    shareCount: 0,
    followCount: 0,
    fansCount: 0,
    selectData: [],
    likeImg: 'icon-heart',
    showLike: false,
    showMosk: false,
    showzan: false,
    favourite: 'icon-like',
    keepZan: []
  },
  actions: {
    getuserDetail(ctx, user) {
      ctx.commit('getuserDetail', user)
    },
    getUserId (ctx, userId) {
      ctx.commit('getUserId', userId)
    },
    getToken (ctx, userToken) {
      ctx.commit('getToken', userToken)
    },
    updateuserBg(ctx, userBg) {
      ctx.commit('updateuserBg', userBg)
    },
    updateuserIcon(ctx, userIcon) {
      ctx.commit('updateuserIcon', userIcon)
    },
    updateuserNickname(ctx, Nickname) {
      ctx.commit('updateuserNickname', Nickname)
    },
    updateuserSex(ctx, sex) {
      ctx.commit('updateuserSex', sex)
    },
    updateuserArea(ctx, area) {
      ctx.commit('updateuserArea', area)
    },
    updateuserDescription(ctx, Description) {
      ctx.commit('updateuserDescription', Description)
    },
    logOff(ctx) {
      ctx.commit('logOff')
    }
  },
  mutations: {
    getUserId (state, userId) {
      localStorage.setItem('Id', userId)
      state.userId = localStorage.getItem('Id')
    },
    getToken (state, userToken) {
      localStorage.setItem('Authorization', userToken)
      state.Authorization = localStorage.getItem('Authorization')
    },
    updateuserBg(user, userBg) {
      user.userBg = userBg
    },
    updateuserIcon(user, userIcon) {
      user.userIcon = userIcon
    },
    updateuserNickname(user, Nickname) {
      user.userNickname = Nickname
    },
    updateuserSex(user, sex) {
      user.userSex = sex
    },
    updateuserArea(user, area) {
      user.userArea = area
    },
    updateuserDescription(user, Description) {
      user.userDescription = Description
    },
    getuserDetail(state, user) {
      if (user.userBg === null) {
        state.userBg = 'static/image/login-bg.jpg'
      } else {
        state.userBg = 'http://localhost:8090' + user.userBg
      }
      if (user.userIcon === null) {
        state.userIcon = 'static/image/login.jpg'
      } else {
        state.userIcon = 'http://localhost:8090' + user.userIcon
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
      if (user.userDescription === null) {
        state.userDescription = '这家伙很懒，什么也没有留下了'
      } else {
        state.userDescription = user.userDescription
      }
      if (user.userArea === null) {
        state.userArea = '来自星星的你'
      } else {
        state.userArea = user.userArea
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
      localStorage.removeItem('Authorization')
      localStorage.removeItem('Id')
      state.Authorization = localStorage.getItem('Authorization')
      state.userId = localStorage.getItem('Id')
      state.userBg = 'static/image/login-bg.jpg'
      state.userIcon = 'static/image/login.jpg'
      state.userNickname = '请登录/注册'
      state.userArea = '来自星星的你'
      state.userSex = ''
      state.shareCount = 0
      state.followCount = 0
      state.fansCount = 0
    },
    // 收藏
    getSelectDate(state, data) {
      state.selectData.push(data)
    },
    // 收藏图标
    like(state, data) {
      state.likeImg = data
    },
    // 取消收藏
    likeSelectDate(state, data) {
      state.selectData.splice(state.selectData.indexOf(data), 1)
    },
    // 展示 赞 收藏 的 状态
    showLike(state, data) {
      state.showLike = data
      state.showMosk = data
    },
    showZan(state, data) {
      state.showzan = data
    },
    favourites(state, data) {
      state.favourite = data
    },
    keepZan(state, data) {
      state.keepZan.push(data)
    },
    Zan(state, data) {
      state.keepZan.splice(state.keepZan.indexOf(data), 1)
    }
  }
})
