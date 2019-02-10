import Vue from 'vue'
import Vuex, { Mutation } from 'vuex'

Vue.use(Vuex)

export interface State {
  isLoading: boolean
}

export interface Context {
  commit: (name: string, palload?: any) => void
}

export interface Mutations {
  [key: string]: (state: State, payload?: any) => void
}

export const state: () => State = () => ({
  isLoading: false
})

export const mutations: Mutations = {
  loading(state, isLoading) {
    state.isLoading = isLoading
  }
}

export default {
  state,
  mutations
}
