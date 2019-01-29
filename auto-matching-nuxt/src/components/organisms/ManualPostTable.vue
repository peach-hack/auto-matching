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
          th 最終実行時刻
          th 実行ステータス
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
        | Dry Run Mode
  .form-group        
    submit-button
</template>

<script lang="ts">
import Vue from 'vue'
//@ts-ignore
import History from '@/types/history'
//@ts-ignore
import { postApiUsersPostsManualPosts } from '@/plugins/api'
//@ts-ignore
import DateUtil from '@/components/mixins/DateUtil'
//@ts-ignore
import SubmitButton from '@/components/atoms/SubmitButton.vue'

import ActionCable, { Channel } from 'actioncable'
import { AxiosError, AxiosResponse } from 'axios'

export default Vue.extend({
  components: {
    SubmitButton
  },
  mixins: [DateUtil],
  data: function() {
    return {
      selected: [] as number[],
      selectAll: false as boolean,
      debug: false as boolean,
      statusChannel: {} as Channel
    }
  },
  created() {
    const cable = ActionCable.createConsumer(`${process.env.wsBaseUrl}/cable`)
    this.statusChannel = cable.subscriptions.create('ManualPostChannel', {
      // サブスクリプションがサーバー側で利用可能になると呼び出される
      connected: function() {},
      // WebSocket接続が閉じると呼び出される
      disconnected: function() {},
      // サブスクリプションがサーバーに拒否されると呼び出される
      rejected: function() {},
      received: (data: any) => {
        this.$store.commit({
          type: 'posts/changeStatus',
          ids: data['ids'],
          status: data['status']
        })
      }
    })
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
        this.$toasted.error('対象サイトが選択されていません')
        return
      }
      postApiUsersPostsManualPosts({
        attributes: {
          ids: this.selected,
          debug: this.debug
        }
      })
        .then((response: AxiosResponse) => {
          this.$toasted.success('実行しました')
          this.$store.commit({
            type: 'posts/changeStatus',
            ids: this.selected,
            status: '実行中'
          })
        })
        .catch((error: AxiosError) => {
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
