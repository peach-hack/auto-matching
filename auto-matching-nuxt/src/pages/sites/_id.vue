<template lang="pug">
div
  h2 {{ site.name }}
  form
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
            input.form-check-input(type="radio" name="activation" checked)#activate
            label.form-check-label(for="activate")
              | 有効
          .form-check
            input.form-check-input(type="radio" name="activation")#deactivate
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

export default Vue.extend({
  data: function() {
    return {
      site: this.$store.getters.site(this.$route.params.id - 1)
    }
  }
} as any)
</script>
