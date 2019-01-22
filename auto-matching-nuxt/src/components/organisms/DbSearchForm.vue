<template lang="pug">
form(@submit.prevent="search")
  .form-group
    label(for="datetimeInput") 投稿日時
    .form-inline
      datetime(v-model="query.post_at_gteq" type="datetime" placeholder="はじめ")#datetimeInput
      datetime(v-model="query.post_at_lteq" type="datetime" placeholder="おわり")#datetimeInput
  .form-group
      label(for="areaInput") 投稿地域
      .form-group
        input(type="text" v-model="query.prefecture_cont" placeholder="都道府県").form-control#areaInput
        input(type="text" v-model="query.city_cont" placeholder="市区町村").form-control#areaInput
  .form-group
    label(for="titleKeywordInput") タイトル
    input(type="text" v-model="query.title_cont" placeholder="キーワード").form-control#titleKeywordInput
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
        city_cont: '' as string
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
    }
  }
})
</script>
