import {
    getAction,
    postAction,
    putAction,
    deleteAction
} from '@/util/httpRequest'


export function getQuestionNumWithSubjectIdGroupByType(subjectId) {
    return getAction('/exam/question/group_type/'+subjectId)
}

export function getPracticeQuestionList(data) {
    return postAction('/exam/question/practice', data)
}