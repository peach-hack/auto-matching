import moment from 'moment'

const DateUtil = {
  filters: {
    showDate: function (value: string): string {
      if (value === null) {
        return "-"
      } else {
        const date = moment(value)
        return date.format('YYYY-MM-DD HH:mm')
      }
    }
  },
}

export default DateUtil
