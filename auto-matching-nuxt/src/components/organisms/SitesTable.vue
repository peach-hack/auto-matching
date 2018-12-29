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
    sites-list(v-for="site in $store.state.sites" :key="site.id")
</template>

<script lang="ts">
import Vue from 'vue'
import SitesList from '@/components/molecules/SitesList.vue'

export default Vue.extend({
  components: {
    SitesList
  }
} as any)
</script>
