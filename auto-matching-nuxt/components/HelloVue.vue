<template>
  <div>
    <h1>Hello {{ value | convertUpperCase }}</h1>
    <input
      type="text"
      :value="inputValue"
      @input="handleInput($event)"
    >
    <button
      :disabled="isDisabled"
      @click="handleClick()"
    >
      button
    </button>
  </div>
</template>

<script lang="js">
import Vue from 'vue'

export default Vue.extend({
  name: 'HelloVue',
  filters: {
    convertUpperCase(value) {
      if (!value) {
        return null
      }
      return value.toUpperCase()
    }
  },
  props: {
    val: String
  },
  data() {
    return {
      value: this.val,
      inputValue: ''
    }
  },
  computed: {
    isDisabled() {
      return this.inputValue === ''
    }
  },
  methods: {
    handleInput($event) {
      this.inputValue = $event.target.value
    },
    handleClick() {
      if (this.inputValue === '') {
        return
      }
      this.value = this.inputValue
      this.inputValue = ''
      this.$emit('handle-click', this.value)
    }
  }
})
</script>
