<template lang="pug">
form(@submit.prevent="submit")
  .form-group
    selected-checkbox-site-table(@update:selected="selected = $event" :histories="$state.posts.histories")
  .form-group
    .form-check
      input.form-check-input(type="checkbox" v-model="debug")#debugCheck
      label.form-check-label(for="debugCheck")
        | Dry Run Mode
  .form-group        
    submit-button
</template>

<script lang="ts">
import Vue from 'vue'
//@ts-ignore
import { postApiUsersPostsManualPosts } from '@/plugins/api'
//@ts-ignore
import SubmitButton from '@/components/atoms/SubmitButton.vue'
//@ts-ignore
import SelectedCheckboxSiteTable from '@/components/molecules/SelectedCheckboxSiteTable.vue'

export default Vue.extend({
  components: {
    SubmitButton,
    SelectedCheckboxSiteTable
  },
  data: function() {
    return {
      selected: [] as number[],
      debug: false as boolean
    }
  },
  methods: {
    submit: function() {
      if (this.selected.length === 0) {
        this.$toasted.error('対象サイトが選択されていません')
        return
      }
      postApiUsersPostsManualPosts({
        attributes: {
          ids: this.selected,
          debug: this.debug
        }
      })
        .then(() => {
          this.$toasted.success('実行しました')
          this.$store.commit({
            type: 'posts/changeStatus',
            ids: this.selected,
            status: '実行中'
          })
        })
        .catch(() => {
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
