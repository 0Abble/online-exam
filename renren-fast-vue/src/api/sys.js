import request from '@/utils/httpRequest'

/**
 * 得到当前的用户
 * @returns
 */
export function getCurrentUserInfo () {
  return request({
    url: request.adornUrl('/sys/user/info'),
    method: 'get'
  }).then(res => {
    return res.data
  })
}
