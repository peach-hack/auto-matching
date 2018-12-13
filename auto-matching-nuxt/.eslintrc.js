module.exports = {
  env: {
    "jest/globals": true
  },
  plugins: ["jest"],
  extends: ["airbnb-base", "plugin:vue/recommended"],
  settings: {
    "import/resolver": {
      node: {
        extensions: [".js", ".jsx", ".ts", ".tsx", ".vue"]
      }
    }
  },
  root: true,
  parser: "vue-eslint-parser",
  parserOptions: {
    parser: "typescript-eslint-parser"
  },
  rules: {
    "no-console": 0,
    "no-unused-vars": 0,
    "class-methods-use-this": 0,
    "vue/require-default-prop": 0
  }
};
