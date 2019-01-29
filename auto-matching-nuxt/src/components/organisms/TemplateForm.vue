<template lang="pug">
form(@submit.prevent="updateTemplate")
  .form-group
    label タイトル
    input.form-control(type="text" v-model="newTitle")
  .form-group
    label 本文
    textarea.form-control(type="text" v-model="newBody")
  submit-button-group(path="/posts/templates")
</template>

<script lang="ts">
import Vue from 'vue'
//@ts-ignore
import SubmitButtonGroup from '@/components/molecules/SubmitButtonGroup.vue'
//@ts-ignore
import { putApiUsersPostsTemplatesById } from '@/plugins/api'

import { AxiosResponse, AxiosError } from 'axios'

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
  data() {
    return {
      newTitle: this.template.title as string,
      newBody: this.template.body as string
    }
  },
  methods: {
    updateTemplate: function() {
      const data = {
        id: this.template.id,
        title: this.newTitle,
        body: this.newBody
      }
      putApiUsersPostsTemplatesById({
        id: this.template.id,
        attributes: data
      })
        .then((response: AxiosResponse) => {
          this.$router.push('/posts/templates')
          this.$toasted.success('更新しました')
        })
        .catch((error: AxiosError) => {
          this.$toasted.error('エラーが発生しました')
        })
    }
  }
})
</script>
