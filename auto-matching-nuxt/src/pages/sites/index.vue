<template lang="pug">
sites-table
</template>

<script lang="ts">
import Vue from 'vue'
import SitesTable from '@/components/organisms/SitesTable.vue'

export default Vue.extend({
  components: {
    SitesTable
  },
  mounted() {
    this.$store.dispatch('fetchSites')
  }
} as any)
</script>
