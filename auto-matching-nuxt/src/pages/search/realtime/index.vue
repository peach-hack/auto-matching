<template lang="pug">
div
  realtime-search-form
  br
  br
  search-result-table
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import RealtimeSearchForm from '@/components/organisms/RealtimeSearchForm.vue'
//@ts-ignore
import SearchResultTable from '@/components/organisms/SearchResultTable.vue'

export default Vue.extend({
  components: {
    RealtimeSearchForm,
    SearchResultTable
  },
  mounted() {
    this.$store.dispatch('posts/fetchHistories')
  }
})
</script>
