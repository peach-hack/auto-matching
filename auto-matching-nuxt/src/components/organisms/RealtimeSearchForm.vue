<template lang="pug">
form
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
  mounted() {
    this.$store.commit('search/clearPosts')
  }
})
</script>
