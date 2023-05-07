import {
    getAction,
    postAction,
    putAction,
    deleteAction
} from '@/util/httpRequest'


export function getPaperList(params) {
    return getAction('/exam/paper_list', params)
}

export function getPaperByPaperId(paperId){
    return getAction('/exam/paper/'+paperId)
}

export function getPaperInfoByPaperId(paperId) {
    return getAction('/exam/paper_info', paperId)
}