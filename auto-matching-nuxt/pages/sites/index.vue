<template lang="pug">
sites-table(:sites="sites")
</template>

<script lang="ts">
import Vue from 'vue'
import SitesTable from '~/components/organisms/SitesTable'
import { getApiUsersSourceSites } from '~/plugins/api'

export default Vue.extend({
  components: {
    SitesTable
  },
  data() {
    return {
      sites: [] as any
    }
  },
  mounted() {
    getApiUsersSourceSites().then((response: any) => {
      response.data.data.map((site: any) => this.sites.push(site))
    })
  }
})
</script>
