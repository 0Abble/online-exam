import {
    getAction,
    postAction,
    putAction,
    deleteAction
} from '@/util/httpRequest'


export function getNoticeList() {
    return getAction('/exam/notice/list')
}
