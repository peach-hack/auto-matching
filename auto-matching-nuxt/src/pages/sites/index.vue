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
  mounted() {
    this.$store.dispatch('sites/fetchSites')
  }
})
</script>
