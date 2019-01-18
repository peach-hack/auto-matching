<template lang="pug">
div(v-if="$state.search.posts.length !== 0")
  h4
    | 検索結果
  table.table
    thead
      tr
        th サイト名
        th タイトル
        th 投稿日時
        th カテゴリ
        th 都道府県
        th 区市町村
        th -
        th プロフィール名
        th 年代
        th 性別
        th 登録地域
    tbody

</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({})
</script>
