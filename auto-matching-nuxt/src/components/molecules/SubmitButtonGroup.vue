<template lang="pug">
.form-group
  .button-group
    submit-button
    nuxt-link(:to="{ path: path }")
      button(type="button").btn.btn-light
        | Cancel
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import SubmitButton from '@/components/atoms/SubmitButton.vue'

export default Vue.extend({
  name: 'SubmitButtonGroup',
  components: {
    SubmitButton
  },
  props: {
    path: String
  }
})
</script>
