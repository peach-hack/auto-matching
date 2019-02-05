<template lang="pug">
div
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  mounted() {
    this.$store.dispatch('session/signOut').then(() => {
      this.$router.push('/')
      this.$store.commit('sites/clearSites')
      this.$store.commit('posts/clearTemplates')
    })
  }
})
</script>
