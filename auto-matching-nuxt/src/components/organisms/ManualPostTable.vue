<template lang="pug">
form(@submit.prevent="manualPost")
  .form-group
    table.table
      thead
        tr
          th
            .form-check
              input.form-check-input.position-static(
                type="checkbox" @click="select" v-model="selectAll")
          th サイト名
          th 操作対象
          th 状態
      tbody
        tr(v-for="site in $state.sites.sites" :key="site.id")
          th
            .form-check
              input.form-check-input.position-static(
                type="checkbox" :disabled="isCheckBoxDisabled(site)" 
                v-model="selected" :value="site.id")
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
  data: function() {
    return {
      selected: [] as number[],
      selectAll: false as boolean
    }
  },
  methods: {
    select: function() {
      this.selected = []

      if (!this.selectAll) {
        this.getSites().forEach((site: Site) => {
          if (site.activateFlag) {
            this.selected.push(this.getSite(site.id).id)
          }
        })
      }
    },
    getLink: function(site: Site): string {
      return `<a href=${site.url} target="_blank">${site.name}</a>`
    },
    getActivate: function(site: Site): string {
      return site.activateFlag ? '有効' : '無効'
    },
    isCheckBoxDisabled: function(site: Site): boolean {
      return !site.activateFlag
    },
    getSites: function(): Site[] {
      return this.$store.state.sites.sites
    },
    getSite: function(id: number): Site {
      return this.$store.state.sites.sites[id - 1]
    }
  }
})
</script>
