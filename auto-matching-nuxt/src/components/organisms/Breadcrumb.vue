<template lang="pug">
ol.breadcrumb
  li.breadcrumb-item
    h5.mb-0 {{ $t('main.route.' + $route.name) }}
</template>

<script>
export default {
  name: 'Breadcrumb'
}
</script>
