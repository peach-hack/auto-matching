import Vue from 'vue'
import Vuex, { Mutation } from 'vuex'
import Template from '../types/template'

import * as Api from '../plugins/api'

Vue.use(Vuex)

export interface State {
  templates: Template[]
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
  templates: []
})

export const mutations: Mutations = {
  addTemplates(state, payload) {
    state.templates = []
    payload.map((template: any) => {
      if (template.attributes === undefined) return
      state.templates.push({
        id: template.attributes.id as number,
        title: template.attributes.title as string,
        body: template.attributes.body as string,
        createdAt: template.attributes.createdAt as Date,
        updatedAt: template.attributes.updatedAt as Date
      })
    })
  }
}

export const actions: Actions = {
  async fetchTemplates({ commit }) {
    const response = await Api.getApiUsersPostsTemplates()
    commit('addTemplates', response.data.data)
  }
}

export default {
  state,
  mutations,
  actions
}
