<template lang="pug">
form(@submit.prevent="manualPost")
  .form-group
    table.table
      thead
        tr
          th
            .form-check
              input.form-check-input.position-static(type="checkbox")
          th サイト名
          th 操作対象
          th 状態
      tbody
        tr(v-for="site in $state.sites.sites" :key="site.id")
          th
            .form-check
              input.form-check-input.position-static(type="checkbox" :disabled="isCheckBoxDisabled(site)")
          th(v-html="getLink(site)")
          th {{ getActivate(site) }}
          th -
  .form-group        
    button(type="button submit").btn.btn-primary
      | 一括投稿
</template>

<script lang="ts">
import Vue from 'vue'
//@ts-ignore
import Site from '@/types/site'

export default Vue.extend({
  methods: {
    getLink: function(site: Site): string {
      return `<a href=${site.url} target="_blank">${site.name}</a>`
    },
    getActivate: function(site: Site): string {
      return site.activateFlag ? '有効' : '無効'
    },
    isCheckBoxDisabled: function(site: Site): boolean {
      return !site.activateFlag
    }
  }
})
</script>
