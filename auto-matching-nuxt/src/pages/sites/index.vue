<template lang="pug">
sites-table
</template>

<script lang="ts">
import SitesTable from '@/components/organisms/SitesTable.vue'

export default {
  components: {
    SitesTable
  },
  async fetch({ store }: { store: any }) {
    await store.dispatch('fetchSites')
  }
} as any
</script>
