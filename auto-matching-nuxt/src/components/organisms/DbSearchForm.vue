<template lang="pug">
form(@submit.prevent="search")
  .form-group
    label(for="titleKeywordInput") 投稿タイトル
    input(type="text" v-model="query.title_cont" placeholder="キーワード").form-control#titleKeywordInput.col-3
  .form-group
    label(for="datetimeInput") 投稿日時
    .form-inline
      datetime(v-model="query.post_at_gteq" type="datetime" placeholder="はじめ")#datetimeInput.m-md-2
      datetime(v-model="query.post_at_lteq" type="datetime" placeholder="おわり")#datetimeInput.m-md-2
  .form-group
    label(for="areaInput") 投稿地域
    .form-inline
      input(type="text" v-model="query.prefecture_cont" placeholder="都道府県").form-control#areaInput.col-2
      input(type="text" v-model="query.city_cont" placeholder="市区町村").form-control#areaInput.col-2
  .form-group
    label(for="profileInput") プロフィール
    .form-inline
      input(type="text" v-model="query.profile_name_cont" placeholder="プロフィール名").form-control#profileInput.col-3
      select#profileInput.custom-select(v-model="query.profile_age_eq").col-3
        option(selected disabled value="") 年代
        option 18-19歳
        option 20代前半
        option 20代半ば
        option 20代後半
        option 30代前半
        option 30代半ば
        option 30代後半
        option 40代前半
        option 40代半ば
        option 40代後半
        option 50代前半
        option 50代半ば
        option 50代後半
        option 60歳以上
  .form-group
    label(for="siteInput") サイト
    .form-inline
      select#siteInput.custom-select(v-model="query.profile_source_site_name_eq").col-3
        option(selected disabled value="") サイト名
        option ハッピーメール
        option ワクワクメール
        option PCMAX
        option イクヨクルヨ
        option ミントC!Jメール
        option メルパラ
      select#siteInput.custom-select(v-model="query.category_eq").col-3
        option(selected disabled value="") 掲示板カテゴリ
        option スグ会いたい
        option スグじゃないけど
        option アブノーマル
  search-button
  button(type="button" @click="clear").btn.btn-light
    | Clear
</template>

<script lang="ts">
import Vue from 'vue'
//@ts-ignore
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
        profile_name_cont: '' as string,
        profile_age_eq: '' as string,
        profile_source_site_name_eq: '' as string,
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
        paramsSerializer: function(params: any): string {
          return Qs.stringify(params, { arrayFormat: 'brackets' })
        }
      }
      this.$store.dispatch('search/searchDb', queryParameters).catch(() => {
        this.$toasted.error('エラーが発生しました')
      })
    },
    clear: function() {
      this.query.title_cont = ''
      this.query.post_at_gteq = ''
      this.query.post_at_lteq = ''
      this.query.prefecture_cont = ''
      this.query.city_cont = ''
      this.query.profile_name_cont = ''
      this.query.profile_age_eq = ''
      this.query.profile_source_site_name_eq = ''
      this.query.category_eq = ''
    }
  }
})
</script>
