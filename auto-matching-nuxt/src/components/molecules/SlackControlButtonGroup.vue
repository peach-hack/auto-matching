<template lang="pug">
.form-group
  label Slackリアルタイム通知
  .badge.badge-pill.badge-success(v-if="$state.slack.timerOn")
    | 監視中
  .badge.badge-pill.badge-dark(v-else)
    | 停止中
  .button-group
    button(type="button" @click="start").btn.btn-primary
      | Start
    button(type="button" @click="stop").btn.btn-light
      | Stop
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import { postApiUsersAutoSlack } from '@/plugins/api'

export default Vue.extend({
  methods: {
    start: function() {
      console.log('slack notify start')
      postApiUsersAutoSlack()
      this.$store.commit('slack/setTimerOn', true)

      const timerObj = setInterval(function() {
        console.log('slack notify exec.')
        postApiUsersAutoSlack()
      }, 600000) // 5min

      this.$store.commit('slack/setTimerObj', timerObj)
    },
    stop: function() {
      clearInterval(this.$state.slack.timerObj)
      this.$store.commit('slack/setTimerOn', false)
      console.log('slack notify stop')
    }
  }
})
</script>
