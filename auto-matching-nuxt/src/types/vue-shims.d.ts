import Vue from 'vue'
import * as Vuex from 'vuex'

declare module '*.vue' {
  const _default: Vue
  export default _default
}

declare module 'vue/types/vue' {
  //@ts-ignore
  import * as Store from '@/store'

  interface Vue {
    $store: Vuex.Store<any> // Store が any になっているのでこの部分は妥協する
    $state: Store.State // State はこうすることによって型定義が守られる
  }
}
