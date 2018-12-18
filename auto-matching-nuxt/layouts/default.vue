<template>
  <div class="app">
    <app-header />
    <div class="app-body">
      <app-sidebar />
      <main class="main">
        <div class="container-fluid"><nuxt /></div>
      </main>
    </div>
    <app-footer />
  </div>
</template>

<script>
  import { Header as AppHeader, Sidebar as AppSidebar, Footer as AppFooter} from '@coreui/vue'

export default {
  name: 'Default',
  components: {
    AppHeader,
    AppSidebar,
    AppFooter
  }
}
</script>
