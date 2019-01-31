<template lang="pug">
table.table
  thead
    tr
      th 
      th サイト名
      th ログインID
      th ログインパスワード
      th 操作対象
      th 編集
  tbody
    tr(v-for="site in $state.sites.sites" :key="site.id")
      th 
      th(v-html="getLink(site)")
      td {{ site.loginUser }}
      td {{ site.loginPassword | hidePassword }}
      td {{ getActivate(site) }}
      td
        nuxt-link(:to="{ path: getEditPath(site), params: {id: site.id } }") 編集
</template>

<script lang="ts">
import Vue from 'vue'
//@ts-ignore
import Site from '@/types/site'

export default Vue.extend({
  filters: {
    hidePassword: function(value: string): string {
      if (value === null || value == '') {
        return ''
      } else {
        let ret = ''
        for (var i = 0; i < value.length; i++) {
          ret += '*'
        }
        return ret
      }
    }
  },
  methods: {
    getLink: function(site: Site): string {
      return `<a href=${site.url} target="_blank">${site.name}</a>`
    },
    getActivate: function(site: Site): string {
      return site.activateFlag ? '有効' : '無効'
    },
    getEditPath: function(site: Site): string {
      return `/settings/sites/${site.id}`
    }
  }
})
</script>
