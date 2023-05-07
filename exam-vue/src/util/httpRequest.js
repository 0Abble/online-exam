import Vue from 'vue'
import axios from 'axios'
import router from '@/router'
import {
  getToken,
  removeToken
} from './auth'

const http = axios.create({
  timeout: 1000 * 30,
  withCredentials: true,
  headers: {
    'Content-Type': 'application/json; charset=utf-8'
  }
})

/**
 * 请求拦截
 */
http.interceptors.request.use(config => {
  config.headers['token'] = getToken() // 请求头带上token
  return config
}, error => {
  return Promise.reject(error)
})

/**
 * 响应拦截
 */
http.interceptors.response.use(response => {
  if (response.data && response.data.code === 401) { // 401, token失效
    removeToken()
    router.push({ name: 'login' })
    // router.push('/login')
  } else if (response.data.code == 503) {
    this.$notify({
      title: '警告',
      message: '服务器暂未启动',
      type: 'warning'
    });
  }
  return response.data
}, error => {
  return Promise.reject(error)
})

/**
 * 请求地址处理
 * @param {*} requestUrl 请求路径
 */
let actionUrl = (requestUrl) => {
  // 非生产环境 && 开启代理, 接口前缀统一使用[/proxyApi/]前缀做代理拦截!
  return process.env.VUE_APP_BASE_URL + requestUrl
}

http.adornUrl = (requestUrl) => {
  // 非生产环境 && 开启代理, 接口前缀统一使用[/proxyApi/]前缀做代理拦截!
  return (process.env.NODE_ENV !== 'production' && process.env.OPEN_PROXY ? '/proxyApi/' : process.env.VUE_APP_BASE_URL) + requestUrl
}


/**
 * get请求
 * @param {*} requestUrl 请求路径
 * @param {*} params 请求参数
 * @returns 
 */
export function getAction(requestUrl, params) {
  let defaults = {
    't': new Date().getTime()
  }
  params = {
    ...params,
    ...defaults
  }
  return http({
    url: actionUrl(requestUrl),
    method: 'get',
    params
  })
}

/**
 * post请求
 * @param {*} requestUrl 
 * @param {*} data 
 * @returns 
 */
export function postAction(requestUrl, data) {
  let defaults = {
    't': new Date().getTime()
  }
  return http({
    url: actionUrl(requestUrl),
    method: 'post',
    params: defaults,
    data
  })
}

/**
 * put 请求
 * @param {*} requestUrl 
 * @param {*} data 
 */
export function putAction(requestUrl, data) {
  let defaults = {
    't': new Date().getTime()
  }
  return http({
    url: actionUrl(requestUrl),
    method: 'put',
    params: defaults,
    data
  })
}

/**
 * delete请求
 * @param {*} requestUrl 
 * @param {*} params 
 */
export function deleteAction(requestUrl, params) {
  let defaults = {
    't': new Date().getTime()
  }
  params = {
    ...params,
    ...defaults
  }
  return http({
    url: actionUrl(requestUrl),
    method: 'delete',
    params
  })
}

export default http
