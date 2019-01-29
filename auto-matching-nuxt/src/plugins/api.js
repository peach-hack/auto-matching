/* eslint-disable */
import axios from 'axios'
import qs from 'qs'
let domain = process.env.baseUrl
export const getDomain = () => {
  return domain
}
export const setDomain = ($domain) => {
  domain = $domain
}
export const request = (method, url, body, queryParameters, form, config) => {
  method = method.toLowerCase()
  let keys = Object.keys(queryParameters)
  let queryUrl = url
  if (keys.length > 0) {
    queryUrl = url + '?' + qs.stringify(queryParameters)
  }
  // let queryUrl = url+(keys.length > 0 ? '?' + (keys.map(key => key + '=' + encodeURIComponent(queryParameters[key])).join('&')) : '')
  if (body) {
    return axios[method](queryUrl, body, config)
  } else if (method === 'get') {
    return axios[method](queryUrl, {
      params: form
    }, config)
  } else {
    return axios[method](queryUrl, qs.stringify(form), config)
  }
}
/*==========================================================
 *                    API description in Markdown.
 ==========================================================*/
/**
 * テンプレート一覧
 * request: getApiUsersPostsTemplates
 * url: getApiUsersPostsTemplatesURL
 * method: getApiUsersPostsTemplates_TYPE
 * raw_url: getApiUsersPostsTemplates_RAW_URL
 */
export const getApiUsersPostsTemplates = function(parameters = {}) {
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  const config = parameters.$config
  let path = '/api/users/posts/templates'
  let body
  let queryParameters = {}
  let form = {}
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    });
  }
  return request('get', domain + path, body, queryParameters, form, config)
}
export const getApiUsersPostsTemplates_RAW_URL = function() {
  return '/api/users/posts/templates'
}
export const getApiUsersPostsTemplates_TYPE = function() {
  return 'get'
}
export const getApiUsersPostsTemplatesURL = function(parameters = {}) {
  let queryParameters = {}
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  let path = '/api/users/posts/templates'
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    })
  }
  let keys = Object.keys(queryParameters)
  return domain + path + (keys.length > 0 ? '?' + (keys.map(key => key + '=' + encodeURIComponent(queryParameters[key])).join('&')) : '')
}
/**
 * 投稿テンプレート投稿
 * request: postApiUsersPostsTemplates
 * url: postApiUsersPostsTemplatesURL
 * method: postApiUsersPostsTemplates_TYPE
 * raw_url: postApiUsersPostsTemplates_RAW_URL
 * @param attributes - テンプレート
 */
export const postApiUsersPostsTemplates = function(parameters = {}) {
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  const config = parameters.$config
  let path = '/api/users/posts/templates'
  let body
  let queryParameters = {}
  let form = {}
  if (parameters['attributes'] !== undefined) {
    body = parameters['attributes']
  }
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    });
  }
  return request('post', domain + path, body, queryParameters, form, config)
}
export const postApiUsersPostsTemplates_RAW_URL = function() {
  return '/api/users/posts/templates'
}
export const postApiUsersPostsTemplates_TYPE = function() {
  return 'post'
}
export const postApiUsersPostsTemplatesURL = function(parameters = {}) {
  let queryParameters = {}
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  let path = '/api/users/posts/templates'
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    })
  }
  let keys = Object.keys(queryParameters)
  return domain + path + (keys.length > 0 ? '?' + (keys.map(key => key + '=' + encodeURIComponent(queryParameters[key])).join('&')) : '')
}
/**
 * テンプレート更新
 * request: putApiUsersPostsTemplatesById
 * url: putApiUsersPostsTemplatesByIdURL
 * method: putApiUsersPostsTemplatesById_TYPE
 * raw_url: putApiUsersPostsTemplatesById_RAW_URL
 * @param id - 
 * @param attributes - テンプレート
 */
