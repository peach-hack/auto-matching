<template lang="pug">
form(@submit.prevent="search")
  .form-group
    label(for="titleKeywordInput") キーワード（タイトル）
    input(type="text" v-model="query.title_cont").form-control#titleKeywordInput
  search-button
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import SearchButton from '@/components/atoms/SearchButton.vue'
//@ts-ignore
import { getApiUsersSearchDb } from '@/plugins/api'
import Qs from 'qs'

export default Vue.extend({
  components: {
    SearchButton
  },
  data() {
    return {
      query: {
        title_cont: '' as string
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
