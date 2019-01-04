<template lang="pug">
templates-table
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import TemplatesTable from '@/components/organisms/TemplatesTable.vue'

export default Vue.extend({
  components: {
    TemplatesTable
  },
  async fetch({ store }: { store: any }) {
    await store.dispatch('posts/fetchTemplates')
  }
} as any)
</script>
