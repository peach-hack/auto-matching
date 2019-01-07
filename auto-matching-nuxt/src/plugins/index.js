import Vue from 'vue'
import VueToasted from 'vue-toasted'
import VueRouter from 'vue-router'

Vue.use(VueToasted)
Vue.use(VueRouter)

Object.defineProperty(Vue.prototype, '$state', {
  get() {
    return this.$store.state
  }
})
