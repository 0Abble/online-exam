package io.renren.modules.exam.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.renren.common.constant.ExamConstant;
import io.renren.modules.exam.dao.PaperClazzDao;
import io.renren.modules.exam.dao.QuestionDao;
import io.renren.modules.exam.entity.*;
import io.renren.modules.exam.entity.dto.PaperDTO;
import io.renren.modules.exam.entity.vo.PaperInfoVO;
import io.renren.modules.exam.entity.vo.PaperQuestionVO;
import io.renren.modules.exam.entity.vo.QuestionItemInfo;
import io.renren.modules.exam.entity.vo.QuestionNumVO;
import io.renren.modules.exam.service.*;
import io.renren.util.JWTTokenUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.exam.dao.PaperDao;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;


@Service("paperService")
public class PaperServiceImpl extends ServiceImpl<PaperDao, PaperEntity> implements PaperService {

    @Resource
    private QuestionDao questionDao;

    @Autowired
    private PaperQuestionService paperQuestionService;

    @Autowired
    private QuestionTypeService questionTypeService;

    @Resource
    private PaperClazzDao paperClazzDao;

    @Autowired
    private PaperRecordService paperRecordService;
    @Autowired
    private StudentService studentService;

    @Autowired
    private BaseService baseService;


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String isNoChecked = (String) params.get("isNoChecked");
        String title = (String) params.get("title");
        String major = (String) params.get("major");
        String subjectId = (String) params.get("subjectId");
        QueryWrapper<PaperEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("is_deleted", 0);
        if (StringUtils.hasText(isNoChecked)) {
            wrapper.ne("is_checked", isNoChecked);
        }
        if (StringUtils.hasText(title)) {
            wrapper.eq("paper_title", title);
        }
        if (StringUtils.hasText(major)) {
            wrapper.eq("major_id", major);
        }
        if (StringUtils.hasText(subjectId)) {
            wrapper.eq("subject_id", subjectId);
        }
        IPage<PaperEntity> page = this.page(
                new Query<PaperEntity>().getPage(params),
                wrapper
        );
        page.setRecords(baseService.relation(page));
        return new PageUtils(page);
    }

    @Override
    public List<PaperQuestionVO> getPageQuestionList(Integer subjectId) {
        List<PaperQuestionVO> result = new ArrayList<>();
        List<QuestionNumVO> questionNumVOList = questionDao.getQuestionNumListBySubjectId(subjectId);
        questionNumVOList.forEach(item -> {
            PaperQuestionVO tempPageQuestion = new PaperQuestionVO();
            tempPageQuestion.setQuestionTypeId(item.getQuestionTypeId());
            tempPageQuestion.setQuestionTypeName(item.getTypeName());
            if (!result.contains(tempPageQuestion)) {
                result.add(tempPageQuestion);
            }
        });
        result.forEach(pageQuestion -> {
            List<QuestionNumVO> questionNumList = new ArrayList<>();
            questionNumVOList.forEach(questionNumVO -> {
                if (pageQuestion.getQuestionTypeId().equals(questionNumVO.getQuestionTypeId())) {
                    questionNumList.add(questionNumVO);
                }
            });
            pageQuestion.setQuestionNumList(questionNumList);
        });

        return result;
    }

    @Transactional(
            rollbackFor = Exception.class
    )
    @Override
    public void savePaperInfo(PaperDTO paperDTO) {
        PaperEntity paperEntity = new PaperEntity();
        BeanUtils.copyProperties(paperDTO, paperEntity);
        paperEntity.setExamDateStart(DateUtil.parse(paperDTO.getExamDateStart(), "yyyy-MM-dd"));
        paperEntity.setExamDateEnd(DateUtil.parse(paperDTO.getExamDateEnd(), "yyyy-MM-dd"));
        baseMapper.insert(paperEntity);
        List<PaperQuestionEntity> paperQuestionEntityList =  new ArrayList<>();
        Set<Integer> questionIds = new HashSet<>();
        paperDTO.getSeleted().forEach(item -> {
            List<QuestionEntity> questionEntities = questionDao.selectList(new QueryWrapper<QuestionEntity>()
                    .eq("is_deleted", 0)
                    .eq("subject_id", paperEntity.getSubjectId())
                    .eq("question_type_id", item.getQuestionTypeId())
                    .eq("score", item.getScore()));
            Set<Integer> tempQuestionIds = new HashSet<>();
            while (tempQuestionIds.size() != item.getSelectVal()) {
                int num = (int)(Math.random()*questionEntities.size());
                tempQuestionIds.add(questionEntities.get(num).getId());
            }
            questionIds.addAll(tempQuestionIds);
        });
        questionIds.forEach(item -> {
            PaperQuestionEntity paperQuestionEntity = new PaperQuestionEntity();
            paperQuestionEntity.setPaperId(paperEntity.getId());
            paperQuestionEntity.setQuestionId(item);
            paperQuestionEntityList.add(paperQuestionEntity);
        });
        paperQuestionService.saveBatch(paperQuestionEntityList);
    }

    @Override
    public PaperInfoVO getPaperInfoByPaperId(String paperId) {
        PaperEntity paperEntity = baseMapper.selectById(paperId);
        PaperInfoVO paperInfoVO = new PaperInfoVO();
        BeanUtils.copyProperties(paperEntity, paperInfoVO);

        List<Integer> questionIds = paperQuestionService.getBaseMapper()
                .selectList(
                        new QueryWrapper<PaperQuestionEntity>().eq("paper_id", paperId)).stream().map(item -> item.getQuestionId()).collect(Collectors.toList()
                );

        List<QuestionItemInfo> questionItemInfos = new ArrayList<>();
        List<QuestionTypeEntity> questionTypeList = questionTypeService.getBaseMapper().selectList(new QueryWrapper<QuestionTypeEntity>().eq("is_deleted", 0).orderByAsc("sort"));
        questionTypeList.forEach(item -> {
            QuestionItemInfo tempQuestionItemInfo = new QuestionItemInfo();
            BeanUtils.copyProperties(item, tempQuestionItemInfo);
            tempQuestionItemInfo.setList(
                    questionDao.selectList(new QueryWrapper<QuestionEntity>().eq("is_deleted", 0).eq("question_type_id", item.getId()).in("id", questionIds))
            );
            questionItemInfos.add(tempQuestionItemInfo);
        });
        paperInfoVO.setQuestionList(questionItemInfos);
        return paperInfoVO;
    }

    @Override
    public void updateBatchAffirmByIds(List<String> ids, String updateBy) {
        List<PaperEntity> paperList = new ArrayList<>();
        ids.forEach(id -> {
            PaperEntity paperEntity = new PaperEntity();
            paperEntity.setId(id);
            paperEntity.setIsAffirm(1);
            paperEntity.setUpdateBy(updateBy);
            paperList.add(paperEntity);
        });

        this.updateBatchById(paperList);
    }

    @Override
    public void savePaperClazzRelation(String paperId, Integer clazzId) {
        PaperClazzEntity paperClazzEntity = new PaperClazzEntity();
        paperClazzEntity.setPaperId(paperId);
        paperClazzEntity.setClazzId(clazzId);
        paperClazzDao.insert(paperClazzEntity);
    }

    @Override
    public IPage<PaperEntity> getPaperByClazzId(PaperDTO paperDTO, String clazzId, String token) throws Exception {

        String account = JWTTokenUtils.geAccountByToken(token);
        StudentEntity currentStudent = studentService.getOne(new QueryWrapper<StudentEntity>().eq("is_deleted", 0).eq("stu_no", account));

        List<String> paperIds = paperClazzDao.selectList(new QueryWrapper<PaperClazzEntity>().eq("clazz_id", clazzId)).stream().map(item -> item.getPaperId()).collect(Collectors.toList());
        baseMapper.selectBatchIds(paperIds);

        QueryWrapper<PaperEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("is_deleted", 0).in("id", paperIds);

        if (StringUtils.hasText(paperDTO.getPaperTitle())) {
            wrapper.like("paper_title", paperDTO.getPaperTitle());
        }
        if (Objects.nonNull(paperDTO.getMajorId())) {
            wrapper.eq("major_id", paperDTO.getMajorId());
        }
        if (Objects.nonNull(paperDTO.getSubjectId())) {
            wrapper.eq("subject_id", paperDTO.getSubjectId());
        }
        wrapper.eq("major_id", currentStudent.getMajor());
        IPage<PaperEntity> resultPage = this.page(
                new Page<>(paperDTO.getPageNo(), paperDTO.getPageSize()),
                wrapper
        );

        List<PaperRecordEntity> paperRecordEntities = paperRecordService.list(new QueryWrapper<PaperRecordEntity>().eq("stu_no", currentStudent.getStuNo()));
        List<PaperEntity> records = resultPage.getRecords();
        records.forEach(item -> {
            paperRecordEntities.forEach(temp -> {
                if (item.getId().equals(temp.getPaperId())) {
                    item.setAnswerNum(item.getAnswerNum() - 1);
                }
            });
        });
        resultPage.setRecords(records);
        resultPage.setRecords(baseService.relation(resultPage));
        return resultPage;
    }

    @Override
    public PaperEntity getPaperByClazzIdAndPaperId(String paperId) {
        PaperEntity paperEntity = baseMapper.selectById(paperId);
        List<PaperRecordEntity> paperRecordEntities = paperRecordService.list(new QueryWrapper<PaperRecordEntity>().eq("paper_id", paperId));
        paperEntity.setAnswerNum(paperEntity.getAnswerNum() - paperRecordEntities.size());
        return paperEntity;
    }
}