export const putApiUsersPostsTemplatesById = function(parameters = {}) {
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  const config = parameters.$config
  let path = '/api/users/posts/templates/{id}'
  let body
  let queryParameters = {}
  let form = {}
  path = path.replace('{id}', `${parameters['id']}`)
  if (parameters['id'] === undefined) {
    return Promise.reject(new Error('Missing required  parameter: id'))
  }
  if (parameters['attributes'] !== undefined) {
    body = parameters['attributes']
  }
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    });
  }
  return request('put', domain + path, body, queryParameters, form, config)
}
export const putApiUsersPostsTemplatesById_RAW_URL = function() {
  return '/api/users/posts/templates/{id}'
}
export const putApiUsersPostsTemplatesById_TYPE = function() {
  return 'put'
}
export const putApiUsersPostsTemplatesByIdURL = function(parameters = {}) {
  let queryParameters = {}
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  let path = '/api/users/posts/templates/{id}'
  path = path.replace('{id}', `${parameters['id']}`)
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    })
  }
  let keys = Object.keys(queryParameters)
  return domain + path + (keys.length > 0 ? '?' + (keys.map(key => key + '=' + encodeURIComponent(queryParameters[key])).join('&')) : '')
}
/**
 * テンプレート削除
 * request: deleteApiUsersPostsTemplatesById
 * url: deleteApiUsersPostsTemplatesByIdURL
 * method: deleteApiUsersPostsTemplatesById_TYPE
 * raw_url: deleteApiUsersPostsTemplatesById_RAW_URL
 * @param id - 
 */
export const deleteApiUsersPostsTemplatesById = function(parameters = {}) {
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  const config = parameters.$config
  let path = '/api/users/posts/templates/{id}'
  let body
  let queryParameters = {}
  let form = {}
  path = path.replace('{id}', `${parameters['id']}`)
  if (parameters['id'] === undefined) {
    return Promise.reject(new Error('Missing required  parameter: id'))
  }
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    });
  }
  return request('delete', domain + path, body, queryParameters, form, config)
}
export const deleteApiUsersPostsTemplatesById_RAW_URL = function() {
  return '/api/users/posts/templates/{id}'
}
export const deleteApiUsersPostsTemplatesById_TYPE = function() {
  return 'delete'
}
export const deleteApiUsersPostsTemplatesByIdURL = function(parameters = {}) {
  let queryParameters = {}
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  let path = '/api/users/posts/templates/{id}'
  path = path.replace('{id}', `${parameters['id']}`)
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    })
  }
  let keys = Object.keys(queryParameters)
  return domain + path + (keys.length > 0 ? '?' + (keys.map(key => key + '=' + encodeURIComponent(queryParameters[key])).join('&')) : '')
}
/**
 * 掲示板一括投稿履歴
 * request: getApiUsersPostsManualPosts
 * url: getApiUsersPostsManualPostsURL
 * method: getApiUsersPostsManualPosts_TYPE
 * raw_url: getApiUsersPostsManualPosts_RAW_URL
 */
export const getApiUsersPostsManualPosts = function(parameters = {}) {
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  const config = parameters.$config
  let path = '/api/users/posts/manual-posts'
  let body
  let queryParameters = {}
  let form = {}
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    });
  }
  return request('get', domain + path, body, queryParameters, form, config)
}
export const getApiUsersPostsManualPosts_RAW_URL = function() {
  return '/api/users/posts/manual-posts'
}
export const getApiUsersPostsManualPosts_TYPE = function() {
  return 'get'
}
export const getApiUsersPostsManualPostsURL = function(parameters = {}) {
  let queryParameters = {}
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  let path = '/api/users/posts/manual-posts'
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    })
  }
  let keys = Object.keys(queryParameters)
  return domain + path + (keys.length > 0 ? '?' + (keys.map(key => key + '=' + encodeURIComponent(queryParameters[key])).join('&')) : '')
}
/**
 * 掲示板一括投稿
 * request: postApiUsersPostsManualPosts
 * url: postApiUsersPostsManualPostsURL
 * method: postApiUsersPostsManualPosts_TYPE
 * raw_url: postApiUsersPostsManualPosts_RAW_URL
 * @param attributes - 投稿サイト
 */
