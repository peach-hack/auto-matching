<template lang="pug">
div
  // h2 {{ getSite(siteId).name }}
  site-form(:id=id)
</template>

<script lang="ts">
import Vue from 'vue'
import { mapGetters } from 'vuex'
import SiteForm from '@/components/organisms/SiteForm.vue'

const Api = require('@/plugins/api')

export default Vue.extend({
  components: {
    SiteForm
  },
  computed: {
    id: function({ route }: { route: any }): number {
      return parseInt(route.params.id)
    }
  }
} as any)
</script>
