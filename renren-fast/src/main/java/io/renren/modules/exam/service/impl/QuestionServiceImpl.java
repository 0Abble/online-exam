package io.renren.modules.exam.service.impl;

import io.renren.modules.exam.entity.QuestionTypeEntity;
import io.renren.modules.exam.entity.dto.PaperDTO;
import io.renren.modules.exam.entity.dto.QuestionSelectedDTO;
import io.renren.modules.exam.entity.vo.QuestionNumVO;
import io.renren.modules.exam.entity.vo.QuestionRecordList;
import io.renren.modules.exam.entity.vo.QuestionRecordVO;
import io.renren.modules.exam.service.QuestionTypeService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.exam.dao.QuestionDao;
import io.renren.modules.exam.entity.QuestionEntity;
import io.renren.modules.exam.service.QuestionService;
import org.springframework.util.StringUtils;


@Service("questionService")
public class QuestionServiceImpl extends ServiceImpl<QuestionDao, QuestionEntity> implements QuestionService {

    @Autowired
    private BaseService baseService;

    @Autowired
    private QuestionTypeService questionTypeService;


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String key = (String) params.get("key");
        String typeId = (String) params.get("typeId");
        String subjectId = (String) params.get("subjectId");

        QueryWrapper<QuestionEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("is_deleted", 0);
        wrapper.orderByDesc("create_time");
        if (StringUtils.hasText(key)) {
            wrapper.like("question_title", key);
        }
        if (StringUtils.hasText(typeId)) {
            wrapper.eq("question_type_id", typeId);
        }
        if (StringUtils.hasText(subjectId)) {
            wrapper.eq("subject_id", subjectId);
        }

        IPage<QuestionEntity> page = this.page(
                new Query<QuestionEntity>().getPage(params),
                wrapper
        );
        page.setRecords(baseService.relation(page));
        return new PageUtils(page);
    }

    @Override
    public List<QuestionNumVO> getQuestionNumWithSubjectIdGroupByType(Integer subjectId) {
        return baseMapper.getQuestionNumWithSubjectIdGroupByType(subjectId);
    }

    @Override
    public List<QuestionRecordVO> getPracticeQuestionList(PaperDTO paperDTO) {

        List<QuestionRecordVO> resultLis = new ArrayList<>();

        Integer subjectId = paperDTO.getSubjectId();
        List<QuestionSelectedDTO> seleted = paperDTO.getSeleted();
        seleted.forEach(item -> {
            QuestionRecordVO questionRecordVO = new QuestionRecordVO();
            questionRecordVO.setTypeName(item.getTypeName());
            questionRecordVO.setTypeId(item.getQuestionTypeId());
            List<QuestionRecordList> record = new ArrayList<>();
            Set<Integer> questionIds = new HashSet<>();
            List<QuestionEntity> questionEntities = baseMapper.selectList(new QueryWrapper<QuestionEntity>()
                    .eq("is_deleted", 0)
                    .eq("subject_id", subjectId)
                    .eq("question_type_id", item.getQuestionTypeId()));
            while (questionIds.size() != item.getSelectVal()) {
                int num = (int)(Math.random()*questionEntities.size());
                questionIds.add(questionEntities.get(num).getId());
            }
            questionEntities.forEach(ques -> {
                if (questionIds.contains(ques.getId())) {
                    QuestionRecordList temp = new QuestionRecordList();
                    BeanUtils.copyProperties(ques, temp);
                    record.add(temp);
                }
            });
            questionRecordVO.setRecord(record);
            resultLis.add(questionRecordVO);
        });
        System.out.println("resultLis: "+resultLis.toString());
        return resultLis;
    }

}
