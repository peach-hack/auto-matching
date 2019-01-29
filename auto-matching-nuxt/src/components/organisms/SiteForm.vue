<template lang="pug">
form(@submit.prevent="updateSite")
  .form-group
    label ログインID
    input.form-control(type="text" placeholder="LoginId" v-model="newLoginUser")
  .form-group
    label ログインパスワード
    input.form-control(type="text" placeholder="Password" v-model="newLoginPassword")
  fieldset.form-group
    .row
      legend.col-form-label.col-sm-2.pt-0
        | 操作対象
      .col-sm-10
        .form-check
          input.form-check-input(type="radio" name="activation" value="true" v-model="newActivateFlag")#activate
          label.form-check-label(for="activate")
            | 有効
        .form-check
          input.form-check-input(type="radio" name="activation" value="false" v-model="newActivateFlag")#deactivate
          label.form-check-label(for="deactivate")
            | 無効
  submit-button-group(path="/settings/sites")
</template>

<script lang="ts">
import Vue from 'vue'
//@ts-ignore
import SubmitButtonGroup from '@/components/molecules/SubmitButtonGroup.vue'
//@ts-ignore
import { putApiUsersSourceSitesById } from '@/plugins/api'
import { AxiosError, AxiosResponse } from 'axios'

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
  data() {
    return {
      newLoginUser: this.site.loginUser as string,
      newLoginPassword: this.site.loginPassword as string,
      newActivateFlag: this.site.activateFlag as boolean
    }
  },
  methods: {
    updateSite: function() {
      const data = {
        id: this.site.id,
        key: this.site.key,
        loginUser: this.newLoginUser,
        loginPassword: this.newLoginPassword,
        activateFlag: this.newActivateFlag
      }

      putApiUsersSourceSitesById({
        id: this.site.id,
        attributes: data
      })
        .then((response: AxiosResponse) => {
          this.$router.push('/settings/sites')
          this.$toasted.success('更新しました')
        })
        .catch((error: AxiosError) => {
          this.$toasted.error('エラーが発生しました')
        })
    }
  }
})
</script>
