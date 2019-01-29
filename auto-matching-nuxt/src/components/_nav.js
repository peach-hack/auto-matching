// ref: https://github.com/coreui/coreui-free-vue-admin-template/blob/master/src/_nav.js

export default {
  items: [
    /* 
    {
      name: 'Dashboard',
      url: '/dashboard',
      icon: 'icon-speedometer'
    },
    */
    {
      title: true,
      name: '一括投稿',
      class: '',
      wrapper: {
        element: '',
        attributes: {}
      }
    },
    {
      name: 'テンプレート管理',
      url: '/posts/templates',
      icon: 'icon-star'
    },
    {
      name: 'マニュアル投稿',
      url: '/posts/manual',
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
      name: 'データベース検索',
      url: '/search/db',
      icon: 'icon-star'
    },
    {
      name: 'キーワード検索',
      url: '/search/keyword',
      icon: 'icon-star'
    },
    {
      name: 'リアルタイム検索',
      url: '/search/realtime',
      icon: 'icon-star'
    },
    {
      title: true,
      name: '定期実行',
      class: '',
      wrapper: {
        element: '',
        attributes: {}
      }
    },
    {
      name: '定期投稿設定',
      url: '/', // '/posts/auto',
      icon: 'icon-star'
    },
    {
      name: '定期監視設定',
      url: '/', // '/posts/auto',
      icon: 'icon-star'
    },
    {
      name: 'リアルタイム監視',
      url: '/', // '/search/polling',
      icon: 'icon-star'
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
    },
    {
      name: 'ログアウト',
      url: '/logout',
      icon: 'icon-star'
    }
  ]
}
