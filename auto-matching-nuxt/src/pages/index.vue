<template lang="pug">
styled-container
  div
    logo
    styled-title
      | Auto Matching
    styled-subtitle
      | Integrated Deai Engine
    div
      //- .content(v-if="loggedIn()")
      //-   nuxt-link(to="/logout")
      //-     button(type="button").btn.btn-primary Logout
      //- .content(v-if="!loggedIn()")
      //-   nuxt-link(to="/login")
      //-     button(type="button").btn.btn-primary Login
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
  }
}
</script>
