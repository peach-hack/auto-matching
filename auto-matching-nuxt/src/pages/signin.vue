<template lang="pug">
.container
  .row
    .col-md-4.offset-md-4
      h2.text-center サインイン
      h5.text-center
        nuxt-link(to="/signup")
          | アカウント登録はお済みですか？
      form(@submit.prevent="signIn" autocomplete="off")
        .form-group
          input(
            v-model.trim="username"
            placeholder="Username"
            required).form-control
        .form-group
          input(
            v-model.trim="password"
            placeholder="Password"
            type="password"
            required).form-control
        button(type="submit").btn.btn-primary.btn-block
          | サインイン
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
    signIn() {
      this.$store
        .dispatch('session/signIn', {
          username: this.username,
          password: this.password
        })
        .then(() => {
          this.$router.replace(this.$route.query.redirect || '/')
        })
    }
  }
}
</script>
