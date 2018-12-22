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
        td {{ site.attributes.login_user }}
        td {{ site.attributes.login_password }}
        td {{ site.attributes.activate_flag }}
        td
          nuxt-link(to="/sites/1") 編集
</template>

<script lang="ts">
  import { Vue, Component } from 'vue-property-decorator'
  import axios from 'axios'
  @Component
  export default class Sites extends Vue {
    sites: string[] = []
    async mounted(): Promise<void> {
      axios.defaults.baseURL = 'http://localhost:5000'
      process.env.NODE_TLS_REJECT_UNAUTHORIZED = '0'
      await this.getApiUsersSourceSites()
    }
    async getApiUsersSourceSites(): Promise<void> {
      await axios.get('api/users/source-sites').then(response => {
        response.data.data.map((site: any) => this.sites.push(site))
      })
    }
  }
</script>
