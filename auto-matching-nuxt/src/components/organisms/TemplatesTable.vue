<template lang="pug">
table.table
  thead
    tr
      th #
      th タイトル
      th 作成日時
      th 更新日時
      th 編集
      th 削除
  tbody
    tr(v-for="template in $state.posts.templates" :key="template.id")
      th {{ template.id }}
      th {{ template.title }}
      td {{ template.createdAt | showDate }}
      td {{ template.updatedAt | showDate }}
      td
        nuxt-link(:to="{ path: getEditPath(template), params: {id: template.id } }") 編集
      td 
       a(href="#" @click.prevent="deleteTemplate(template.id)") 削除
</template>

<script lang="ts">
import Vue from 'vue'
import moment from 'moment'
//@ts-ignore
import Template from '@types/template'
//@ts-ignore
import { deleteApiUsersPostsTemplatesById } from '@/plugins/api'

export default Vue.extend({
  filters: {
    showDate: function(value: string): string {
      const date = moment(value)
      return date.format('YYYY-MM-DD HH:mm')
    }
  },
  methods: {
    getEditPath(template: Template): string {
      return `/posts/templates/${template.id}`
    },
    deleteTemplate(id: Number) {
      deleteApiUsersPostsTemplatesById({
        id: id
      })
        .then((response: any) => {
          this.$toasted.success('削除しました')
        })
        .catch((error: any) => {
          this.$toasted.error('エラーが発生しました')
        })
    }
  }
})
</script>
