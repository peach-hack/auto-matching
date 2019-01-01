<template lang="pug">
div
  // h2 {{ getSite(siteId).name }}
  site-form(:id="id")
</template>

<script lang="ts">
import Vue from 'vue'
import SiteForm from '@/components/organisms/SiteForm.vue'

const Api = require('@/plugins/api')

// @ts-ignore
export default Vue.extend({
  components: {
    SiteForm
  },
  computed: {
    id: function(): number {
      return parseInt(this.$route.params.id)
    }
  }
})
</script>
