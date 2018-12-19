<template>
  <div class="app">
    <app-header fixed>Auto Matching</app-header>
    <div class="app-body">
      <app-sidebar fixed>
        <sidebar-header />
        <sidebar-form />
        <sidebar-nav :nav-items="nav" />
        <sidebar-footer />
        <sidebar-minimizer />
      </app-sidebar>
      <main class="main">
        <div class="container-fluid"><nuxt /></div>
      </main>
    </div>
    <app-footer />
  </div>
</template>

<script>
import {
  SidebarFooter,
  SidebarForm,
  SidebarHeader,
  SidebarMinimizer,
  SidebarNav,
  Header as AppHeader,
  Sidebar as AppSidebar
} from '@coreui/vue'
import nav from '../components/_nav'
import { Footer as AppFooter } from '../components'

export default {
  name: 'Full',
  components: {
    AppHeader,
    AppSidebar,
    SidebarHeader,
    SidebarForm,
    SidebarNav,
    SidebarFooter,
    SidebarMinimizer,
    AppFooter
  },
  data() {
    return {
      nav: nav.items
    }
  }
}
</script>
