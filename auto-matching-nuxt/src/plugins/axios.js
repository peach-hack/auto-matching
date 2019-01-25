import Vue from 'vue'
import axios from 'axios'

axios.interceptors.request.use(
  config => {
    console.log('Making request to ' + config.url)
    config.headers.Authorization = `Bearer ${getIdToken()}`
    config.headers.common['Content-Type'] = 'application/json'
    config.headers.common['Access-Control-Allow-Origin'] = '*'
    return config
  },
  function(error) {
    return Promise.reject(error)
  }
)

function isAuthenticated() {
  const expiresAt = window.localStorage.getItem('expiresAt')
  return new Date().getTime() < expiresAt
}

function getIdToken() {
  return isAuthenticated() ? localStorage.getItem('idToken') : null
}

axios.interceptors.response.use(
  function(response) {
    return response
  },
  function(error) {
    if (error.response && error.response.status === 401) {
      window.location.href = '/login'
    }
    if (error.response && error.response.status === 500) {
      Vue.toasted.clear()
      Vue.toasted.error('エラーが発生しました')
    }
    return Promise.reject(error.response)
  }
)

Vue.use(axios)
