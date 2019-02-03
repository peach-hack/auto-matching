<template lang="pug">
div
  label
    | 掲示板投稿データ情報
  .row
    .col-sm-2
      .callout.callout-info.b-t-1.b-r-1.b-b-1
        small.text-muted 投稿データ数
        br
        strong.h4 {{ post.count }}
    .col-sm-3
      .callout.callout-danger.b-t-1.b-r-1.b-b-1
        small.text-muted 最も新しい投稿
        br
        strong.h5 {{ post.latest | showDate }}
    .col-sm-3
      .callout.callout-warning.b-t-1.b-r-1.b-b-1
        small.text-muted 最も古い投稿
        br
        strong.h5 {{ post.last | showDate }}
</template>

<script lang="ts">
import Vue from 'vue'
//@ts-ignore
import { getApiUsersSettingsPosts } from '@/plugins/api'
//@ts-ignore
import DateUtil from '@/components/mixins/DateUtil'

export default Vue.extend({
  mixins: [DateUtil],
  data: function() {
    return {
      post: {
        count: 0 as number,
        latest: {} as Date,
        last: {} as Date
      }
    }
  },
  async mounted() {
    const response = await getApiUsersSettingsPosts()
    this.post.count = response.data.count
    this.post.latest = response.data.latest
    this.post.last = response.data.last
  }
})
</script>
