module.exports = {
  env: {
    browser: true,
    node: true,
    jest: true,
    es6: true
  },
  root: true,
  parserOptions: {
    parser: ['typescript-eslint-parser', 'babel-eslint', 'jest', 'es6', 'nuxt'],
    sourceType: 'module'
  },
  plugins: ['vue', 'import', 'typescript', 'jest', 'nuxt'],
  settings: {
    'import/resolver': {
      node: {
        extensions: ['.js', '.jsx', '.ts', '.tsx', '.vue']
      },
      alias: [['~', __dirname], ['@', __dirname]]
    },
    'import/core-modules': ['vue']
  },
  extends: ['eslint:recommended', 'typescript', 'airbnb-base', 'plugin:vue/recommended', '@nuxtjs']
}
