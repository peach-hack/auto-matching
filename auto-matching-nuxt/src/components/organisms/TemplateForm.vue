<template lang="pug">
form(@submit.prevent="updateTemplate")
  .form-group
    label タイトル
    input.form-control(type="text" v-model="template.title")
  .form-group
    label 本文
    textarea.form-control(type="text" v-model="template.body")
  button(type="button submit").btn.btn-primary
    | Submit
  nuxt-link(to="/posts/templates")
    button(type="button").btn.btn-light
      | Cancel
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
const Api = require('@/plugins/api')

export default Vue.extend({
  props: {
    template: {
      type: Object,
      required: true
    }
  },
  methods: {
    updateTemplate: function() {
      // Api.putApiUsersPostTemplateById({
      //   id: this.site.id,
      //   attributes: this.site
      // })
      //   .then((response: any) => {
      //     this.$router.push('/sites')
      //     this.$toasted.success('更新しました')
      //   })
      //   .catch((error: any) => {
      //     this.$toasted.error('エラーが発生しました')
      //   })
    }
  }
})
</script>
