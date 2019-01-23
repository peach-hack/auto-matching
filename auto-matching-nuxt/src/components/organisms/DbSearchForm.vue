<template lang="pug">
form(@submit.prevent="search")
  .form-group
    label(for="titleKeywordInput") 投稿タイトル
    input(type="text" v-model="query.title_cont" placeholder="キーワード").form-control#titleKeywordInput
  .form-group
    label(for="datetimeInput") 投稿日時
    .form-inline
      datetime(v-model="query.post_at_gteq" type="datetime" placeholder="はじめ")#datetimeInput.m-md-2
      datetime(v-model="query.post_at_lteq" type="datetime" placeholder="おわり")#datetimeInput.m-md-2
  .form-group
    label(for="areaInput") 投稿地域
    .form-group
      input(type="text" v-model="query.prefecture_cont" placeholder="都道府県").form-control#areaInput
      input(type="text" v-model="query.city_cont" placeholder="市区町村").form-control#areaInput
  .form-group
    label(for="profileInput") プロフィール
    .form-group
      input(type="text" v-model="query.profileName_cont" placeholder="プロフィール名").form-control#profileInput
      b-dropdown(text="年代" v-model="query.age_eq")#profileInput
        b-dropdown-item 18-19歳
        b-dropdown-item 20代前半
        b-dropdown-item 20代半ば
        b-dropdown-item 20代後半
        b-dropdown-item 30代前半
        b-dropdown-item 30代半ば
        b-dropdown-item 30代後半
        b-dropdown-item 40代前半
        b-dropdown-item 40代半ば
        b-dropdown-item 40代後半
        b-dropdown-item 50代前半
        b-dropdown-item 50代半ば
        b-dropdown-item 50代後半
        b-dropdown-item 60歳以上
  .form-group
    label(for="siteInput") サイト
    .form-group
      b-dropdown(text="サイト名" v-model="query.category_eq")#siteInput.m-md-2
        b-dropdown-item ハッピーメール
        b-dropdown-item ワクワクメール
        b-dropdown-item PCMAX
        b-dropdown-item イクヨクルヨ
        b-dropdown-item ミントC!Jメール
        b-dropdown-item メルパラ
      b-dropdown(text="掲示板カテゴリ" v-model="query.category_eq")#siteInput.m-md-2
        b-dropdown-item スグ会いたい
        b-dropdown-item スグじゃないけど
        b-dropdown-item アブノーマル
  search-button
  button(type="button" @click="clear").btn.btn-light
    | Clear
</template>

<script lang="ts">
import Vue from 'vue'
import { Datetime } from 'vue-datetime'
import 'vue-datetime/dist/vue-datetime.css'

//@ts-ignore
import SearchButton from '@/components/atoms/SearchButton.vue'
//@ts-ignore
import { getApiUsersSearchDb } from '@/plugins/api'
import Qs from 'qs'

export default Vue.extend({
  components: {
    SearchButton,
    datetime: Datetime
  },
  data() {
    return {
      query: {
        title_cont: '' as string,
        post_at_gteq: '' as string,
        post_at_lteq: '' as string,
        prefecture_cont: '' as string,
        city_cont: '' as string,
        category_eq: '' as string
      }
    }
  },
  created() {
    this.$store.commit('search/clearPosts')
  },
  methods: {
    search: function() {
      const queryParameters = {
        params: {
          q: this.query
        },
        paramsSerializer: function(params: any) {
          return Qs.stringify(params, { arrayFormat: 'brackets' })
        }
      }
      this.$store
        .dispatch('search/searchDb', queryParameters)
        .catch((error: any) => {
          console.log(error)
          this.$toasted.error('エラーが発生しました')
        })
    },
    clear: function() {
      this.query.title_cont = ''
      this.query.post_at_gteq = ''
      this.query.post_at_lteq = ''
      this.query.prefecture_cont = ''
      this.query.city_cont = ''
      this.query.category_eq = ''
    }
  }
})
</script>
