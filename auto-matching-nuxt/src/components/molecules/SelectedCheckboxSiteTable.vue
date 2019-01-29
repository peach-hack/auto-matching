<template lang="pug">
table.table
  thead
    tr
      th
        .form-check
          input.form-check-input.position-static(
            type="checkbox" @click="checkAll" v-model="selectAll")
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
            :value="history.id" @change="check" v-model="selected")
      th(v-html="getLink(history)")
      th {{ getActivate(history) }}
      th {{ history.date | showDate }}
      th {{ history.status }}
</template>

<script lang="ts">
import Vue from 'vue'
//@ts-ignore
import History from '@/types/history'
import ActionCable from 'actioncable'
//@ts-ignore
import DateUtil from '@/components/mixins/DateUtil'

export default Vue.extend({
  mixins: [DateUtil],
  data: function() {
    return {
      selected: [] as number[],
      selectAll: false as boolean,
      statusChannel: null as any
    }
  },
  created() {
    const cable = ActionCable.createConsumer(`${process.env.wsBaseUrl}/cable`)
    this.statusChannel = cable.subscriptions.create('ManualPostChannel', {
      received: (data: any) => {
        this.$store.commit({
          type: 'posts/changeStatus',
          ids: data['ids'],
          status: data['status']
        })
      }
    } as any)
  },
  methods: {
    check: function() {
      console.log(this.selected)
      this.$emit('update:selected', this.selected)
    },
    checkAll: function() {
      this.selected = []

      if (!this.selectAll) {
        this.getHistories().forEach((history: History) => {
          if (history.activateFlag) {
            this.selected.push(this.getHistory(history.id).id)
          }
        })
      }
      this.$emit('update:selected', this.selected)
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
    }
  }
})
</script>
