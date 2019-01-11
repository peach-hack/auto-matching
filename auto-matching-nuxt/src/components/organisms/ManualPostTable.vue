<template lang="pug">
form(@submit.prevent="manualPost")
  .form-group
    table.table
      thead
        tr
          th
            .form-check
              input.form-check-input.position-static(
                type="checkbox" @click="select" v-model="selectAll")
          th サイト名
          th 操作対象
          th 最終投稿時刻
          th 投稿ステータス
      tbody
        tr(v-for="history in $state.posts.histories" :key="history.id")
          th
            .form-check
              input.form-check-input.position-static(
                type="checkbox" :disabled="isCheckBoxDisabled(history)" 
                v-model="selected" :value="history.id")
          th(v-html="getLink(history)")
          th {{ getActivate(history) }}
          th {{ history.date | showDate }}
          th {{ history.status }}
  .form-group
    .form-check
      input.form-check-input(type="checkbox" v-model="debug")#debugCheck
      label.form-check-label(for="debugCheck")
        | Debug Run Mode
  .form-group        
    button(type="button submit").btn.btn-primary
      | Submit
</template>

<script lang="ts">
import Vue from 'vue'
//@ts-ignore
import History from '@/types/history'
//@ts-ignore
import { postApiUsersPostsManualPosts } from '@/plugins/api'
//@ts-ignore
import DateUtil from '@/components/mixins/DateUtil'

export default Vue.extend({
  mixins: [DateUtil],
  data: function() {
    return {
      selected: [] as number[],
      selectAll: false as boolean,
      debug: false as boolean
    }
  },
  methods: {
    select: function() {
      this.selected = []

      if (!this.selectAll) {
        this.getHistories().forEach((history: History) => {
          if (history.activateFlag) {
            this.selected.push(this.getHistory(history.id).id)
          }
        })
      }
    },
    getLink: function(history: History): string {
      return `<a href=${history.url} target="_blank">${history.name}</a>`
    },
    getActivate: function(history: History): string {
      return history.activateFlag ? '有効' : '無効'
    },
    isCheckBoxDisabled: function(history: History): boolean {
      return !history.activateFlag
    },
    getHistories: function(): History[] {
      return this.$store.state.posts.histories
    },
    getHistory: function(id: number): History {
      return this.$store.state.posts.histories[id - 1]
    },
    manualPost: function() {
      if (this.selected.length === 0) {
        this.$toasted.error('投稿先が選択されていません')
        return
      }
      postApiUsersPostsManualPosts({
        attributes: {
          ids: this.selected,
          debug: this.debug
        }
      })
        .then((response: any) => {
          this.$toasted.success('投稿しました')
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
