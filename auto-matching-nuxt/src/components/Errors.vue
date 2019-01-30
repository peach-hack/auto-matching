<template>
  <div id="error-messages" v-if="hasErrors()">
    <ul>
      <li v-for="(value, key) in errors" :key="key">
        <strong>{{ key }}</strong>
        <span v-for="(error, index) in value" :key="index">
          {{ error }}
        </span>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  props: {
    errors: {
      type: Object,
      required: true
    }
  },
  methods: {
    hasErrors() {
      return Object.keys(this.errors).length > 0
    }
  }
}
</script>

<style scoped lang="scss">
#error-messages {
  color: red;
  display: flex;
  justify-content: center;
}
</style>
