<template lang="pug">
div
  db-search-form
  br
  br
  search-result-table
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import DbSearchForm from '@/components/organisms/DbSearchForm.vue'
//@ts-ignore
import SearchResultTable from '@/components/organisms/SearchResultTable.vue'

export default Vue.extend({
  components: {
    DbSearchForm,
    SearchResultTable
  }
})
</script>
