<template lang="pug">
form(@submit.prevent="submit")
  .form-group        
    submit-button
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import SubmitButton from '@/components/atoms/SubmitButton.vue'

//@ts-ignore
import { postApiUsersAutoSlack } from '@/plugins/api'

export default Vue.extend({
  components: {
    SubmitButton
  },
  methods: {
    submit: function() {
      postApiUsersAutoSlack()
        .then(() => {
          this.$toasted.success('更新しました')
        })
        .catch(() => {
          this.$toasted.error('エラーが発生しました')
        })
    }
  }
})
</script>
