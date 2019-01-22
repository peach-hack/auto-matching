<template lang="pug">
form(@submit.prevent="search")
  .form-group
    label(for="datetimeInput") 投稿日時
    .form-inline
      datetime(v-model="query.date_gteq" type="datetime" placeholder="はじめ")#datetimeInput
      datetime(v-model="query.date_lteq" type="datetime" placeholder="おわり")#datetimeInput
  .form-group
    label(for="titleKeywordInput") タイトル
    input(type="text" v-model="query.title_cont" placeholder="キーワード").form-control#titleKeywordInput
  search-button
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
        date_gteq: '' as string,
        date_lteq: '' as string
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
    }
  }
})
</script>
