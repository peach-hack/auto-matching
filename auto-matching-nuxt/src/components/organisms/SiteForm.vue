<template lang="pug">
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
  submit-button-group(path="/sites")
</template>

<script lang="ts">
import Vue from 'vue'
//@ts-ignore
import SubmitButtonGroup from '@/components/molecules/SubmitButtonGroup.vue'

//@ts-ignore
const Api = require('@/plugins/api')

export default Vue.extend({
  components: {
    SubmitButtonGroup
  },
  props: {
    site: {
      type: Object,
      required: true
    }
  },
  methods: {
    updateSite: function() {
      Api.putApiUsersSourceSitesById({
        id: this.site.id,
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
