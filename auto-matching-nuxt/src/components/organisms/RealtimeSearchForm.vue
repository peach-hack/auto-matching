<template lang="pug">
form(@submit.prevent="submit")
  .form-group
    selected-checkbox-site-table(@update:selected="selected = $event")
  .form-group        
    submit-button
</template>

<script lang="ts">
import Vue from 'vue'
//@ts-ignore
import { postApiUsersPostsManualPosts } from '@/plugins/api'
//@ts-ignore
import SelectedCheckboxSiteTable from '@/components/molecules/SelectedCheckboxSiteTable.vue'
//@ts-ignore
import SubmitButton from '@/components/atoms/SubmitButton.vue'

export default Vue.extend({
  components: {
    SelectedCheckboxSiteTable,
    SubmitButton
  },
  data: function() {
    return {
      selected: [] as number[]
    }
  },
  methods: {
    updateSelected: function(ids: number[]) {
      this.selected = ids
    },
    submit: function() {
      if (this.selected.length === 0) {
        this.$toasted.error('対象サイトが選択されていません')
        return
      }
      // TODO
      postApiUsersPostsManualPosts({
        attributes: {
          ids: this.selected
        }
      })
        .then((response: any) => {
          this.$toasted.success('実行しました')
          this.$store.commit({
            type: 'posts/changeStatus',
            ids: this.selected,
            status: '実行中'
          })
        })
        .catch((error: any) => {
          this.$toasted.error('エラーが発生しました')
          this.$store.commit({
            type: 'posts/changeStatus',
            ids: this.selected,
            status: '失敗'
          })
        })
    }
  }
})
</script>
