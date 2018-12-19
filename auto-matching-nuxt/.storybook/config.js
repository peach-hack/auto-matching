import { configure } from '@storybook/vue'

// グローバルのCSSを追加
// import '../assets/scss/style.scss';

// Nuxtのプラグインを追加
const plugins = require.context('../plugins', true, /\.ts$/);
plugins.keys().forEach(plugins);

// Storyを追加
// const req = require.context('../stories', true, /\.stor(y|ies)\.(tsx?|jsx?)$/);
const req = require.context('../stories');

function loadStories() {
  req.keys().forEach(filename => req(filename));
}

configure(loadStories, module);
