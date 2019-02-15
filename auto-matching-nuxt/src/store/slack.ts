import Vue from 'vue'
import Vuex from 'vuex'

import * as Api from '../plugins/api'

Vue.use(Vuex)

export interface State {
  timerOn: boolean
  timerObj: object
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
  timerOn: false,
  timerObj: null
})

export const mutations: Mutations = {
  setTimerOn(state: State, timerOn: boolean) {
    state.timerOn = timerOn
  },
  setTimerObj(state: State, timerObj: object) {
    state.timerObj = timerObj
  }
}

export const actions: Actions = {}

export default {
  state,
  mutations,
  actions
}