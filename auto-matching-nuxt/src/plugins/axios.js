import Vue from 'vue'
import axios from 'axios'
import { Route } from 'vue-router'

export default (context, inject) => {
  axios.interceptors.request.use(
    config => {
      console.log('Making request to ' + config.url)
      context.app.store.commit('common/loading', true)
      config.headers.post['Content-Type'] = 'application/json'
      config.xsrfCookieName = 'CSRF-TOKEN'
      config.xsrfHeaderName = 'X-CSRF-Token'
      config.withCredentials = true
      return config
    },
    function(error) {
      context.app.store.commit('common/loading', false)
      return Promise.reject(error)
    }
  )

  axios.interceptors.response.use(
    function(response) {
      context.app.store.commit('common/loading', false)
      return response
    },
    function(error) {
      context.app.store.commit('common/loading', false)

      if (error.response && error.response.status === 401) {
        context.app.router.push('/signin')
      }
      if (
        error.response &&
        (error.response.status === 500 || error.response.status === 400)
      ) {
        this.$state.store.dispatch('session/signOut').then(() => {
          context.app.router.push('/signin')
        })
      }
      return Promise.reject(error.response)
    }
  )
  Vue.use(axios)
}
