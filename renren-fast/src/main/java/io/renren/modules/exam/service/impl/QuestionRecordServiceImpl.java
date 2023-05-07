package io.renren.modules.exam.service.impl;

import io.renren.modules.exam.dao.PaperDao;
import io.renren.modules.exam.dao.PaperRecordDao;
import io.renren.modules.exam.entity.PaperEntity;
import io.renren.modules.exam.entity.PaperRecordEntity;
import io.renren.modules.exam.entity.QuestionTypeEntity;
import io.renren.modules.exam.entity.dto.PaperQuestionRecordDTO;
import io.renren.modules.exam.entity.vo.QuestionRecordList;
import io.renren.modules.exam.entity.vo.QuestionRecordVO;
import io.renren.modules.exam.service.PaperRecordService;
import io.renren.modules.exam.service.PaperService;
import io.renren.modules.exam.service.QuestionTypeService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.exam.dao.QuestionRecordDao;
import io.renren.modules.exam.entity.QuestionRecordEntity;
import io.renren.modules.exam.service.QuestionRecordService;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


@Service("questionRecordService")
public class QuestionRecordServiceImpl extends ServiceImpl<QuestionRecordDao, QuestionRecordEntity> implements QuestionRecordService {


    @Resource
    private PaperRecordDao paperRecordDao;

    @Autowired
    private QuestionTypeService questionTypeService;

    @Resource
    private PaperDao paperDao;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<QuestionRecordEntity> page = this.page(
                new Query<QuestionRecordEntity>().getPage(params),
                new QueryWrapper<QuestionRecordEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public List<QuestionRecordVO> questionRecordsByQuesResId(String quesResId) {
        List<QuestionRecordVO> recordVOList = new ArrayList<>();
        List<QuestionTypeEntity> questionTypeList = questionTypeService.getBaseMapper().selectList(new QueryWrapper<QuestionTypeEntity>().eq("is_deleted", 0).orderByAsc("sort"));
        questionTypeList.forEach(item -> {
            QuestionRecordVO questionRecordVO = new QuestionRecordVO();
            questionRecordVO.setTypeId(item.getId());
            questionRecordVO.setTypeName(item.getTypeName());
            List<QuestionRecordList> list = baseMapper.questionRecordsByQuesResId(quesResId, item.getId());
            questionRecordVO.setRecord(list);
            recordVOList.add(questionRecordVO);
        });
        return recordVOList;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void savePaperQuestionRecord(PaperQuestionRecordDTO paperQuestionRecordDTO) {
        PaperRecordEntity paperRecordEntity = new PaperRecordEntity();
        BeanUtils.copyProperties(paperQuestionRecordDTO, paperRecordEntity);
        PaperEntity paperEntity = paperDao.selectById(paperRecordDao.selectById(paperRecordEntity.getId()).getPaperId());
        paperRecordEntity.setIsChecked(paperEntity.getPassMark() > paperQuestionRecordDTO.getExamScore() ? -1 : 1);
        paperRecordDao.updateById(paperRecordEntity);
        this.updateBatchById(paperQuestionRecordDTO.getQuestionRecordList());
    }

}
