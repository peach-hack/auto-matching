<template lang="pug">
form(@submit.prevent="submit")
  .form-group
    selected-checkbox-site-table(@update:selected="selected = $event" :histories="$state.search.histories")
  .form-group
    label(for="areaInput") 投稿地域
    input(type="text" v-model="area").form-control#areaInput.col-2
  .form-group        
    submit-button
</template>

<script lang="ts">
import Vue from 'vue'
//@ts-ignore
import { postApiUsersSearchRealtime } from '@/plugins/api'
//@ts-ignore
import SelectedCheckboxSiteTable from '@/components/molecules/SelectedCheckboxSiteTable.vue'
//@ts-ignore
import SubmitButton from '@/components/atoms/SubmitButton.vue'

import { AxiosError, AxiosResponse } from 'axios'

export default Vue.extend({
  components: {
    SelectedCheckboxSiteTable,
    SubmitButton
  },
  data: function() {
    return {
      selected: [] as number[],
      area: '東京都' as string
    }
  },
  methods: {
    submit: function() {
      if (this.selected.length === 0) {
        this.$toasted.error('対象サイトが選択されていません')
        return
      }
      this.$store.commit('search/clearPosts')
      postApiUsersSearchRealtime({
        attributes: {
          ids: this.selected,
          area: this.area
        }
      })
        .then((response: AxiosResponse) => {
          this.$toasted.success('実行しました')
          this.$store.commit({
            type: 'search/changeStatus',
            ids: this.selected,
            status: '実行中'
          })
        })
        .catch((error: AxiosError) => {
          this.$toasted.error('エラーが発生しました')
          this.$store.commit({
            type: 'search/changeStatus',
            ids: this.selected,
            status: '失敗'
          })
        })
    }
  }
})
</script>
