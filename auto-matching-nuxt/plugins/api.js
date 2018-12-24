/* eslint-disable */
import axios from 'axios'
import qs from 'qs'

let domain = process.env.apiBaseUrl
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
export const getApiUsersSourceSites = function(parameters = {}) {
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  const config = parameters.$config
  let path = '/api/users/source-sites'
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
export const getApiUsersSourceSites_RAW_URL = function() {
  return '/api/users/source-sites'
}
export const getApiUsersSourceSites_TYPE = function() {
  return 'get'
}
export const getApiUsersSourceSitesURL = function(parameters = {}) {
  let queryParameters = {}
  const domain = parameters.$domain ? parameters.$domain : getDomain()
  let path = '/api/users/source-sites'
  if (parameters.$queryParameters) {
    Object.keys(parameters.$queryParameters).forEach(function(parameterName) {
      queryParameters[parameterName] = parameters.$queryParameters[parameterName]
    })
  }
  let keys = Object.keys(queryParameters)
  return domain + path + (keys.length > 0 ? '?' + (keys.map(key => key + '=' + encodeURIComponent(queryParameters[key])).join('&')) : '')
}
