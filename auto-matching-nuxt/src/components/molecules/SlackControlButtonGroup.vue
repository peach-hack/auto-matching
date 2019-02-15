<template lang="pug">
.form-group
  label Slackリアルタイム通知
  .badge.badge-pill.badge-success(v-if="timerOn")
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
  data: function() {
    return {
      timerOn: false as boolean,
      timerObj: null as object
    }
  },
  methods: {
    start: function() {
      console.log('slack notify start')
      postApiUsersAutoSlack()
      this.timerOn = true

      this.timerObj = setInterval(function() {
        console.log('slack notify exec.')
        postApiUsersAutoSlack()
      }, 120000) // 2min
    },
    stop: function() {
      clearInterval(this.timerObj)
      this.timerOn = false
      console.log('slack notify stop')
    }
  }
})
</script>
