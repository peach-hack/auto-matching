<template lang="pug">
form(@submit.prevent="createTemplate")
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
import { postApiUsersPostsTemplates } from '@/plugins/api'
import { AxiosError, AxiosResponse } from 'axios'

export default Vue.extend({
  components: {
    SubmitButtonGroup
  },
  data() {
    return {
      newTitle: '' as string,
      newBody: '' as string
    }
  },
  methods: {
    createTemplate: function() {
      const data = {
        title: this.newTitle,
        body: this.newBody
      }
      postApiUsersPostsTemplates({
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
