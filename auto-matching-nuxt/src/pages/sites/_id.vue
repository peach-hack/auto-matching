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
import Vue from 'vue'

const Api = require('@/plugins/api')

export default Vue.extend({
  computed: {
    site: function(): any {
      return this.$store.getters.site(this.siteId - 1)
    },
    siteId: function(): number {
      return parseInt(this.$route.params.id)
    }
  },
  methods: {
    updateSite: function() {
      Api.putApiUsersSourceSitesById({
        id: this.siteId,
        attributes: this.site
      })
        .then((response: any) => {
          this.$router.push('/sites')

          this.$toasted.success('更新しました')
        })
        .catch((error: any) => {
          this.$toasted.error('エラーが発生しました')
        })
    }
  }
})
</script>
