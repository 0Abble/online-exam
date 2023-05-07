package io.renren.modules.exam.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.exam.entity.QuestionEntity;
import io.renren.modules.exam.entity.dto.PaperDTO;
import io.renren.modules.exam.entity.dto.QuestionSelectedDTO;
import io.renren.modules.exam.entity.vo.QuestionNumVO;
import io.renren.modules.exam.entity.vo.QuestionRecordVO;

import java.util.List;
import java.util.Map;

/**
 * 题目
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-06 22:13:25
 */
public interface QuestionService extends IService<QuestionEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<QuestionNumVO> getQuestionNumWithSubjectIdGroupByType(Integer subjectId);

    List<QuestionRecordVO> getPracticeQuestionList(PaperDTO paperDTO);
}

