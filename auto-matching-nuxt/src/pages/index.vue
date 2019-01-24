<template lang="pug">
styled-container
  div
    logo
    styled-title
      | Auto Matching
    styled-subtitle
      | Integrated Deai Engine
    <div>
      <div v-if="loggedIn()" class="content">
        <h2>ログイン中です</h2>
          <nuxt-link class="button is-warning" to="/logout">
            <span class="icon"><i class="fa fa-sign-out"></i></span>
            <span>Logout</span>
          </nuxt-link>
      </div>
      <div v-if="!loggedIn()" class="content"> <h2>ログインしてください</h2>
        <nuxt-link class="button is-primary" to="/login">
          <span class="icon"><i class="fa fa-sign-in"></i></span>
          <span>Login</span>
        </nuxt-link>
      </div>
      <button class="button is-primary" @click="ping">Ping</button>
      <button class="button is-danger" @click="securedPing">Secured Ping</button>
    </div>
</template>

<script>
import styled from 'vue-styled-components'
import Logo from '@/components/Logo.vue'

const StyledContainer = styled.section`
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
`

const StyledTitle = styled.h1`
  font-family: 'Quicksand', 'Source Sans Pro', -apple-system, BlinkMacSystemFont,
    'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  display: block;
  font-weight: 300;
  font-size: 100px;
  color: #35495e;
  letter-spacing: 1px;
`

const StyledSubtitle = styled.h2`
  font-weight: 300;
  font-size: 42px;
  color: #526488;
  word-spacing: 5px;
  padding-bottom: 15px;
`

export default {
  components: {
    Logo,
    StyledContainer,
    StyledTitle,
    StyledSubtitle
  },
  methods: {
    loggedIn() {
      return this.$auth0.isAuthenticated()
    },
    async ping() {
      const ret = await this.$axios.$get('/api/v1/ping')
      console.log(ret)
    },
    async securedPing() {
      const ret = await this.$axios.$get('/api/v1/secured_ping', {
        headers: { Authorization: 'Bearer ' + this.$auth0.getIdToken() }
      })
      console.log(ret)
    }
  }
}
</script>
