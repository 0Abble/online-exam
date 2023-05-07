import request from '@/utils/httpRequest'

/**
 * 得到当前的用户
 * @returns
 */

export function getAllMajor() {
  return request({
    url: request.adornUrl('/exam/major/all'),
    method: 'get'
  }).then(res => res.data)
}
