import Vue from 'vue'
import Vuex, { Mutation } from 'vuex'
import History from '../types/history'

import * as Api from '../plugins/api'

import Axios from 'axios'
import Post from '../types/post.d'

Vue.use(Vuex)

export interface State {
  posts: Post[],
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
  posts: [],
  histories: []
})

export const mutations: Mutations = {
  addPosts(state, payload) {
    state.posts = []
    payload.map((post: any) => {
      state.posts.push({
        id: Number(post.attributes.id),
        title: post.attributes.title,
        url: post.attributes.url,
        postAt: post.attributes.postAt,
        category: post.attributes.category,
        prefecture: post.attributes.prefecture,
        city: post.attributes.city,
        address: post.attributes.address,
        sex: post.attributes.profile.sex,
        age: post.attributes.profile.age,
        profileName: post.attributes.profile.name,
        profileFrom: post.attributes.profile.from,
        siteName: post.attributes.sourceSite.name,
        siteUrl: post.attributes.sourceSite.url
      })
    })
  },
  clearPosts(state) {
    state.posts = []
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
  async searchDb({ commit }, data) {
    // const response = await getApiUsersSearchDb(data)
    const response = await Axios.get(
      process.env.baseUrl + '/api/users/search/db',
      data
    )
    commit('addPosts', response.data.data)
  },
  async fetchHistories({ commit }) {
    // TODO
    const response = await Api.getApiUsersPostsManualPosts()
    commit('addHistories', response.data.data)
  }
}

export default {
  state,
  mutations,
  actions
}
