<template lang="pug">
form(@submit.prevent="submit")
  table.table.form-group
    thead
      tr
        th Id 
        th サイト名
        th 定期投稿対象
        th 定期監視対象
    tbody
      tr(v-for="site in sites" :key="site.id")
        td {{ site.id }}
        td {{ site.name }}
        td 
          input.form-check-input.position-static(type="checkbox" v-model="info.watch.sites[site.id-1]" :disabled="!info.watch.sites[site.id-1]")
        td 
          input.form-check-input.position-static(type="checkbox" v-model="info.watch.sites[site.id-1]" :disabled="!info.watch.sites[site.id-1]")
  .form-group
    label(for="cronInput1") 定期投稿スケジュール
    input(type="text" v-model="info.posts.cron").form-control#cornInput1
  .form-group
    label(for="cronInput2") 定期監視スケジュール
    input(type="text" v-model="info.watch.cron").form-control#cornInput2
  .form-grpup
    submit-button
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import SubmitButton from '@/components/atoms/SubmitButton.vue'

//@ts-ignore
import postApiUsersAutoSchedulerURL from '@/plugins/api'

export default Vue.extend({
  components: {
    SubmitButton
  },
  data: function() {
    return {
      info: {
        posts: {
          sites: [false, true, true, true, false, false],
          cron: ''
        },
        watch: {
          sites: [false, true, true, true, false, false],
          cron: ''
        }
      },
      sites: [
        {
          id: 1,
          name: 'ハッピーメール'
        },
        {
          id: 2,
          name: 'ワクワクメール'
        },
        {
          id: 3,
          name: 'PCMAX'
        },
        {
          id: 4,
          name: 'イクヨクルヨ'
        },
        {
          id: 5,
          name: 'ミントC!Jメール'
        },
        {
          id: 6,
          name: 'メルパラ'
        }
      ]
    }
  },
  methods: {
    submit: function() {
      const data = {
        id: 1,
        postSites: this.info.posts.sites,
        watchSites: this.info.watch.sites,
        postCron: this.info.posts.cron,
        watchCron: this.info.watch.cron
      }
      postApiUsersAutoSchedulerURL({
        id: 1,
        attributes: data
      })
        .then(() => {
          this.$toasted.success('更新しました')
        })
        .catch(() => {
          this.$toasted.error('エラーが発生しました')
        })
    }
  }
})
</script>
