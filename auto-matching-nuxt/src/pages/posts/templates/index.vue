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
  mounted() {
    this.$store.dispatch('posts/fetchTemplates')
  }
})
</script>
