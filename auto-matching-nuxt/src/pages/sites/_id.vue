<template lang="pug">
div
  h2 {{ site.name }}
  site-form(:site="site")
</template>

<script lang="ts">
import Vue from 'vue'
import { mapGetters } from 'vuex'

// @ts-ignore
import SiteForm from '@/components/organisms/SiteForm.vue'

const Api = require('@/plugins/api')

export default Vue.extend({
  components: {
    SiteForm
  },
  computed: {
    site: function(): Object {
      const idx = parseInt(this.$route.params.id) - 1
      return this.$store.state.sites.sites[idx]
    }
  }
})
</script>
