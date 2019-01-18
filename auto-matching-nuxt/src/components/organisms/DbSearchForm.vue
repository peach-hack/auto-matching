<template lang="pug">
form
  .form-group
    label(for="titleKeywordInput") キーワード（タイトル）
    input(type="text").form-control#titleKeywordInput
  search-button
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import SearchButton from '@/components/atoms/SearchButton.vue'

export default Vue.extend({
  components: {
    SearchButton
  },
  data() {
    return {
      titleKeywords: '' as string
    }
  },
  methods: {
    updateSite: function() {
      const data = {
        title: this.titleKeywords
      }

      putApiUsersSourceSitesById({
        id: this.site.id,
        attributes: data
      }).catch((error: any) => {
        this.$toasted.error('エラーが発生しました')
      })
    }
  }
})
</script>
