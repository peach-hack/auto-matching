<template lang="pug">
template-form(:template="template")
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import Template from '@/types/template'
//@ts-ignore
import TemplateForm from '@/components/organisms/TemplateForm.vue'

const Api = require('@/plugins/api')

export default Vue.extend({
  components: {
    TemplateForm
  },
  computed: {
    template: function(): Template {
      const idx = parseInt(this.$route.params.id) - 1
      return this.$store.state.posts.templates[idx]
    }
  }
})
</script>
