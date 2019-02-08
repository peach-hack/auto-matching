<template lang="pug">
div
  label
    | 掲示板投稿データ削除
  p
    | データベースに保存されている掲示板投稿データをすべて削除します。
  button(@click="clear").btn.btn-primary
    | Clear
</template>

<script lang="ts">
import Vue from 'vue'
//@ts-ignore
import { postApiUsersSettingsPostsClear } from '@/plugins/api'

export default Vue.extend({
  methods: {
    clear() {
      if (confirm('本当に削除しますか？')) {
        postApiUsersSettingsPostsClear()
          .then(() => {
            this.$toasted.success('削除しました')
            window.location.reload()
          })
          .catch(() => {
            this.$toasted.error('エラーが発生しました')
          })
      }
    }
  }
})
</script>
