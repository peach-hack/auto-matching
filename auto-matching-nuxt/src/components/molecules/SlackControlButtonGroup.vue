<template lang="pug">
.form-group
  label Slackリアルタイム通知
  .button-group
    button(type="button" @click="start").btn.btn-primary
      | Start
    button(type="button" @click="stop").btn.btn-light
      | Stop
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  methods: {
    start: function() {
      console.log('slack notify start')
      this.timerObj = setInterval(function() {
        console.log('slack notify exec.')
      }, 1000)
      this.timerOn = true
    },
    stop: function() {
      clearInterval(this.timerObj)
      this.timerOn = false
      console.log('slack notify stop')
    }
  }
})
</script>
