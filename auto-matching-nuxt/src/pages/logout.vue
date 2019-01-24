<template>
  <p>Signing out...</p>
</template>

<script>
export default {
  mounted() {
    this.$auth0.unsetToken()
    this.$router.replace('/')
  }
}
</script>
