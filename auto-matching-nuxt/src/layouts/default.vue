<template lang="pug">
.app
  app-header(fixed)
    b-link.navbar-brand(:to="{ name: 'index' }")
  .app-body
    app-sidebar(fixed)
      sidebar-header
      sidebar-form
      sidebar-nav(:nav-items="nav")
      sidebar-footer
      sidebar-minimizer
    main.main
      breadcrumb(:list="[]")
      .container-fluid
        b-card
          nuxt
  app-footer
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
import { Breadcrumb, Footer as AppFooter } from '../components'

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
    AppFooter,
    Breadcrumb
  },
  data() {
    return {
      nav: nav.items
    }
  }
}
</script>
