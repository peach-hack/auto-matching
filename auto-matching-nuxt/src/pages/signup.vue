<template lang="pug">
.container
  .row
    .col-md-4.offset-md-4
      h2.text-center サインアップ
      h5.text-center
        nuxt-link(to="/signin")
          | アカウントはお持ちですか？
      form(@submit.prevent="signUp")
        .form-group
          input(
            v-model.trim="username"
            placeholder="Username"
            required).form-control
        .form-group
          input(
            v-model.trim="password"
            type="password"
            placeholder="Password"
            required).form-control
        button(type="submit").btn.btn-primary.btn-block
          | サインアップ
</template>

<script>
export default {
  data() {
    return {
      username: '',
      password: ''
    }
  },
  methods: {
    signUp() {
      this.$store
        .dispatch('session/signUp', {
          username: this.username,
          password: this.password
        })
        .then(() => {
          this.errors = {}
        })
    }
  }
}
</script>
