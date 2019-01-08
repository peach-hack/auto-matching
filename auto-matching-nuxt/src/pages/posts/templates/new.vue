<template lang="pug">
new-template-form
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import Template from '@/types/template'
//@ts-ignore
import NewTemplateForm from '@/components/organisms/NewTemplateForm.vue'

export default Vue.extend({
  components: {
    NewTemplateForm
  }
})
</script>
