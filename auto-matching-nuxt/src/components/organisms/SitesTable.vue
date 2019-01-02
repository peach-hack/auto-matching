<template lang="pug">
table.table
  thead
    tr
      th #
      th サイト名
      th ログインID
      th ログインパスワード
      th 操作対象
      th 編集
  tbody
    tr(v-for="site in $store.state.sites.sites" :key="site.id")
      th {{ site.id }}
      th(v-html="getLink(site)")
      td {{ site.loginUser }}
      td {{ site.loginPassword }}
      td {{ getActivate(site) }}
      td
        nuxt-link(:to="{ path: getEditPath(site), params: {id: site.id } }") 編集
</template>

<script lang="ts">
import Vue from 'vue'
import { mapGetters } from 'vuex'

export default Vue.extend({
  computed: {
    ...mapGetters({
      getLink: 'sites/link',
      getActivate: 'sites/activate',
      getEditPath: 'sites/editPath'
    })
  }
} as any)
</script>
