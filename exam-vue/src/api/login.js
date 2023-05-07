import {
    getAction,
    postAction,
    putAction,
    deleteAction
} from '@/util/httpRequest'


/**
 * 登录
 * @param {*} data 
 * @returns 
 */
export function login(data) {
    return postAction('/exam/login', data)
}


/**
 * 退出
 * @returns 
 */
// export function logout() {
//     return postAction('/sys/logout')
// }