<template lang="pug">
sites-table(:sites="sites")
</template>

<script lang="ts">
import Vue from 'vue'
import SitesTable from '@/components/organisms/SitesTable.vue'

const Api = require('@/plugins/api')

export default Vue.extend({
  components: {
    SitesTable
  },
  computed: {
    sites: function(): Array<any> {
      return (<any>this).$store.state.sites
    }
  },
  mounted() {
    Api.getApiUsersSourceSites().then((response: any) => {
      response.data.data.map((site: any) => this.sites.push(site))
    })
  }
} as any)
</script>
