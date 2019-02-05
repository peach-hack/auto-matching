<template lang="pug">
styled-container
  div
    logo
    styled-title
      | Auto Matching
    styled-subtitle
      | Integrated Deai Engine
    div(v-if="isAuthenticated")
      button(@click="signOut").btn.btn-primary
        | サインアウト 
    div(v-else)
      nuxt-link(to="/signin")
        button.btn.btn-primary
          | サインイン
</template>

<script>
import Vue from 'vue'
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
  computed: {
    isAuthenticated() {
      return !!this.$store.state.session.user
    },
    username() {
      return this.$store.state.session.user.username
    }
  },
  methods: {
    signOut: function() {
      this.$store.dispatch('session/signOut').then(() => {
        this.$router.push('/')
      })
    }
  }
}
</script>
