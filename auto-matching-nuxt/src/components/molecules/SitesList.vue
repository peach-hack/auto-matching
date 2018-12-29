<template lang="pug">
tr
  th {{ site.attributes.id }}
  th(v-html="site.attributes.link")
  td {{ site.attributes.login_user }}
  td {{ site.attributes.login_password }}
  td {{ site.attributes.activate_flag }}
  td
    nuxt-link(:to="{ path: '/sites/' + site.id }") 編集
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  props: {
    site: String
  }
})
</script>
