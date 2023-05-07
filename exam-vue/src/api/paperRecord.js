import {
    getAction,
    postAction,
    putAction,
    deleteAction
} from '@/util/httpRequest'


export function submitPaperInfo(data) {
    return postAction('/exam/paper_record/save', data)
}

export function queryPaperRecordList(data) {
    return postAction('/exam/paper_record/query', data)
}

export function questionRecordListByQuesRecId(quesRecId) {
    return getAction('/exam/paper_record/list/question/'+quesRecId)
}


export function saveObsoletePaper(data) {
    return postAction('/exam/paper_record/save/obsolete', data)
}