import Vue from 'vue'
import axios from 'axios'

axios.interceptors.request.use(
  config => {
    console.log('Making request to ' + config.url)
    config.headers.post['Content-Type'] = 'application/json'
    config.xsrfCookieName = 'CSRF-TOKEN'
    config.xsrfHeaderName = 'X-CSRF-Token'
    config.withCredentials = true
    return config
  },
  function(error) {
    return Promise.reject(error)
  }
)

axios.interceptors.response.use(
  function(response) {
    return response
  },
  function(error) {
    console.log(error)
    if (error.response && error.response.status === 401) {
      window.location.href = '/signin'
    }
    if (
      error.response &&
      (error.response.status === 500 || error.response.status === 400)
    ) {
      this.$store.dispatch('session/signOut').then(() => {
        window.location.href = '/signin'
      })
    }
    return Promise.reject(error.response)
  }
)

Vue.use(axios)
