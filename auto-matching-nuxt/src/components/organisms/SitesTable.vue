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
    tr(v-for="site in $store.state.sites" :key="site.id")
      th {{ site.attributes.id }}
      th(v-html="site.attributes.link")
      td {{ site.attributes.login_user }}
      td {{ site.attributes.login_password }}
      td {{ site.attributes.activate_flag }}
      td
        nuxt-link(:to="{ path: editPath(site.id), params: { id:site.id } }") 編集
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  methods: {
    editPath(id: Number) {
      return `/sites/${id}`
    }
  }
} as any)
</script>
