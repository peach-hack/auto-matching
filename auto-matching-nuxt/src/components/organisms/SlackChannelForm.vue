<template lang="pug">
form(@submit.prevent="submit")
  .form-group
    label Slack Webhook URL
    input.form-control(type="text")
  .form-group
    submit-button    
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import SubmitButton from '@/components/atoms/SubmitButton.vue'

export default Vue.extend({
  components: {
    SubmitButton
  }
})
</script>
