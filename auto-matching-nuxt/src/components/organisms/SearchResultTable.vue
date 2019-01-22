<template lang="pug">
div(v-if="$state.search.posts.length !== 0")
  h4
    | 検索結果
  table.table
    thead
      tr
        th タイトル
        th 投稿日時
        th 都道府県
        th 区市町村
        th プロフィール名
        th 年代
        th 性別
        th 登録地域
        th サイト名
        th カテゴリ
        th 掲示板へ
    tbody
      search-result-list(v-for="post in $state.search.posts" :post="post" :key="post.id")

</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import SearchResultList from '@/components/molecules/SearchResultList.vue'

export default Vue.extend({
  components: {
    SearchResultList
  }
})
</script>
