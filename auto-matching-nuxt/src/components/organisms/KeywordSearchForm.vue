<template lang="pug">
form
  .form-group
    label(for="keywordInput") キーワード
    input(type="text").form-control#keywordInput
  search-button
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import SearchButton from '@/components/atoms/SearchButton.vue'

export default Vue.extend({
  components: {
    SearchButton
  },
  created() {
    this.$store.commit('search/clearPosts')
  }
})
</script>
