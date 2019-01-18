<template lang="pug">
form
  .form-group
    label(for="titleKeywordInput") キーワード（タイトル）
    input(type="text").form-control#titleKeywordInput
  search-button
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import SearchButton from '@/components/atoms/SearchButton.vue'

export default Vue.extend({
  components: {
    SearchButton
  }
})
</script>
