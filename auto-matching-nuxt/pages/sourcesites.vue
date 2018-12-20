<template>
  <b-card>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">サイト名</th>
          <th scope="col">LoginID</th>
          <th scope="col">Password</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="site in sites" :key="site.id">
          <th scope="row">{{ site.attributes.id }}</th>
          <td>{{ site.attributes.name }}</td>
          <td>{{ site.attributes.login_user }}</td>
          <td>{{ site.attributes.login_password }}</td>
        </tr>
      </tbody>
    </table>
  </b-card>
</template>

<script lang="ts">
import { Vue, Component } from 'vue-property-decorator'
import axios from 'axios'

@Component
export default class Sites extends Vue {
  sites: string[] = []

  async mounted(): Promise<void> {
    axios.defaults.baseURL = 'http://localhost:5000'
    process.env.NODE_TLS_REJECT_UNAUTHORIZED = '0'
    await this.getApiUsersSourceSites()
  }

  async getApiUsersSourceSites(): Promise<void> {
    await axios.get('api/users/source-sites').then(response => {
      response.data.data.map((site: any) => this.sites.push(site))
    })
  }
}
</script>
