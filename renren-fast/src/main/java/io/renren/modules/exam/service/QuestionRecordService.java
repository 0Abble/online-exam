package io.renren.modules.exam.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.exam.entity.QuestionRecordEntity;
import io.renren.modules.exam.entity.dto.PaperQuestionRecordDTO;
import io.renren.modules.exam.entity.vo.QuestionRecordVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 考试记录 题目记录
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-17 15:25:52
 */
public interface QuestionRecordService extends IService<QuestionRecordEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<QuestionRecordVO> questionRecordsByQuesResId(String quesResId);

    void savePaperQuestionRecord(PaperQuestionRecordDTO paperQuestionRecordDTO);
}

