<template lang="pug">
form(@submit.prevent="search")
  .form-group
    label(for="titleKeywordInput") キーワード（タイトル）
    input(type="text" v-model="title").form-control#titleKeywordInput
  search-button
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import SearchButton from '@/components/atoms/SearchButton.vue'
//@ts-ignore
import { getApiUsersSearchDb } from '@/plugins/api'

export default Vue.extend({
  components: {
    SearchButton
  },
  data() {
    return {
      title: '' as string
    }
  },
  created() {
    this.$store.commit('search/clearPosts')
  },
  methods: {
    search: function() {
      const data = {
        title: this.title
      }
      this.$store
        .dispatch('search/searchDb', {
          data: data
        })
        .catch((error: any) => {
          console.log(error)
          this.$toasted.error('エラーが発生しました')
        })
    }
  }
})
</script>
