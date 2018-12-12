<template>
  <div id="app">
    <HelloVue
      val="Vue"
      @handle-click="handleClickButton($event)"
    />
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import HelloVue from '../components/HelloVue.vue';
@Component({
  components: {
    HelloVue,
  },
})
export default class App extends Vue {
  handleClickButton($event: string) {
    console.log($event);
  }
}
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
