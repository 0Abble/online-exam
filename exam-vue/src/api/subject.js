import {
    getAction,
    postAction,
    putAction,
    deleteAction
} from '@/util/httpRequest'


export function subjectList() {
    return getAction('/exam/subject/all')
}