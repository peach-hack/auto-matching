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
import { Header as AppHeader, Sidebar as AppSidebar } from '@coreui/vue'
import { Footer as AppFooter } from '../components'

export default {
  name: 'Full',
  components: {
    AppHeader,
    AppSidebar,
    AppFooter
  }
}
</script>
