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
      url: '/', // '/search/keyword',
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
      name: '定期実行設定',
<<<<<<< HEAD
      url: '/', // '/auto/scheduler',
=======
      url: '/auto/schedule',
>>>>>>> 71d43960e44dbdd869b31099112c286c2d4b724d
      icon: 'icon-star'
    },
    {
      name: 'Slack連携',
      url: '/auto/slack',
      icon: 'icon-star'
    },
    {
      title: true,
      name: '設定',
      class: '',
      wrapper: {
        element: '',
        attributes: {}
      }
    },
    {
      name: 'サイト設定',
      url: '/settings/sites',
      icon: 'icon-star'
    },
    {
      name: 'データベース設定',
      url: '/settings/db',
      icon: 'icon-star'
    },
    {
      name: 'サインアウト',
      url: '/signout',
      icon: 'icon-star'
    }
  ]
}
