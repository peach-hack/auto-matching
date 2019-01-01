<template lang="pug">
div
  h2 {{ getSite(idx(id)).name }}
  site-form(:id="id")
</template>

<script lang="ts">
import Vue from 'vue'
import { mapGetters } from 'vuex'
import SiteForm from '@/components/organisms/SiteForm.vue'

const Api = require('@/plugins/api')

// @ts-ignore
export default Vue.extend({
  components: {
    SiteForm
  },
  computed: {
    ...mapGetters({
      idx: 'index',
      getSite: 'site'
    }),
    id: function(): number {
      return parseInt(this.$route.params.id)
    }
  }
})
</script>
