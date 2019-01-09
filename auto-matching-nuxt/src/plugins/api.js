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
 * サイト一覧
 * request: getApiUsersSourceSites
 * url: getApiUsersSourceSitesURL
 * method: getApiUsersSourceSites_TYPE
 * raw_url: getApiUsersSourceSites_RAW_URL
 */
export const getApiUsersSourceSites = function (parameters = {}) {
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  const config = parameters.$config
  let path = '/api/users/source-sites'
  let body
  let queryParameters = {}
  let form = {}
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function (parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    });
  }
  return request('get', domain + path, body, queryParameters, form, config)
}
export const getApiUsersSourceSites_RAW_URL = function () {
  return '/api/users/source-sites'
}
export const getApiUsersSourceSites_TYPE = function () {
  return 'get'
}
export const getApiUsersSourceSitesURL = function (parameters = {}) {
  let queryParameters = {}
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  let path = '/api/users/source-sites'
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function (parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    })
  }
  let keys = Object.keys(queryParameters)
  return domain + path + (keys.length > 0 ? '?' + (keys.map(key => key + '=' + encodeURIComponent(queryParameters[key])).join('&')) : '')
}
/**
 * サイト情報更新
 * request: putApiUsersSourceSitesById
 * url: putApiUsersSourceSitesByIdURL
 * method: putApiUsersSourceSitesById_TYPE
 * raw_url: putApiUsersSourceSitesById_RAW_URL
 * @param id - 
 * @param attributes - サイト情報
 */
export const putApiUsersSourceSitesById = function (parameters = {}) {
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  const config = parameters.$config
  let path = '/api/users/source-sites/{id}'
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
    Object.keys(parameters.$queryParameters).forEach(function (parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    });
  }
  return request('put', domain + path, body, queryParameters, form, config)
}
export const putApiUsersSourceSitesById_RAW_URL = function () {
  return '/api/users/source-sites/{id}'
}
export const putApiUsersSourceSitesById_TYPE = function () {
  return 'put'
}
export const putApiUsersSourceSitesByIdURL = function (parameters = {}) {
  let queryParameters = {}
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  let path = '/api/users/source-sites/{id}'
  path = path.replace('{id}', `${parameters['id']}`)
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function (parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    })
  }
  let keys = Object.keys(queryParameters)
  return domain + path + (keys.length > 0 ? '?' + (keys.map(key => key + '=' + encodeURIComponent(queryParameters[key])).join('&')) : '')
}
/**
 * テンプレート一覧
 * request: getApiUsersPostsTemplates
 * url: getApiUsersPostsTemplatesURL
 * method: getApiUsersPostsTemplates_TYPE
 * raw_url: getApiUsersPostsTemplates_RAW_URL
 */
export const getApiUsersPostsTemplates = function (parameters = {}) {
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  const config = parameters.$config
  let path = '/api/users/posts/templates'
  let body
  let queryParameters = {}
  let form = {}
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function (parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    });
  }
  return request('get', domain + path, body, queryParameters, form, config)
}
export const getApiUsersPostsTemplates_RAW_URL = function () {
  return '/api/users/posts/templates'
}
export const getApiUsersPostsTemplates_TYPE = function () {
  return 'get'
}
export const getApiUsersPostsTemplatesURL = function (parameters = {}) {
  let queryParameters = {}
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  let path = '/api/users/posts/templates'
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function (parameterName) {
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
export const postApiUsersPostsTemplates = function (parameters = {}) {
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
    Object.keys(parameters.$queryParameters).forEach(function (parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    });
  }
  return request('post', domain + path, body, queryParameters, form, config)
}
export const postApiUsersPostsTemplates_RAW_URL = function () {
  return '/api/users/posts/templates'
}
export const postApiUsersPostsTemplates_TYPE = function () {
  return 'post'
}
export const postApiUsersPostsTemplatesURL = function (parameters = {}) {
  let queryParameters = {}
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  let path = '/api/users/posts/templates'
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function (parameterName) {
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
export const putApiUsersPostsTemplatesById = function (parameters = {}) {
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
    Object.keys(parameters.$queryParameters).forEach(function (parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    });
  }
  return request('put', domain + path, body, queryParameters, form, config)
}
export const putApiUsersPostsTemplatesById_RAW_URL = function () {
  return '/api/users/posts/templates/{id}'
}
export const putApiUsersPostsTemplatesById_TYPE = function () {
  return 'put'
}
export const putApiUsersPostsTemplatesByIdURL = function (parameters = {}) {
  let queryParameters = {}
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  let path = '/api/users/posts/templates/{id}'
  path = path.replace('{id}', `${parameters['id']}`)
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function (parameterName) {
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
export const deleteApiUsersPostsTemplatesById = function (parameters = {}) {
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
    Object.keys(parameters.$queryParameters).forEach(function (parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    });
  }
  return request('delete', domain + path, body, queryParameters, form, config)
}
export const deleteApiUsersPostsTemplatesById_RAW_URL = function () {
  return '/api/users/posts/templates/{id}'
}
export const deleteApiUsersPostsTemplatesById_TYPE = function () {
  return 'delete'
}
export const deleteApiUsersPostsTemplatesByIdURL = function (parameters = {}) {
  let queryParameters = {}
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  let path = '/api/users/posts/templates/{id}'
  path = path.replace('{id}', `${parameters['id']}`)
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function (parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    })
  }
  let keys = Object.keys(queryParameters)
  return domain + path + (keys.length > 0 ? '?' + (keys.map(key => key + '=' + encodeURIComponent(queryParameters[key])).join('&')) : '')
}
/**
 * 掲示板投稿
 * request: postApiUsersPostsManualPosts
 * url: postApiUsersPostsManualPostsURL
 * method: postApiUsersPostsManualPosts_TYPE
 * raw_url: postApiUsersPostsManualPosts_RAW_URL
 * @param attributes - 投稿サイト
 */
export const postApiUsersPostsManualPosts = function (parameters = {}) {
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
    Object.keys(parameters.$queryParameters).forEach(function (parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    });
  }
  return request('post', domain + path, body, queryParameters, form, config)
}
export const postApiUsersPostsManualPosts_RAW_URL = function () {
  return '/api/users/posts/manual-posts'
}
export const postApiUsersPostsManualPosts_TYPE = function () {
  return 'post'
}
export const postApiUsersPostsManualPostsURL = function (parameters = {}) {
  let queryParameters = {}
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  let path = '/api/users/posts/manual-posts'
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function (parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    })
  }
  let keys = Object.keys(queryParameters)
  return domain + path + (keys.length > 0 ? '?' + (keys.map(key => key + '=' + encodeURIComponent(queryParameters[key])).join('&')) : '')
}