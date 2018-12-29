import Vue from 'vue'
import Vuex from 'vuex'

import * as Api from '@/plugins/api'

Vue.use(Vuex)

const store = () => {
  return new Vuex.Store({
    state: {
      sites: []
    },
    mutations: {
      addSites(state, { sites }) {
        state.sites = sites
      }
    },
    actions: {
      fetchSites({ commit }) {
        Api.getApiUsersSourceSites().then(response => {
          commit('addSites', response.data.data)
        })
      }
    }
  })
}

export default store
