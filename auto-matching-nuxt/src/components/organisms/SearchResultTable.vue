<template lang="pug">
div(v-if="$state.search.posts.length !== 0")
  h4
    | 検索結果
  table.table
    thead
      tr
        th #
    tbody
      tr
        th 1
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({})
</script>
