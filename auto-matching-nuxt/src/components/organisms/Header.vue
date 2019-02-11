<template>
  <header class="app-header navbar">
    <button
      class="navbar-toggler mobile-sidebar-toggler d-lg-none"
      type="button"
      @click="mobileSidebarToggle"
    >
      &#9776;
    </button>
    <b-link class="navbar-brand" :to="{ name: 'index' }"></b-link>
  </header>
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
