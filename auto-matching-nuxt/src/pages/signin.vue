<template>
  <div class="container">
    <div class="row">
      <div class="col-md-4 offset-md-4">
        <h2 class="text-center">Sign In</h2>
        <h5 class="text-center">
          <router-link to="/signup">
            Need an account?
          </router-link>
        </h5>
        <p v-if="$route.query.redirect" class="error text-center">
          You need to sign in first.
        </p>
        <p v-if="error" class="error">
          {{ error }}
        </p>
        <form @submit.prevent="signIn" autocomplete="off">
          <div class="form-group">
            <input
              v-model.trim="username"
              class="form-control"
              placeholder="Username"
              required
            />
          </div>
          <div class="form-group">
            <input
              v-model.trim="password"
              class="form-control"
              placeholder="Password"
              type="password"
              required
            />
          </div>
          <button type="submit" class="btn btn-info btn-block">
            Sign In
          </button>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      username: '',
      password: '',
      error: ''
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
        .catch(error => {
          this.error = error
        })
    }
  }
}
</script>

<style scoped lang="scss">
form {
  margin-top: 1rem;
}
.error {
  color: red;
  text-align: center;
}
</style>
