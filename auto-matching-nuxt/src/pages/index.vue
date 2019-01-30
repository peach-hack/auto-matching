<template lang="pug">
section
  div
    logo
    h1
      | Auto Matching
    h2
      | Integrated Deai Engine
  div(v-if="isAuthenticated")
    li.nav-item
      a(@click="signOut")
        | Sign Out
    li.nav-item.user
      i.far.fa-user {{ username }}
  div(v-else)
    li.nav-item
      nuxt-link(to="/signin")
        | サインイン
    li.nav-item
      nuxt-link(to="/signup")
        | サインアップ
</template>

<script lang="ts">
import Vue from 'vue'
import styled from 'vue-styled-components'
//@ts-ignore
import Logo from '@/components/Logo.vue'

// const StyledContainer = styled.section`
//   min-height: 100vh;
//   display: flex;
//   justify-content: center;
//   align-items: center;
//   text-align: center;
// `

// const StyledTitle = styled.h1`
//   font-family: 'Quicksand', 'Source Sans Pro', -apple-system, BlinkMacSystemFont,
//     'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
//   display: block;
//   font-weight: 300;
//   font-size: 100px;
//   color: #35495e;
//   letter-spacing: 1px;
// `

// const StyledSubtitle = styled.h2`
//   font-weight: 300;
//   font-size: 42px;
//   color: #526488;
//   word-spacing: 5px;
//   padding-bottom: 15px;
// `

export default Vue.extend({
  components: {
    Logo
    // StyledContainer
    // StyledTitle,
    // StyledSubtitle
  },
  computed: {
    isAuthenticated(): boolean {
      return !!this.$store.state.session.user
    },
    username(): string {
      return this.$store.state.session.user.username
    }
  },
  methods: {
    signOut: function() {
      this.$store.dispatch('session/signOut').then(() => {
        this.$router.push('signin')
      })
    }
  }
})
</script>
