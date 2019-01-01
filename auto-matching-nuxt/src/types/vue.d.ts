import Vue from 'vue'
import VueRouter from 'vue-router'
import { Store } from 'vuex'
import Toasted from 'vue-toasted'

declare module 'vue/types/vue' {
  interface Vue {
    $toast: Toasted.ToastedPlugin
    $store: Store<any>
    $router: VueRouter
  }
}
