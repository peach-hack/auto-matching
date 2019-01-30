import Vue from 'vue'
import Vuex, { Mutation } from 'vuex'
import Axios from 'axios'

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
  signIn({ commit }, { username, password }) {
    // The Promise used for router redirect in Signin.vue
    return new Promise((resolve, reject) => {
/*       api
        .createSession(username, password)
        .then(response => {
          commit("setUser", response.data);
          this.dispatch("getTackleBoxItems");
          resolve();
        })
        .catch(error => {
          // if the request fails, clear user
          commit("clearUser");
          reject(error.response.data.error);
        });
 */    });
  },
  signUp({ commit }, { username, password }) {
    // The Promise used for router redirect in Signup.vue
    return new Promise((resolve, reject) => {
      /*       api
              .createUser(username, password)
              .then(response => {
                commit("setUser", response.data);
                resolve();
              })
              .catch(error => {
                commit("clearUser");
                reject(error.response.data.errors);
              });
      
            */
    });
  },
  signOut({ commit }) {
    // The Promise used for router redirect in Header.vue
    return new Promise(resolve => {
      // api.deleteSession().then(() => {
      // commit("clearUser");
      // resolve();
    })
  }
}

export default {
  state,
  mutations,
  actions
}
