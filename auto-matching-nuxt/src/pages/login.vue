<template>
  <div id="show-auth" />
</template>

<script>
export default {
  mounted() {
    this.$auth0.showLock('show-auth')
  }
}
</script>

<style scoped>
#show-auth {
  margin-top: 20px;
}
</style>
