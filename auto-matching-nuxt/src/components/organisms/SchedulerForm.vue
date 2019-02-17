<template lang="pug">
table.table
  thead
    tr
      th Id 
      th サイト名
      th 定期投稿
      th 定期監視
  tbody
    tr(v-for="site in sites" :key="site.id")
      td {{ site.id }}
      td {{ site.name }}
      td
      td
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  data: function() {
    return {
      sites: [
        {
          id: 1,
          name: 'ハッピーメール'
        },
        {
          id: 2,
          name: 'ワクワクメール'
        },
        {
          id: 3,
          name: 'PCMAX'
        },
        {
          id: 4,
          name: 'イクヨクルヨ'
        },
        {
          id: 5,
          name: 'ミントC!Jメール'
        },
        {
          id: 6,
          name: 'メルパラ'
        }
      ]
    }
  }
})
</script>
