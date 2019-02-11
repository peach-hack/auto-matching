<template lang="pug">
header.app-header.navbar
  button.navbar-toggler.mobile-sidebar-toggler.d-lg-none(type="button" @click="mobileSidebarToggle") &#9776;
  b-link.navbar-brand(:to="{ name: 'index' }")
</template>

<script>
export default {
  name: 'Header',
  methods: {
    asideToggle(e) {
      e.preventDefault()
      document.getElementById('app').classList.toggle('aside-menu-hidden')
    },
    mobileSidebarToggle(e) {
      e.preventDefault()
      document.getElementById('app').classList.toggle('sidebar-mobile-show')
    },
    sidebarMinimize(e) {
      e.preventDefault()
      document.getElementById('app').classList.toggle('sidebar-minimized')
    },
    sidebarToggle(e) {
      e.preventDefault()
      document.getElementById('app').classList.toggle('sidebar-hidden')
    }
  }
}
</script>
