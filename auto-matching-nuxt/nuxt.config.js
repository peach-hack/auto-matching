const extendConfig = require('./webpack.config.extend')

module.exports = {
  mode: 'spa',
  srcDir: 'src/',

  /*
   ** Headers of the page
   */
  head: {
    title: 'Auto Matching',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: 'Dating meets Tech' }
    ],
    link: [{ rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }]
  },

  /*
   ** Customize the progress bar color
   */
  loading: { color: '#42A5CC' },

  env: {
    baseUrl: process.env.BASE_URL || 'http://localhost:5000'
  },

  /**
   * Import CSS
   */
  css: [
    /* Import Font Awesome Icons Set */
    './node_modules/flag-icon-css/css/flag-icon.min.css',
    /* Import Font Awesome Icons Set */
    './node_modules/font-awesome/css/font-awesome.min.css',
    /* Import Simple Line Icons Set */
    './node_modules/simple-line-icons/css/simple-line-icons.css',
    /* Import Bootstrap Vue Styles */
    './node_modules/bootstrap-vue/dist/bootstrap-vue.css',
    /* Import Core SCSS */
    { src: './src/assets/scss/style.scss', lang: 'scss' }
  ],

  /*
   ** Plugins to load before mounting the App
   */
  plugins: [{ src: '@/plugins/i18n.js' }],

  /*
   ** Nuxt.js modules
   */
  modules: [
    // Doc: https://github.com/nuxt-community/axios-module#usage
    '@nuxtjs/axios',
    // Doc: https://github.com/bootstrap-vue/bootstrap-vue
    ['bootstrap-vue/nuxt', { css: false }]
  ],
  /*
   ** Axios module configuration
   */
  axios: {
    // See https://github.com/nuxt-community/axios-module#options
  },

  /*
   ** Build configuration
   */
  build: {
    /*
     ** You can extend webpack config here
     */
    extend(config) {
      'use strict'

      extendConfig(config)
    },
    babel: {
      presets: [
        [
          '@babel/preset-env',
          {
            targets: {
              node: 'current'
            }
          }
        ]
      ],
      plugins: ['@babel/plugin-syntax-dynamic-import']
    }
  },

  /*
   ** Extensions
   */
  extensions: ['js', 'ts']
}
