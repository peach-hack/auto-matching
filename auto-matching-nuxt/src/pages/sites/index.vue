<template lang="pug">
sites-table
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import SitesTable from '@/components/organisms/SitesTable.vue'

export default Vue.extend({
  components: {
    SitesTable
  },
  async fetch({ store }: { store: any }) {
    await store.dispatch('sites/fetchSites')
  }
} as any)
</script>
