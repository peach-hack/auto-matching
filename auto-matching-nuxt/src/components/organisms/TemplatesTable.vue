<template lang="pug">
table.table
  thead
    tr
      th #
      th タイトル
      th 作成日時
      th 更新日時
      th 編集
      th 削除
  tbody
    tr(v-for="template in $store.state.posts.templates" :key="template.id")
      th {{ template.id }}
      th {{ template.title }}
      td {{ template.createdAt }}
      td {{ template.updatedAt }}
      // td
      //   nuxt-link(:to="{ path: getEditPath(site), params: {id: site.id } }") 編集
      // td
      //   nuxt-link(:to="{ path: getEditPath(site), params: {id: site.id } }") 削除
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  computed: {}
})
</script>
