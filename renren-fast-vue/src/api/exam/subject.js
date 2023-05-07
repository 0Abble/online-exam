import request from '@/utils/httpRequest'

/**
 * 得到当前的用户
 * @returns
 */

export function getAllSubject() {
  return request({
    url: request.adornUrl('/exam/subject/all'),
    method: 'get'
  }).then(res => res.data)
}
