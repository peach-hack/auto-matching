import 'moment/locale/ja'
import moment from 'moment'

moment.locale('ja')
export default ({ app }, inject) => {
  inject('moment', args => moment(args))
}
