import {
    getAction,
    postAction,
    putAction,
    deleteAction
} from '@/util/httpRequest'


export function getUserInfo() {
    return getAction('/exam/user_info')
}

export function getTeacherList() {
    return getAction('/exam/user/teacher')
}