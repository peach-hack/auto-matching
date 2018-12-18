<template>
  <div class="app">
    <Header />
    <div class="app-body">
      <Sidebar />
      <main class="main">
        <div class="container-fluid"><nuxt /></div>
      </main>
    </div>
    <Footer />
  </div>
</template>

<script>
import { Header, Sidebar, Footer } from '@coreui/vue'

export default {
  name: 'Default',
  components: {
    Header,
    Sidebar,
    Footer
  }
}
</script>
