import Vue from 'vue'
import Vuex, { Mutation } from 'vuex'
import Template from '../types/template'
import History from '../types/history'

import * as Api from '../plugins/api'

Vue.use(Vuex)

export interface State {
  templates: Template[]
  histories: History[]
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
  templates: [],
  histories: []
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
  },
  deleteTemplate(state: State, payload: any) {
    const templates = state.templates.filter(
      (template: Template) => template.id !== payload.id
    )
    state.templates = templates
  },
  clearTemplates(state: State, payload: any) {
    state.templates = []
  },
  addHistories(state, payload) {
    state.histories = []
    payload
      .sort((x: any, y: any) => {
        return x.id - y.id
      })
      .map((history: any) => {
        state.histories.push({
          id: history.attributes.id as number,
          name: history.attributes.name as string,
          activateFlag: history.attributes.activateFlag as boolean,
          url: history.attributes.affiliateUrl as string,
          status: history.attributes.lastPostStatus as string,
          date: history.attributes.lastPostAt as string
        })
      })
  },
  changeStatus(state: State, payload: any) {
    payload.ids.forEach((id: number) => {
      state.histories[id - 1].status = payload.status
    })
  }
}

export const actions: Actions = {
  async fetchTemplates({ commit }) {
    const response = await Api.getApiUsersPostsTemplates()
    commit('addTemplates', response.data.data)
  },
  async fetchHistories({ commit }) {
    const response = await Api.getApiUsersPostsManualPosts()
    commit('addHistories', response.data.data)
  }
}

export default {
  state,
  mutations,
  actions
}
