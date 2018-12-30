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
      addSites(state, payload) {
        payload.map(site =>
          state.sites.push({
            id: site.attributes.id,
            name: site.attributes.name,
            loginUser: site.attributes.login_user,
            loginPassword: site.attributes.login_password,
            activateFlag: site.attributes.activate_flag,
            url: site.attributes.affiliate_url
          })
        )
        state.sites
      }
    },
    getters: {
      index: state => id => id - 1,
      site: state => index => state.sites[index],
      link: state => site =>
        `<a href=${site.url} target="_blank">${site.name}</a>`,
      activate: state => site => (site.activateFlag ? '有効' : '無効'),
      editPath: state => site => `/sites/${site.id}`
    },
    actions: {
      async fetchSites({ commit }) {
        const response = await Api.getApiUsersSourceSites()
        commit('addSites', response.data.data)
      }
    }
  })
}

export default store
