<template lang="pug">
div
  h2 {{ site.name }}
  site-form(:site="site")
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import SiteForm from '@/components/organisms/SiteForm.vue'
//@ts-ignore
import Site from '@/types/site'

export default Vue.extend({
  components: {
    SiteForm
  },
  computed: {
    site: function(): Object {
      const idx = parseInt(this.$route.params.id)
      return this.$store.state.sites.sites.filter(
        (site: Site) => site.id === idx
      )[0]
    }
  }
})
</script>
