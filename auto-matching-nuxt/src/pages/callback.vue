<template lang="pug">
p Signing in ...  
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  mounted() {
    this.$auth0.setTokenByQuery()
    this.$router.replace('/')
  }
} as any)
</script>
