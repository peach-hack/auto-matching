<template lang="pug">
div
  slack-control-button-group
  // slack-channel-form
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
// import SlackChannelForm from '@/components/organisms/SlackChannelForm.vue'
//@ts-ignore
import SlackControlButtonGroup from '@/components/molecules/SlackControlButtonGroup.vue'

export default Vue.extend({
  components: {
    // SlackChannelForm,
    SlackControlButtonGroup
  }
})
</script>
