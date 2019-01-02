import Vue from 'vue'
import Vuex from 'vuex'

import * as Api from '../plugins/api'

Vue.use(Vuex)

export const state = () => ({
  sites: []
})

export const mutations = {
  addSites(state, payload) {
    state.sites = []
    payload
      .sort((x, y) => {
        return x.id - y.id
      })
      .map(site => {
        if (site.attributes === undefined) return
        state.sites.push({
          id: site.attributes.id,
          key: site.attributes.key,
          name: site.attributes.name,
          loginUser: site.attributes.loginUser,
          loginPassword: site.attributes.loginPassword,
          activateFlag: site.attributes.activateFlag,
          url: site.attributes.affiliateUrl
        })
      })
  }
}

export const getters = {
  index: state => id => id - 1,
  site: state => index => state.sites[index],
  link: state => site => `<a href=${site.url} target="_blank">${site.name}</a>`,
  activate: state => site => (site.activateFlag ? '有効' : '無効'),
  editPath: state => site => `/sites/${site.id}`
}

export const actions = {
  async fetchSites({ commit }) {
    const response = await Api.getApiUsersSourceSites()
    commit('addSites', response.data.data)
  }
}

export const sites = {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
}
