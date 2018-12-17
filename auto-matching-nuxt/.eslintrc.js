module.exports = {
  env: {
    "jest/globals": true
  },
  plugins: ["jest", "vue", "import", "prettier"],
  extends: [
    "airbnb-base",
    "plugin:vue/recommended",
    "plugin:prettier/recommended"
  ],
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
    "vue/require-default-prop": 0,
    "vue/max-attributes-per-line": 0,
    "vue/html-closing-bracket-spacing": 0,
    "vue/html-self-closing": 0,
    "vue/singleline-html-element-content-newline": 0,
    "vue/component-name-in-template-casing": 0,
    "no-restricted-syntax": 0
  }
};
