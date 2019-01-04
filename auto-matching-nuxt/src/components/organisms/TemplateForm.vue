<template lang="pug">
form(@submit.prevent="updateTemplate")
  .form-group
    label タイトル
    input.form-control(type="text" v-model="template.title")
  .form-group
    label 本文
    textarea.form-control(type="text" v-model="template.body")
  submit-button-group(path="/posts/templates")
</template>

<script lang="ts">
import Vue from 'vue'
//@ts-ignore
import SubmitButtonGroup from '@/components/molecules/SubmitButtonGroup.vue'

//@ts-ignore
const Api = require('@/plugins/api')

export default Vue.extend({
  components: {
    SubmitButtonGroup
  },
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
