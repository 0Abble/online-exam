import {
    getAction,
    postAction,
    putAction,
    deleteAction
} from '@/util/httpRequest'


export function clazzList() {
    return getAction('/exam/clazz/all')
}