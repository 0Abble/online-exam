import {
    getAction,
    postAction,
    putAction,
    deleteAction
} from '@/util/httpRequest'


export function majorList() {
    return getAction('/exam/major/all')
}