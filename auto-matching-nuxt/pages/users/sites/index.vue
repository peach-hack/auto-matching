<template>
  <div>
    <h2>サイト一覧</h2>
    <div v-for="site in sites">
      <div slot="header">
        <span>{{site.name}}</span>
      </div>
      <div >
        <p>{{site.url}}</p>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { Vue, Component } from 'vue-property-decorator';
import axios from 'axios';

@Component
export default class Reviews extends Vue {
    sites: string[] = [];

    async mounted(): Promise<void> {
        axios.defaults.baseURL = 'http://localhost:5000';
        process.env.NODE_TLS_REJECT_UNAUTHORIZED = '0';
        await this.fetchAquariumReviews();
    }

    async fetchAquariumReviews(): Promise<void> {
        await axios.get(`api/users/source-sites`).then((response) => {
            console.log(response);
            response.data.map((site: any) => {
                this.sites.push(site);
            })
        })
    }
}
</script>
