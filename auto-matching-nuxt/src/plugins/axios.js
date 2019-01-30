import Vue from 'vue'
import axios from 'axios'

axios.interceptors.request.use(
  config => {
    console.log('Making request to ' + config.url)
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
      Vue.toasted.clear()
      Vue.toasted.error('エラーが発生しました')
    }
    return Promise.reject(error.response)
  }
)

Vue.use(axios)
