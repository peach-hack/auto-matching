import Vue from 'vue'
import Vuex, { Mutation } from 'vuex'
import Axios from 'axios'

//@ts-ignore
import * as Api from "@/plugins/api"

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
  user: ""// JSON.parse(localStorage.getItem("user"))
})

export const mutations: Mutations = {
  setUser(state, user) {
    state.user = user;
    localStorage.setItem("user", JSON.stringify(user));
  },
  clearUser(state) {
    state.user = "";
    localStorage.removeItem("user");
  }
}

export const actions: Actions = {
  signIn({ commit }, data) {
    Api.postApiSession({
      username: data.username,
      password: data.password
    })
      .then(response => {
        commit("setUser", response.data.data);
      })
      .catch(error => {
        commit("clearUser");
      });
  },
  signUp({ commit }, data) {
    Api.postApiUsers({
      username: data.username,
      password: data.password
    })
      .then(response => {
        commit("setUser", response.data.data);
      })
      .catch(() => {
        commit("clearUser");
      });
  },
  signOut({ commit }) {
    Api.deleteApiSession()
      .then(() => {
        commit("clearUser");
      })
  },
}
export default {
  state,
  mutations,
  actions
}
