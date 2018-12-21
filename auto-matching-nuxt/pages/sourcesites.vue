<template>
  <b-card>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">サイト名</th>
          <th scope="col">サイトURL</th>
          <th scope="col">ログインID</th>
          <th scope="col">ログインパスワード</th>
          <th scope="col">操作対象</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="site in sites" :key="site.id">
          <th scope="row">{{ site.attributes.id }}</th>
          <td>{{ site.attributes.name }}</td>
          <td>{{ site.attributes.url }}</td>
          <td>{{ site.attributes.login_user }}</td>
          <td>{{ site.attributes.login_password }}</td>
          <td>{{ site.attributes.activate_flag }}</td>
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
