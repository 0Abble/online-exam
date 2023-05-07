import request from '@/utils/httpRequest'

/**
 * 得到当前的用户
 * @returns
 */

export function pageQuestionList(subjectId) {
  return request({
    url: request.adornUrl(`/exam/paper/question/list/${subjectId}`),
    method: 'get'
  }).then(res => res.data)
}

export function paperInfoByPaperId(paperId){
  return request({
    url: request.adornUrl(`/exam/paper/info/${paperId}`),
    method: 'get'
  }).then(res => res.data)
}


export function exportPaperPdf(paperId) {
  return request({
    url: request.adornUrl(`/exam/paper/export/${paperId}`),
    method: 'get',
    responseType: 'blob'
  }).then(res => res.data)
}


export function noPassPaperList(workNo) {
  return request({
    url: request.adornUrl(`/exam/paper/nopass/list/${workNo}`),
    method: 'get'
  }).then(res => res.data)
}


export function updateAffirmByIds(ids){
  return request({
    url: request.adornUrl('/exam/paper/affirm'),
    method: 'put',
    data: request.adornData(ids, false)
  })
}


export function savePaperClazzRelation(paperId, clazzId) {
  return request({
    url: request.adornUrl('/exam/paper/save/paper_clazz_relation'),
    method: 'post',
    params: {
      paperId,
      clazzId
    }
  })
}

export function getPaperClazzRelationListByPaperId(paperId) {
  return request({
    url: request.adornUrl('/exam/paper/list/paper_clazz_relation'),
    method: 'get',
    params: {
      paperId
    }
  }).then(res => res.data)
}


export function deletePaperClazzRelation(paperId, clazzId) {
  return request({
    url: request.adornUrl('/exam/paper/delete/paper_clazz_relation'),
    method: 'delete',
    params: {
      paperId,
      clazzId
    }
  })
}



export function queryPaperCorrecting(params) {
  return request({
    url: request.adornUrl('/exam/paperrecord/list/correcting'),
    method: 'get',
    params
  }).then(res => res.data)
}


export function getQuestionRecord(quesResId) {
  return request({
    url: request.adornUrl('/exam/questionrecord/list/records/'+quesResId),
    method: 'get',
  }).then(res => res.data)
}


export function savePaperQuestionRecoed(data) {
  return request({
    url: request.adornUrl('/exam/questionrecord/save/paper_question_record'),
    method: 'put',
    data: request.adornData(data, false)
  }).then(res => res.data)
}


export function queryStuScorePage(params) {
  return request({
    url: request.adornUrl('/exam/paperrecord/query/stuscore'),
    method: 'get',
    params
  }).then(res => res.data)
}