export const postApiUsersPostsManualPosts = function(parameters = {}) {
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  const config = parameters.$config
  let path = '/api/users/posts/manual-posts'
  let body
  let queryParameters = {}
  let form = {}
  if (parameters['attributes'] !== undefined) {
    body = parameters['attributes']
  }
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    });
  }
  return request('post', domain + path, body, queryParameters, form, config)
}
export const postApiUsersPostsManualPosts_RAW_URL = function() {
  return '/api/users/posts/manual-posts'
}
export const postApiUsersPostsManualPosts_TYPE = function() {
  return 'post'
}
export const postApiUsersPostsManualPostsURL = function(parameters = {}) {
  let queryParameters = {}
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  let path = '/api/users/posts/manual-posts'
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    })
  }
  let keys = Object.keys(queryParameters)
  return domain + path + (keys.length > 0 ? '?' + (keys.map(key => key + '=' + encodeURIComponent(queryParameters[key])).join('&')) : '')
}
/**
 * 掲示板DB検索
 * request: postApiUsersSearchDb
 * url: postApiUsersSearchDbURL
 * method: postApiUsersSearchDb_TYPE
 * raw_url: postApiUsersSearchDb_RAW_URL
 * @param attributes - 検索クエリ
 */
export const postApiUsersSearchDb = function(parameters = {}) {
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  const config = parameters.$config
  let path = '/api/users/search/db'
  let body
  let queryParameters = {}
  let form = {}
  if (parameters['attributes'] !== undefined) {
    body = parameters['attributes']
  }
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    });
  }
  return request('post', domain + path, body, queryParameters, form, config)
}
export const postApiUsersSearchDb_RAW_URL = function() {
  return '/api/users/search/db'
}
export const postApiUsersSearchDb_TYPE = function() {
  return 'post'
}
export const postApiUsersSearchDbURL = function(parameters = {}) {
  let queryParameters = {}
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  let path = '/api/users/search/db'
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    })
  }
  let keys = Object.keys(queryParameters)
  return domain + path + (keys.length > 0 ? '?' + (keys.map(key => key + '=' + encodeURIComponent(queryParameters[key])).join('&')) : '')
}
/**
 * 掲示板キーワード検索
 * request: postApiUsersSearchKeyword
 * url: postApiUsersSearchKeywordURL
 * method: postApiUsersSearchKeyword_TYPE
 * raw_url: postApiUsersSearchKeyword_RAW_URL
 * @param attributes - 検索クエリ
 */
export const postApiUsersSearchKeyword = function(parameters = {}) {
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  const config = parameters.$config
  let path = '/api/users/search/keyword'
  let body
  let queryParameters = {}
  let form = {}
  if (parameters['attributes'] !== undefined) {
    body = parameters['attributes']
  }
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    });
  }
  return request('post', domain + path, body, queryParameters, form, config)
}
export const postApiUsersSearchKeyword_RAW_URL = function() {
  return '/api/users/search/keyword'
}
export const postApiUsersSearchKeyword_TYPE = function() {
  return 'post'
}
export const postApiUsersSearchKeywordURL = function(parameters = {}) {
  let queryParameters = {}
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  let path = '/api/users/search/keyword'
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    })
  }
  let keys = Object.keys(queryParameters)
  return domain + path + (keys.length > 0 ? '?' + (keys.map(key => key + '=' + encodeURIComponent(queryParameters[key])).join('&')) : '')
}
/**
 * 掲示板リアルタイム検索
 * request: postApiUsersSearchRealtime
 * url: postApiUsersSearchRealtimeURL
 * method: postApiUsersSearchRealtime_TYPE
 * raw_url: postApiUsersSearchRealtime_RAW_URL
 * @param attributes - 
 */
