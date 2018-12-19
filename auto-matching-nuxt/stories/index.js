import { storiesOf } from '@storybook/vue'

import Hello from '../components/HelloVue'

storiesOf('Hello', module).add('simple', () => ({
  components: { Hello },
  template: `<Hello>KEEP IT SIMPLE</Hello>`
}))
