import Vue from 'vue'
import Vuex, { Mutation } from 'vuex'
import Axios, { AxiosError, AxiosResponse } from 'axios'
import * as Cookies from 'js-cookie'

//@ts-ignore
import { postApiSession, postApiUsers, deleteApiSession } from '@/plugins/api'

Vue.use(Vuex)

export interface State {
  user: string
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
  //@ts-ignore
  user: JSON.parse(localStorage.getItem('user'))
})

export const mutations: Mutations = {
  setUser(state, user) {
    state.user = user
    localStorage.setItem('user', JSON.stringify(user))
  },
  clearUser(state) {
    state.user = ''
    localStorage.removeItem('user')
    Cookies.remove('vuex')
  }
}

export const actions: Actions = {
  signIn({ commit }, data) {
    postApiSession({
      attributes: {
        session: {
          username: data.username,
          password: data.password
        }
      }
    })
      .then((response: AxiosResponse) => {
        console.log(response)
        commit('setUser', response.data.data.attributes)
      })
      .catch((error: AxiosError) => {
        commit('clearUser')
      })
  },
  signUp({ commit }, data) {
    postApiUsers({
      attributes: {
        user: {
          username: data.username,
          password: data.password
        }
      }
    })
      .then((response: AxiosResponse) => {
        console.log(response)
        commit('setUser', response.data.data.attributes)
      })
      .catch(() => {
        commit('clearUser')
      })
  },
  signOut({ commit }) {
    deleteApiSession().then(() => {
      commit('clearUser')
    })
  }
}
export default {
  state,
  mutations,
  actions
}
