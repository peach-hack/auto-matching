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

export default Vue.extend({
  methods: {
    clear() {
      console.log('clear')
    }
  }
})
</script>
