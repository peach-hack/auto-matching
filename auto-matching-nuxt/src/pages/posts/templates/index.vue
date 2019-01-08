<template lang="pug">
div
  templates-table
  create-button
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import TemplatesTable from '@/components/organisms/TemplatesTable.vue'
//@ts-ignore
import CreateButton from '@/components/atoms/CreateButton.vue'

export default Vue.extend({
  components: {
    TemplatesTable,
    CreateButton
  },
  mounted() {
    this.$store.dispatch('posts/fetchTemplates')
  }
})
</script>
