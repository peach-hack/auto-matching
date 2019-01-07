import Vue from 'vue'
import Vuex from 'vuex'

import * as Api from '../plugins/api'
//@ts-ignore
import Site from '@/types/site'

Vue.use(Vuex)

export interface State {
  sites: Site[]
}

export interface Context {
  commit: (name: string, palload?: any) => void
}

export interface Mutations {
  [key: string]: (state: State, payload?: any) => void
}

export interface Actions {
  [key: string]: (context: Context, payload?: any) => void
}

export const state: () => State = () => ({
  sites: []
})

export const mutations: Mutations = {
  addSites(state, payload) {
    state.sites = []
    payload
      .sort((x: any, y: any) => {
        return x.id - y.id
      })
      .map((site: any) => {
        if (site.attributes === undefined) return
        state.sites.push({
          id: site.attributes.id as number,
          key: site.attributes.key as string,
          name: site.attributes.name as string,
          loginUser: site.attributes.loginUser as string,
          loginPassword: site.attributes.loginPassword as string,
          activateFlag: site.attributes.activateFlag as boolean,
          url: site.attributes.affiliateUrl as string
        })
      })
  },
}

export const actions: Actions = {
  async fetchSites({ commit }) {
    const response = await Api.getApiUsersSourceSites()
    commit('addSites', response.data.data)
  }
}

export default {
  state,
  mutations,
  actions
}
