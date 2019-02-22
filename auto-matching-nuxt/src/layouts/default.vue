<template lang="pug">
#app.app.header-fixed.sidebar-fixed.aside-menu-fixed.aside-menu-hidden
  app-header
    b-link.navbar-brand(:to="{ name: 'index' }")
  .app-body
    app-sidebar
      sidebar-header
      sidebar-form
      sidebar-nav(:nav-items="nav")
      sidebar-footer
      sidebar-minimizer
    main.main
      pulse-loader(:loading="$state.common.isLoading" style="position:fixed;top:50%;left:50%")
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
  Sidebar as AppSidebar
} from '@coreui/vue'
import PulseLoader from 'vue-spinner/src/PulseLoader.vue'
import nav from '../components/_nav'
import { Breadcrumb, Footer as AppFooter } from '../components'
import AppHeader from '../components/organisms/Header.vue'

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
    Breadcrumb,
    PulseLoader
  },
  data() {
    return {
      nav: nav.items
    }
  }
}
</script>
