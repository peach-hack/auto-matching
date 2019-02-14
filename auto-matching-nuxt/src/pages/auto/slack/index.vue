<template lang="pug">
div
  slack-control-button-group
  slack-channel-form
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import SubmitButton from '@/components/atoms/SubmitButton.vue'

//@ts-ignore
import { postApiUsersAutoSlack } from '@/plugins/api'

//@ts-ignore
import SlackChannelForm from '@/components/organisms/SlackChannelForm.vue'
//@ts-ignore
import SlackControlButtonGroup from '@/components/molecules/SlackControlButtonGroup.vue'

export default Vue.extend({
  components: {
    SubmitButton,
    SlackChannelForm,
    SlackControlButtonGroup
  },
  methods: {
    submit: function() {
      postApiUsersAutoSlack()
        .then(() => {
          this.$toasted.success('実行しました')
        })
        .catch(() => {
          this.$toasted.error('エラーが発生しました')
        })
    }
  }
})
</script>
