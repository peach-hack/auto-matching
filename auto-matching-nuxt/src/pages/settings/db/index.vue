<template lang="pug">
div
  db-info-callout-group
  clear-db-button
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import ClearDbButton from '@/components/atoms/ClearDbButton.vue'
//@ts-ignore
import DbInfoCalloutGroup from '@/components/molecules/DbInfoCalloutGroup.vue'

export default Vue.extend({
  components: {
    ClearDbButton,
    DbInfoCalloutGroup
  }
})
</script>
