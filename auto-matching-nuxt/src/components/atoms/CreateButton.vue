<template lang="pug">
nuxt-link(:to="{ path: path }")
  button.btn.btn-primary
    | Create
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'CreateButton',
  props: {
    path: String
  }
})
</script>
