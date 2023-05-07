import request from '@/utils/httpRequest'

/**
 * 得到当前的用户
 * @returns
 */

export function getAllClazz() {
  return request({
    url: request.adornUrl('/exam/clazz/all'),
    method: 'get'
  }).then(res => res.data)
}
