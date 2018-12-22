// ref: https://github.com/coreui/coreui-free-vue-admin-template/blob/master/src/_nav.js

export default {
  items: [
    {
      name: 'Dashboard',
      url: '/dashboard',
      icon: 'icon-speedometer'
    },
    {
      title: true,
      name: '自動投稿',
      class: '',
      wrapper: {
        element: '',
        attributes: {}
      }
    },
    {
      name: 'テンプレート管理',
      url: '',
      icon: 'icon-star'
    },
    {
      name: '定期実行設定',
      url: '',
      icon: 'icon-star'
    },
    {
      name: 'マニュアル投稿',
      url: '',
      icon: 'icon-star'
    },
    {
      title: true,
      name: '横断検索',
      class: '',
      wrapper: {
        element: '',
        attributes: {}
      }
    },
    {
      title: true,
      name: 'その他',
      class: '',
      wrapper: {
        element: '',
        attributes: {}
      }
    },
    {
      name: 'サイト管理',
      url: '/sites',
      icon: 'icon-star'
    }
  ]
}
