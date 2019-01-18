<template lang="pug">
manual-post-table
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import ManualPostTable from '@/components/organisms/ManualPostTable.vue'

export default Vue.extend({
  components: {
    ManualPostTable
  },
  mounted() {
    this.$store.dispatch('posts/fetchHistories')
  }
})
</script>