export const postApiUsersSearchRealtime = function(parameters = {}) {
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  const config = parameters.$config
  let path = '/api/users/search/realtime'
  let body
  let queryParameters = {}
  let form = {}
  if (parameters['attributes'] !== undefined) {
    body = parameters['attributes']
  }
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    });
  }
  return request('post', domain + path, body, queryParameters, form, config)
}
export const postApiUsersSearchRealtime_RAW_URL = function() {
  return '/api/users/search/realtime'
}
export const postApiUsersSearchRealtime_TYPE = function() {
  return 'post'
}
export const postApiUsersSearchRealtimeURL = function(parameters = {}) {
  let queryParameters = {}
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  let path = '/api/users/search/realtime'
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    })
  }
  let keys = Object.keys(queryParameters)
  return domain + path + (keys.length > 0 ? '?' + (keys.map(key => key + '=' + encodeURIComponent(queryParameters[key])).join('&')) : '')
}
/**
 * 掲示板検索結果
 * request: postApiUsersSearchResult
 * url: postApiUsersSearchResultURL
 * method: postApiUsersSearchResult_TYPE
 * raw_url: postApiUsersSearchResult_RAW_URL
 * @param attributes - 
 */
export const postApiUsersSearchResult = function(parameters = {}) {
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  const config = parameters.$config
  let path = '/api/users/search/result'
  let body
  let queryParameters = {}
  let form = {}
  if (parameters['attributes'] !== undefined) {
    body = parameters['attributes']
  }
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    });
  }
  return request('post', domain + path, body, queryParameters, form, config)
}
export const postApiUsersSearchResult_RAW_URL = function() {
  return '/api/users/search/result'
}
export const postApiUsersSearchResult_TYPE = function() {
  return 'post'
}
export const postApiUsersSearchResultURL = function(parameters = {}) {
  let queryParameters = {}
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  let path = '/api/users/search/result'
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    })
  }
  let keys = Object.keys(queryParameters)
  return domain + path + (keys.length > 0 ? '?' + (keys.map(key => key + '=' + encodeURIComponent(queryParameters[key])).join('&')) : '')
}
/**
 * 掲示板検索履歴
 * request: getApiUsersSearch
 * url: getApiUsersSearchURL
 * method: getApiUsersSearch_TYPE
 * raw_url: getApiUsersSearch_RAW_URL
 */
export const getApiUsersSearch = function(parameters = {}) {
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  const config = parameters.$config
  let path = '/api/users/search'
  let body
  let queryParameters = {}
  let form = {}
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    });
  }
  return request('get', domain + path, body, queryParameters, form, config)
}
export const getApiUsersSearch_RAW_URL = function() {
  return '/api/users/search'
}
export const getApiUsersSearch_TYPE = function() {
  return 'get'
}
export const getApiUsersSearchURL = function(parameters = {}) {
  let queryParameters = {}
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  let path = '/api/users/search'
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    })
  }
  let keys = Object.keys(queryParameters)
  return domain + path + (keys.length > 0 ? '?' + (keys.map(key => key + '=' + encodeURIComponent(queryParameters[key])).join('&')) : '')
}
/**
 * サイト一覧
 * request: getApiUsersSettingsSites
 * url: getApiUsersSettingsSitesURL
 * method: getApiUsersSettingsSites_TYPE
 * raw_url: getApiUsersSettingsSites_RAW_URL
 */
export const getApiUsersSettingsSites = function(parameters = {}) {
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  const config = parameters.$config
  let path = '/api/users/settings/sites'
  let body
  let queryParameters = {}
  let form = {}
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    });
  }
  return request('get', domain + path, body, queryParameters, form, config)
}
export const getApiUsersSettingsSites_RAW_URL = function() {
  return '/api/users/settings/sites'
}
export const getApiUsersSettingsSites_TYPE = function() {
  return 'get'
}
export const getApiUsersSettingsSitesURL = function(parameters = {}) {
  let queryParameters = {}
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  let path = '/api/users/settings/sites'
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    })
  }
  let keys = Object.keys(queryParameters)
  return domain + path + (keys.length > 0 ? '?' + (keys.map(key => key + '=' + encodeURIComponent(queryParameters[key])).join('&')) : '')
}
/**
 * サイト情報更新
 * request: putApiUsersSettingsSitesById
 * url: putApiUsersSettingsSitesByIdURL
 * method: putApiUsersSettingsSitesById_TYPE
 * raw_url: putApiUsersSettingsSitesById_RAW_URL
 * @param id - 
 * @param attributes - サイト情報
 */
