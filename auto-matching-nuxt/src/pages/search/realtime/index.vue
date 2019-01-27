<template lang="pug">
div
  realtime-polling-form
  br
  br
  search-result-table
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import RealtimePollingForm from '@/components/organisms/RealtimePollingForm.vue'
//@ts-ignore
import SearchResultTable from '@/components/organisms/SearchResultTable.vue'

export default Vue.extend({
  mounted() {
    this.$store.dispatch('posts/fetchHistories')
  },
  components: {
    RealtimePollingForm,
    SearchResultTable
  }
})
</script>
