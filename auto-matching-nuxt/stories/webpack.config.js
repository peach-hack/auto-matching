// webpack.config.extend.js
const path = require('path')

module.exports = config => {
  'use strict'

  config.resolve.extensions.push('.ts', '.js', '.vue', '.css', '.html')

  const tsLoader = {
    loader: 'ts-loader',
    options: {
      appendTsSuffixTo: [/\.vue$/],
      context: __dirname,
      configFile: 'tsconfig.json'
    }
  }


  // Add TypeScript loader
  config.module.rules.push(
    Object.assign(
      {
        test: /((\.jsx?)|(\.tsx?))$/,
        exclude: /node_modules/
      },
      tsLoader
    )
  )

  // Add TypeScript loader for Vue SFC compile process
  for (const rule of config.module.rules) {
    if (rule.loader === 'vue-loader') {
      rule.options.loaders = {
        ...rule.options.loaders,
        ts: tsLoader
      }
    }
  }

  return config
}


