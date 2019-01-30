<template lang="pug">
div
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  mounted() {
    this.$store.dispatch('session/signOut').then(() => {
      this.$router.push('signin')
    })
  }
})
</script>
