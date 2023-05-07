import Vue from 'vue'
import Vuex from 'vuex'
import { getToken, setToken, removeToken } from '../util/auth'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    token: getToken(),
    user: null,
  },
  getters: {
  },
  mutations: {
    SET_TOKEN: (state, token) => {
      state.token = token
    },
    SET_USER: (state, val) => {
      state.user = val
    }
  },
  actions: {
    // 前端 登出
    FedLogOut({ commit }) {
      return new Promise(resolve => {
        commit('SET_TOKEN', '')
        removeToken()
        resolve()
      })
    }
  },
  modules: {
  }
})
