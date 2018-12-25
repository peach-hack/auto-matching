<template lang="pug">
b-card
  table.table
    thead
      tr
        th #
        th サイト名
        th サイトURL
        th ログインID
        th ログインパスワード
        th 操作対象
        th 編集
    tbody
      tr(v-for="site in sites" :key="site.id")
        th {{ site.attributes.id }}
        td {{ site.attributes.name }}
        td {{ site.attributes.url }}
        td {{ site.attributes.user_id }}
        td {{ site.attributes.password }}
        td {{ site.attributes.activate_flag }}
        td
          nuxt-link(:to="{ path: '/sites/' + site.id }") 編集
</template>

<script lang="ts">
import Vue from 'vue'
import { getApiUsersSourceSites } from '~/plugins/api'

export default Vue.extend({
  data() {
    return {
      sites: [] as any
    }
  },
  mounted() {
    getApiUsersSourceSites().then((response: any) => {
      response.data.data.map((site: any) => this.sites.push(site))
    })
  }
})
</script>
