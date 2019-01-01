<template lang="pug">
div
  h2 {{ site.name }}
  form(@submit.prevent="updateSite")
    .form-group
      label ログインID
      input.form-control(type="text" placeholder="LoginId" v-model="site.loginUser")
    .form-group
      label ログインパスワード
      input.form-control(type="text" placeholder="Password" v-model="site.loginPassword")
    fieldset.form-group
      .row
        legend.col-form-label.col-sm-2.pt-0
          | 操作対象
        .col-sm-10
          .form-check
            input.form-check-input(type="radio" name="activation" value="true" v-model="site.activateFlag")#activate
            label.form-check-label(for="activate")
              | 有効
          .form-check
            input.form-check-input(type="radio" name="activation" value="false" v-model="site.activateFlag")#deactivate
            label.form-check-label(for="deactivate")
              | 無効
    button(type="button submit").btn.btn-primary
      | Submit
    nuxt-link(to="/sites")
      button(type="button").btn.btn-light
        | Cancel
</template>

<script lang="ts">
const Api = require('@/plugins/api')

export default {
  methods: {
    site: function({ route }: { route: any }, { store }: { store: any }): any {
      return store.getters.site[this.siteId(route, store) - 1]
    },
    siteId: function(
      { route }: { route: any },
      { store }: { store: any }
    ): number {
      return parseInt(route.params.id)
    },
    updateSite({ toast }: { toast: any }, { route }: { route: any }) {
      Api.putApiUsersSourceSitesById({
        id: this.siteId,
        attributes: this.site
      })
        .then((response: any) => {
          route.push('/sites')
          toast.success('更新しました')
        })
        .catch((error: any) => {
          toast.error('エラーが発生しました')
        })
    }
  }
} as any
</script>
