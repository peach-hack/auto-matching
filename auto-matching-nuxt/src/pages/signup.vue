<template>
  <div class="container">
    <div class="row">
      <div class="col-md-4 offset-md-4">
        <h2 class="text-center">Sign Up</h2>
        <h5 class="text-center">
          <router-link to="/signin">
            Have an account?
          </router-link>
        </h5>
        <Errors :errors="errors" />
        <form @submit.prevent="signUp">
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
              type="password"
              placeholder="Password"
              required
            />
          </div>
          <button type="submit" class="btn btn-info btn-block">
            Sign Up
          </button>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import Errors from '@/components/Errors'

export default {
  components: { Errors },
  data() {
    return {
      username: '',
      password: '',
      errors: {}
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
        .catch(errors => {
          this.errors = errors
        })
    }
  }
}
</script>

<style scoped lang="scss">
form {
  margin-top: 1rem;
}
</style>