export const putApiUsersSettingsSitesById = function(parameters = {}) {
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  const config = parameters.$config
  let path = '/api/users/settings/sites/{id}'
  let body
  let queryParameters = {}
  let form = {}
  path = path.replace('{id}', `${parameters['id']}`)
  if (parameters['id'] === undefined) {
    return Promise.reject(new Error('Missing required  parameter: id'))
  }
  if (parameters['attributes'] !== undefined) {
    body = parameters['attributes']
  }
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    });
  }
  return request('put', domain + path, body, queryParameters, form, config)
}
export const putApiUsersSettingsSitesById_RAW_URL = function() {
  return '/api/users/settings/sites/{id}'
}
export const putApiUsersSettingsSitesById_TYPE = function() {
  return 'put'
}
export const putApiUsersSettingsSitesByIdURL = function(parameters = {}) {
  let queryParameters = {}
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  let path = '/api/users/settings/sites/{id}'
  path = path.replace('{id}', `${parameters['id']}`)
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    })
  }
  let keys = Object.keys(queryParameters)
  return domain + path + (keys.length > 0 ? '?' + (keys.map(key => key + '=' + encodeURIComponent(queryParameters[key])).join('&')) : '')
}
/**
 * 投稿データ情報
 * request: getApiUsersSettingsPosts
 * url: getApiUsersSettingsPostsURL
 * method: getApiUsersSettingsPosts_TYPE
 * raw_url: getApiUsersSettingsPosts_RAW_URL
 */
export const getApiUsersSettingsPosts = function(parameters = {}) {
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  const config = parameters.$config
  let path = '/api/users/settings/posts'
  let body
  let queryParameters = {}
  let form = {}
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    });
  }
  return request('get', domain + path, body, queryParameters, form, config)
}
export const getApiUsersSettingsPosts_RAW_URL = function() {
  return '/api/users/settings/posts'
}
export const getApiUsersSettingsPosts_TYPE = function() {
  return 'get'
}
export const getApiUsersSettingsPostsURL = function(parameters = {}) {
  let queryParameters = {}
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  let path = '/api/users/settings/posts'
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    })
  }
  let keys = Object.keys(queryParameters)
  return domain + path + (keys.length > 0 ? '?' + (keys.map(key => key + '=' + encodeURIComponent(queryParameters[key])).join('&')) : '')
}
/**
 * 投稿データ削除
 * request: deleteApiUsersSettingsPosts
 * url: deleteApiUsersSettingsPostsURL
 * method: deleteApiUsersSettingsPosts_TYPE
 * raw_url: deleteApiUsersSettingsPosts_RAW_URL
 */
export const deleteApiUsersSettingsPosts = function(parameters = {}) {
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  const config = parameters.$config
  let path = '/api/users/settings/posts'
  let body
  let queryParameters = {}
  let form = {}
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    });
  }
  return request('delete', domain + path, body, queryParameters, form, config)
}
export const deleteApiUsersSettingsPosts_RAW_URL = function() {
  return '/api/users/settings/posts'
}
export const deleteApiUsersSettingsPosts_TYPE = function() {
  return 'delete'
}
export const deleteApiUsersSettingsPostsURL = function(parameters = {}) {
  let queryParameters = {}
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  let path = '/api/users/settings/posts'
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    })
  }
  let keys = Object.keys(queryParameters)
  return domain + path + (keys.length > 0 ? '?' + (keys.map(key => key + '=' + encodeURIComponent(queryParameters[key])).join('&')) : '')
}