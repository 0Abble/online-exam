package io.renren.modules.exam.entity.dto;

import io.renren.modules.exam.entity.QuestionRecordEntity;
import lombok.Data;

import java.util.List;

/**
 * @Author 3fes
 * @Date 2023/1/21 19:46
 **/
@Data
public class PaperQuestionRecordDTO {

    private String id;
    private Integer correctNum;
    private Float examScore;
    private Integer isChecked;

    private List<QuestionRecordEntity> questionRecordList;
}
