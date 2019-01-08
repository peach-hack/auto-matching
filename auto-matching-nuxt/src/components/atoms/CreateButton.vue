<template lang="pug">
nuxt-link(:to="{ path: path }")
  button(type="button button-primary").btn.btn-primary
    | 新規作成
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
