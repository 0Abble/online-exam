import request from '@/utils/httpRequest'

/**
 * 得到当前的用户
 * @returns
 */

export function getAllQuestType() {
  return request({
    url: request.adornUrl('/exam/questiontype/all'),
    method: 'get'
  }).then(res => res.data)
}
