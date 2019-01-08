<template lang="pug">
.form-group
  .button-group
    button(type="button submit").btn.btn-primary
      | Submit
    nuxt-link(:to="{ path: path }")
      button(type="button").btn.btn-light
        | Cancel
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  name: 'SubmitButtonGroup',
  props: {
    path: String
  }
})
</script>
