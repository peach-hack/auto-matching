<template lang="pug">
div
  keyword-search-form
  br
  br
  search-result-table
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import KeywordSearchForm from '@/components/organisms/KeywordSearchForm.vue'
//@ts-ignore
import SearchResultTable from '@/components/organisms/SearchResultTable.vue'

export default Vue.extend({
  components: {
    KeywordSearchForm,
    SearchResultTable
  }
})
</script>
